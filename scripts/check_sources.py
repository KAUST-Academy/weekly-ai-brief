#!/usr/bin/env python3
"""Verify report.tex and SOURCES.md reference each other exactly, both directions.

A dangling \srcref means a claim lost its evidence during editing; an uncited row
means a source was gathered and then quietly dropped. Both are failures.

The source log is also structural evidence: source IDs must be unique, contiguous from
S1, and listed in ascending order. That keeps the audit trail deterministic and prevents
duplicate or missing IDs from being hidden by set-based comparison.

    python3 scripts/check_sources.py 2026/08/25
"""
from __future__ import annotations

import argparse
import re
import sys
from collections import Counter
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


def listed_number_sequence(md: str) -> list[int]:
    """Source IDs in file order, preserving duplicates for structural checks."""
    return [int(n) for n in re.findall(r"^\|\s*S(\d+)\s*\|", md, flags=re.M)]


def listed_numbers(md: str) -> set[int]:
    """Every source ID present in SOURCES.md."""
    return set(listed_number_sequence(md))


def numbering_errors(sequence: list[int]) -> list[str]:
    """Return structural errors in the S1..Sn source numbering."""
    if not sequence:
        return ["NO SOURCES: SOURCES.md contains no S-numbered source rows"]

    errors: list[str] = []
    counts = Counter(sequence)

    invalid = sorted(n for n in counts if n < 1)
    if invalid:
        errors.append(f"INVALID: source IDs must start at S1, found {invalid}")

    duplicates = sorted(n for n, count in counts.items() if count > 1)
    if duplicates:
        errors.append(f"DUPLICATE: SOURCES.md repeats source IDs {duplicates}")

    missing = [n for n in range(1, max(sequence) + 1) if n not in counts]
    if missing:
        errors.append(f"GAP: source IDs must be contiguous from S1; missing {missing}")

    if sequence != sorted(sequence):
        errors.append("ORDER: source rows must appear in ascending S-number order")

    return errors


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
    md = md_path.read_text(encoding="utf-8")
    cited = cited_numbers(tex)
    sequence = listed_number_sequence(md)
    listed = set(sequence)

    dangling = sorted(cited - listed)
    uncited = sorted(listed - cited)
    stale = [p for p in PLACEHOLDERS if p in tex]
    structure = numbering_errors(sequence)

    print(f"cited in report.tex : {sorted(cited)}")
    print(f"rows in SOURCES.md  : {sequence}")

    ok = True
    if not cited:
        print("\nNO CITATIONS: report.tex contains no source references", file=sys.stderr)
        ok = False
    if dangling:
        print(f"\nDANGLING: \\srcref{{{dangling}}} has no row in SOURCES.md", file=sys.stderr)
        ok = False
    if uncited:
        print(f"\nUNCITED: SOURCES.md rows {uncited} are never referenced in the report",
              file=sys.stderr)
        ok = False
    for error in structure:
        print(f"\n{error}", file=sys.stderr)
        ok = False
    if stale:
        print(f"\nPLACEHOLDER TEXT still in report.tex: {stale}", file=sys.stderr)
        ok = False

    print("\nsources check: PASS" if ok else "\nsources check: FAIL")
    return 0 if ok else 2


if __name__ == "__main__":
    raise SystemExit(main())
