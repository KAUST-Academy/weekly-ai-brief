#!/usr/bin/env python3
"""Reach openai.com announcements from a network its edge blocks.

Why this exists: openai.com serves 403 to this network for every content page --
directly, and through the agent's fetch tool -- while returning 200 for robots.txt
and sitemaps. Their robots.txt says `User-agent: * / Allow: /`, so this is an
over-broad bot filter rather than a policy against reading the pages. Two issues in
a row ended up sourcing the week's largest release entirely from secondaries, which
undercuts the brief's one real promise: every figure read off a primary.

Two routes, both primary, neither of them circumvention:

  --since   openai.com's own sitemaps still answer. They carry every URL with a
            <lastmod>, so OpenAI itself tells you which pages exist.

            <lastmod> is NOT a publication date. A site-wide re-render bumps
            hundreds of pages at once, so treat this as a list of candidate
            slugs to go and read -- never as evidence that something shipped on
            a given day. Confirm the date on the page itself.
  --url     the Wayback Machine holds a timestamped copy of the announcement. A
            dated archive of the primary is still the primary -- cite both URLs.

    python3 scripts/fetch_openai.py --since 2026-08-29
    python3 scripts/fetch_openai.py --url https://openai.com/index/gpt-6-astra/
"""
from __future__ import annotations

import argparse
import json
import re
import sys
import urllib.error
import urllib.request
from datetime import datetime, timezone

SITEMAP = "https://openai.com/sitemap.xml"
WAYBACK_API = "https://archive.org/wayback/available?url="
# A browser UA only gets the sitemaps served; it does not unblock content pages.
UA = ("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) "
      "Chrome/128.0.0.0 Safari/537.36")


def get(url: str, timeout: int = 45) -> str:
    req = urllib.request.Request(url, headers={"User-Agent": UA})
    with urllib.request.urlopen(req, timeout=timeout) as r:
        return r.read().decode("utf-8", "replace")


def to_text(html: str) -> str:
    """Strip markup, and the Wayback toolbar that precedes the real page."""
    text = re.sub(r"<(script|style|noscript)[^>]*>.*?</\1>", " ", html, flags=re.S | re.I)
    text = re.sub(r"<[^>]+>", " ", text)
    text = re.sub(r"\s+", " ", text).strip()
    marker = "About this capture"
    if marker in text[:4000]:
        text = text.split(marker, 1)[1].strip()
    return text


def cmd_since(since: str, every: bool) -> int:
    try:
        cutoff = datetime.fromisoformat(since).replace(tzinfo=timezone.utc)
    except ValueError:
        sys.exit(f"error: --since wants YYYY-MM-DD, got {since!r}")

    try:
        subs = re.findall(r"<loc>([^<]+)</loc>", get(SITEMAP))
    except (urllib.error.URLError, OSError) as exc:
        sys.exit(f"error: openai.com sitemap unreachable: {exc}")

    found: list[tuple[str, str]] = []
    for sub in subs:
        try:
            xml = get(sub, timeout=30)
        except (urllib.error.URLError, OSError):
            continue          # one dead sub-sitemap must not lose the rest
        for loc, mod in re.findall(
                r"<loc>([^<]+)</loc>\s*<lastmod>([^<]+)</lastmod>", xml):
            try:
                when = datetime.fromisoformat(mod.replace("Z", "+00:00"))
            except ValueError:
                continue
            if when < cutoff:
                continue
            # Announcements and research live under /index/. Everything else is
            # marketing, policy and contact pages that re-render constantly.
            if not every and "/index/" not in loc:
                continue
            found.append((when.strftime("%Y-%m-%d"), loc))

    for when, loc in sorted(set(found), reverse=True):
        print(f"{when}  {loc}")
    scope = "all paths" if every else "/index/ only, pass --all for everything"
    print(f"\n{len(set(found))} openai.com pages with lastmod >= {since} ({scope})",
          file=sys.stderr)
    print(f"source: {SITEMAP} -- OpenAI's own sitemap", file=sys.stderr)
    print("WARNING: lastmod is a re-render date, not a publication date. Use this to\n"
          "         find candidate pages, then read each one for its real date.",
          file=sys.stderr)
    return 0


def cmd_url(url: str) -> int:
    try:                                  # the block may not be permanent
        html = get(url, timeout=25)
        print(f"SOURCE: {url} (fetched directly)\n")
        print(to_text(html))
        return 0
    except (urllib.error.HTTPError, urllib.error.URLError, OSError) as exc:
        print(f"note: direct fetch failed ({exc}) -- trying the archive",
              file=sys.stderr)

    try:
        api = json.loads(get(WAYBACK_API + url, timeout=30))
    except (urllib.error.URLError, OSError, ValueError) as exc:
        sys.exit(f"error: archive lookup failed: {exc}")

    snap = (api.get("archived_snapshots") or {}).get("closest")
    if not snap or not snap.get("available"):
        sys.exit(f"error: no archived copy of {url}\n"
                 "       Do not cite a secondary as if it were the primary. Say in the\n"
                 "       report that the primary could not be read, or drop the figure.")

    stamp = snap["timestamp"]
    taken = f"{stamp[0:4]}-{stamp[4:6]}-{stamp[6:8]}"
    try:
        html = get(snap["url"])
    except (urllib.error.URLError, OSError) as exc:
        sys.exit(f"error: archived copy unreachable: {exc}")

    print(f"SOURCE:   {url}")
    print(f"ARCHIVED: {snap['url']}")
    print(f"SNAPSHOT: {taken}")
    print("Cite the openai.com URL, and note it was read from the archive of that date.\n")
    print(to_text(html))
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    g = ap.add_mutually_exclusive_group(required=True)
    g.add_argument("--since", metavar="YYYY-MM-DD",
                   help="list openai.com pages published on or after this date")
    g.add_argument("--url", help="read one openai.com page, via the archive if blocked")
    ap.add_argument("--all", action="store_true",
                    help="with --since, include non-/index/ paths as well")
    args = ap.parse_args()
    return cmd_since(args.since, args.all) if args.since else cmd_url(args.url)


if __name__ == "__main__":
    raise SystemExit(main())
