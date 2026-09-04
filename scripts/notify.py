#!/usr/bin/env python3
"""Email a short operational alert about the Weekly AI Brief pipeline.

The weekly run is unattended, so a failure is invisible until someone notices the
brief never arrived -- the 2026-09-01 issue died at 15:00:05 and was not spotted
for three days. This sends the owner a one-screen alert the moment a run fails.

Deliberately carries NO log contents. The run log is the verbatim transcript of an
agent that reads .env and the recipient CSV during the same run, so it can quote a
credential or an address; mailing it through a third-party relay would undo the
work done to keep those off the wire. Callers pass a message they wrote themselves,
and the alert points at the log path instead of quoting it.

    python3 scripts/notify.py --subject "run failed" --message "no PDF produced"
"""
from __future__ import annotations

import argparse
import os
import smtplib
import socket
import sys
from datetime import datetime
from email.message import EmailMessage
from pathlib import Path

REPORT_ROOT = Path(__file__).resolve().parent.parent


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


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--subject", required=True)
    parser.add_argument("--message", required=True,
                        help="caller-authored text; never pipe a log into this")
    parser.add_argument("--log-path", default="", help="named in the body, not read")
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    load_dotenv(REPORT_ROOT / ".env")
    to_addr = os.environ.get("WEEKLY_AI_ALERT_TO", "").strip()
    login_user = os.environ.get("WEEKLY_AI_SMTP_USER", "")
    password = os.environ.get("WEEKLY_AI_SMTP_PASS", "")
    sender = os.environ.get("WEEKLY_AI_SMTP_FROM", "").strip() or login_user
    host = os.environ.get("WEEKLY_AI_SMTP_SERVER", "smtp.office365.com")
    port = int(os.environ.get("WEEKLY_AI_SMTP_PORT", "587"))

    # No alert address configured is a setup gap, not a crash: the caller is already
    # failing and must not be made to fail differently because alerting is unset.
    if not to_addr:
        print("notify: WEEKLY_AI_ALERT_TO is not set in .env -- no alert sent",
              file=sys.stderr)
        return 0

    body = (
        f"{args.message}\n\n"
        f"host:  {socket.gethostname()}\n"
        f"when:  {datetime.now().astimezone().isoformat(timespec='seconds')}\n"
    )
    if args.log_path:
        body += f"log:   {args.log_path}\n"
    body += (
        "\nThe log is not attached on purpose -- it can quote credentials and "
        "recipient addresses. Read it on the machine.\n"
    )

    msg = EmailMessage()
    msg["From"] = sender
    msg["To"] = to_addr
    msg["Subject"] = f"[Weekly AI Brief] {args.subject}"
    msg.set_content(body)

    if args.dry_run:
        print(f"[dry-run] to {to_addr} via {host}\nSubject: {msg['Subject']}\n\n{body}")
        return 0

    if not (login_user and password):
        print("notify: SMTP credentials missing -- no alert sent", file=sys.stderr)
        return 0

    try:
        with smtplib.SMTP(host, port, timeout=60) as smtp:
            smtp.starttls()
            smtp.login(login_user, password)
            smtp.send_message(msg)
    except (smtplib.SMTPException, OSError) as exc:
        # Alerting is best-effort. If it dies too, say so on stderr and let the
        # caller's own non-zero exit stand.
        print(f"notify: could not send alert: {exc}", file=sys.stderr)
        return 0

    print(f"notify: alert sent to {to_addr}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
