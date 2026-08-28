#!/usr/bin/env python3
"""Email a compiled Weekly AI Brief to everyone in the recipient CSV.

Credentials are read from the environment, falling back to a .env file in
Weekly_AI_Reports/ (see .env.example). Nothing is hardcoded here.

    python3 scripts/send_report.py --pdf 2026-08-25/report.pdf --dry-run
    python3 scripts/send_report.py --pdf 2026-08-25/report.pdf
"""
from __future__ import annotations

import argparse
import csv
import mimetypes
import os
import re
import smtplib
import sys
from email.message import EmailMessage
from pathlib import Path

REPORT_ROOT = Path(__file__).resolve().parent.parent
DEFAULT_CSV = REPORT_ROOT / "List_Of_People_To_Send_To.csv"
EMAIL_RE = re.compile(r"^[^@\s]+@[^@\s]+\.[^@\s]+$")


def load_dotenv(path: Path) -> None:
    """Populate os.environ from a KEY=VALUE file. Existing vars win."""
    if not path.is_file():
        return
    for line in path.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, _, value = line.partition("=")
        os.environ.setdefault(key.strip(), value.strip().strip("'\""))


def read_recipients(csv_path: Path) -> list[tuple[str, str]]:
    """Return [(name, email)] from the CSV. Tolerates a UTF-8 BOM."""
    if not csv_path.is_file():
        sys.exit(f"error: recipient list not found: {csv_path}")

    people: list[tuple[str, str]] = []
    with csv_path.open(newline="", encoding="utf-8-sig") as handle:
        reader = csv.DictReader(handle)
        fields = {(f or "").strip().lower(): f for f in (reader.fieldnames or [])}
        if "email" not in fields:
            sys.exit(f"error: {csv_path} has no 'Email' column (found: {reader.fieldnames})")
        name_field = fields.get("name")
        for row_no, row in enumerate(reader, start=2):
            email = (row.get(fields["email"]) or "").strip()
            if not email:
                continue
            if not EMAIL_RE.match(email):
                sys.exit(f"error: {csv_path}:{row_no} is not a valid address: {email!r}")
            name = (row.get(name_field) or "").strip() if name_field else ""
            people.append((name or email.split("@")[0], email))

    if not people:
        sys.exit(f"error: no recipients in {csv_path}")
    return people


def default_body(name: str, week: str) -> str:
    first = name.split()[0] if name else "there"
    return (
        f"Hi {first},\n\n"
        f"Attached is this week's AI brief covering {week}: the papers, model "
        "releases, benchmark movements and policy changes worth knowing about, "
        "in three to five pages.\n\n"
        "Every figure in it was read from the linked primary source. Sources are "
        "listed in the final section.\n\n"
        "Best,\nClaude\n"
    )


def build_message(sender: str, name: str, email: str, subject: str,
                  body: str, pdf: Path) -> EmailMessage:
    msg = EmailMessage()
    msg["From"] = sender
    msg["To"] = f"{name} <{email}>" if name else email
    msg["Subject"] = subject
    msg.set_content(body)

    ctype, _ = mimetypes.guess_type(pdf.name)
    maintype, _, subtype = (ctype or "application/pdf").partition("/")
    msg.add_attachment(pdf.read_bytes(), maintype=maintype,
                       subtype=subtype, filename=pdf.name)
    return msg


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--pdf", required=True, type=Path, help="compiled report PDF")
    parser.add_argument("--csv", type=Path, default=DEFAULT_CSV, help="recipient list")
    parser.add_argument("--week", default="", help="week label used in subject and body")
    parser.add_argument("--subject", default="", help="override the subject line")
    parser.add_argument("--body-file", type=Path, help="plain-text body; overrides the default")
    parser.add_argument("--dry-run", action="store_true",
                        help="print what would be sent, connect to nothing")
    args = parser.parse_args()

    pdf = args.pdf if args.pdf.is_absolute() else (Path.cwd() / args.pdf)
    if not pdf.is_file():
        sys.exit(f"error: PDF not found: {pdf}")
    if pdf.stat().st_size < 10_000:
        sys.exit(f"error: {pdf} is {pdf.stat().st_size} bytes -- looks like a failed build")

    load_dotenv(REPORT_ROOT / ".env")
    login_user = os.environ.get("WEEKLY_AI_SMTP_USER", "")
    password = os.environ.get("WEEKLY_AI_SMTP_PASS", "")
    # Relays like Mandrill authenticate as an account, not as the sender address.
    # WEEKLY_AI_SMTP_FROM overrides the From header; it defaults to the login user.
    sender = os.environ.get("WEEKLY_AI_SMTP_FROM", "").strip() or login_user
    server_host = os.environ.get("WEEKLY_AI_SMTP_SERVER", "smtp.office365.com")
    server_port = int(os.environ.get("WEEKLY_AI_SMTP_PORT", "587"))

    if not args.dry_run and not (login_user and password):
        sys.exit("error: set WEEKLY_AI_SMTP_USER and WEEKLY_AI_SMTP_PASS "
                 f"(env or {REPORT_ROOT / '.env'})")

    week = args.week or pdf.parent.name
    subject = args.subject or f"Weekly AI Brief - {week}"
    override_body = args.body_file.read_text(encoding="utf-8") if args.body_file else None
    people = read_recipients(args.csv)

    print(f"report:     {pdf}  ({pdf.stat().st_size / 1024:.0f} KiB)")
    print(f"recipients: {len(people)} from {args.csv}")
    print(f"subject:    {subject}")
    print(f"from:       {sender}  (auth as {login_user} via {server_host})")

    if args.dry_run:
        for name, email in people:
            print(f"  [dry-run] would send to {name} <{email}>")
        return 0

    failures: list[str] = []
    with smtplib.SMTP(server_host, server_port, timeout=60) as smtp:
        smtp.starttls()
        smtp.login(login_user, password)
        for name, email in people:
            body = override_body or default_body(name, week)
            try:
                smtp.send_message(build_message(sender, name, email, subject, body, pdf))
                print(f"  sent -> {email}")
            except smtplib.SMTPException as exc:
                failures.append(email)
                print(f"  FAILED -> {email}: {exc}", file=sys.stderr)

    if failures:
        print(f"\n{len(failures)} of {len(people)} failed: {', '.join(failures)}", file=sys.stderr)
        return 1
    print(f"\nsent to all {len(people)} recipients.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
