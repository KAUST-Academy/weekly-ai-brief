#!/usr/bin/env python3
"""Verify report.tex and SOURCES.md reference each other exactly, both directions.

A dangling \\srcref means a claim lost its evidence during editing; an uncited row
means a source was gathered and then quietly dropped. Both are failures.

    python3 scripts/check_sources.py 2026-08-25
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

PLACEHOLDERS = ("% >>> REPLACE", "Headline one", "XXXX.XXXXX", "example.com", "Paper title")


def cited_numbers(tex: str) -> set[int]:
    """Every source number the report actually renders."""
    # Drop the macro definitions themselves -- they are not citations.
    body = re.sub(r"\\newcommand\{\\srcref\}.*", "", tex)
    body = re.sub(r"\\newcommand\{\\entry\}.*?\\vspace\{0\.15em\}\}", "", body, flags=re.S)

    direct = {int(n) for n in re.findall(r"\\srcref\{(\d+)\}", body)}
    # \entry{title}{who}{url}{n} emits \srcref{n} through its fourth argument.
    via_entry = {int(n) for n in re.findall(r"\\entry\{.*?\}\{.*?\}\{.*?\}\{(\d+)\}", body)}
    return direct | via_entry


def listed_numbers(md: str) -> set[int]:
    return {int(n) for n in re.findall(r"^\|\s*S(\d+)\s*\|", md, flags=re.M)}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("folder", type=Path, help="the issue's dated folder")
    args = parser.parse_args()

    folder = args.folder if args.folder.is_absolute() else (Path.cwd() / args.folder)
    tex_path, md_path = folder / "report.tex", folder / "SOURCES.md"
    for path in (tex_path, md_path):
        if not path.is_file():
            sys.exit(f"error: {path} not found")

    tex = tex_path.read_text(encoding="utf-8")
    cited = cited_numbers(tex)
    listed = listed_numbers(md_path.read_text(encoding="utf-8"))

    dangling = sorted(cited - listed)
    uncited = sorted(listed - cited)
    stale = [p for p in PLACEHOLDERS if p in tex]

    print(f"cited in report.tex : {sorted(cited)}")
    print(f"rows in SOURCES.md  : {sorted(listed)}")

    ok = True
    if dangling:
        print(f"\nDANGLING: \\srcref{{{dangling}}} has no row in SOURCES.md", file=sys.stderr)
        ok = False
    if uncited:
        print(f"\nUNCITED: SOURCES.md rows {uncited} are never referenced in the report",
              file=sys.stderr)
        ok = False
    if stale:
        print(f"\nPLACEHOLDER TEXT still in report.tex: {stale}", file=sys.stderr)
        ok = False

    print("\nsources check: PASS" if ok else "\nsources check: FAIL")
    return 0 if ok else 2


if __name__ == "__main__":
    raise SystemExit(main())
