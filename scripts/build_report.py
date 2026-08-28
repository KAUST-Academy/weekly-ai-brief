#!/usr/bin/env python3
"""Compile a brief's report.tex to PDF and enforce the 3-5 page budget.

    python3 scripts/build_report.py 2026-08-25
    python3 scripts/build_report.py 2026-08-25/report.tex --max-pages 5
"""
from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
from pathlib import Path

REPORT_ROOT = Path(__file__).resolve().parent.parent


def find_engine() -> str:
    for name in ("tectonic", str(Path.home() / "bin" / "tectonic")):
        found = shutil.which(name) or (name if Path(name).is_file() else None)
        if found:
            return found
    for fallback in ("latexmk", "pdflatex"):
        if shutil.which(fallback):
            return fallback
    sys.exit("error: no LaTeX engine found (install tectonic to ~/bin)")


def compile_tex(engine: str, tex: Path) -> Path:
    if engine.endswith("tectonic"):
        cmd = [engine, "-X", "compile", "--keep-logs", tex.name]
    elif engine.endswith("latexmk"):
        cmd = [engine, "-pdf", "-interaction=nonstopmode", tex.name]
    else:
        cmd = [engine, "-interaction=nonstopmode", tex.name]

    for run in range(1, 3 if not engine.endswith(("tectonic", "latexmk")) else 2):
        result = subprocess.run(cmd, cwd=tex.parent, capture_output=True, text=True)
        if result.returncode != 0:
            sys.stderr.write(result.stdout[-4000:] + result.stderr[-4000:])
            sys.exit(f"error: {Path(engine).name} failed on pass {run}")

    pdf = tex.with_suffix(".pdf")
    if not pdf.is_file():
        sys.exit(f"error: no PDF produced at {pdf}")
    return pdf


def page_count(pdf: Path) -> int | None:
    try:
        import fitz  # PyMuPDF
    except ImportError:
        return None
    with fitz.open(pdf) as doc:
        return doc.page_count


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("target", type=Path,
                        help="the brief's dated folder, or a path to report.tex")
    parser.add_argument("--min-pages", type=int, default=3)
    parser.add_argument("--max-pages", type=int, default=5)
    args = parser.parse_args()

    target = args.target if args.target.is_absolute() else (Path.cwd() / args.target)
    if target.is_dir():
        target = target / "report.tex"
    if not target.is_file():
        sys.exit(f"error: no report.tex at {target}")

    engine = find_engine()
    print(f"engine: {engine}")
    pdf = compile_tex(engine, target)
    pages = page_count(pdf)

    print(f"built:  {pdf} ({pdf.stat().st_size / 1024:.0f} KiB)")
    if pages is None:
        print("pages:  unknown (pip install pymupdf to enforce the page budget)")
        return 0

    print(f"pages:  {pages}")
    if not args.min_pages <= pages <= args.max_pages:
        print(f"\nPAGE BUDGET MISS: {pages} pages, target is "
              f"{args.min_pages}-{args.max_pages}. "
              f"{'Cut an item or tighten the prose.' if pages > args.max_pages else 'Add depth to the research section.'}",
              file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
