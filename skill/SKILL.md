---
name: weekly-ai-report
description: Research, write, typeset and email the Weekly AI Brief -- a 3-5 page LaTeX report on the papers, model releases, benchmark movements and policy changes of the past seven days. Every figure verified against a primary source, sources logged in a companion SOURCES.md, PDF built with tectonic, mailed to Weekly_AI_Reports/List_Of_People_To_Send_To.csv. Use when asked for the weekly AI brief/report/digest, when the Tuesday schedule fires, or when someone asks "what happened in AI this week".
---

# Weekly AI Brief

Produce one issue: research the last seven days, write it, build the PDF, save it with
its sources, mail it. Three to five pages. Everything in it must be true and checkable.

**Home:** the Weekly AI Brief repo. `run_weekly.sh` makes it your working directory
before calling you, so every path below is relative to where you already are.

```
Weekly_AI_Reports/
  List_Of_People_To_Send_To.csv   recipients (Name,Email)
  .env                            SMTP creds (chmod 600, never committed)
  template/report_template.tex    the LaTeX template -- copy, never edit in place
  template/SOURCES_template.md    the sources-log schema
  template/*.png                  KAUST Academy (top left) + KAUST (top right) logos
  scripts/build_report.py         tex -> pdf, enforces the 3-5 page budget
  scripts/check_sources.py        srcref <-> SOURCES.md correspondence, both ways
  scripts/send_report.py          CSV -> personalised mail with the PDF attached
  scripts/run_weekly.sh           unattended end-to-end run (the Tuesday cron target)
  YYYY-MM-DD/                     one folder per issue: report.tex, report.pdf, SOURCES.md
```

LaTeX engine: `~/bin/tectonic` (self-contained, no root). `build_report.py` finds it.

---

## Phase 0 — Fix the window and open the folder

1. Get today's real date (`date +%F`) -- never assume it. The window is the **seven days
   ending today**, inclusive. Write both endpoints down; every inclusion decision is
   measured against them.
2. Read the previous issue's `SOURCES.md` (highest-numbered dated folder, if any). Anything
   already covered is not news again -- only a genuine follow-up (a reproduction, a
   retraction, a released weight set) earns a second appearance, and it must say what changed.
3. Create `Weekly_AI_Reports/<today>/` and work inside it.

## Phase 1 — Harvest

Sweep the four beats in `references/beats.md`: **releases**, **research**, **benchmarks**,
**industry and policy**. Run the searches broadly first, then go to primary sources.

Two rules govern this phase, and they are the whole point of the brief:

- **Never write a fact you have not opened.** A search snippet is a lead, not a source.
  Before a number, an arXiv ID, a context length, a price or a benchmark score goes in the
  report, fetch the primary page and read it there. Your training data is not a source and
  is out of date by definition.
- **Never invent an identifier.** arXiv IDs, model version strings, dates and dollar
  figures are either copied from a page you fetched or they do not appear.

**openai.com needs a different door.** Your fetch tool gets `403` on every openai.com
content page -- so does `curl` -- because their edge rejects those clients. It is not a
policy: their `robots.txt` is `User-agent: * / Allow: /`. Two issues in a row sourced the
week's biggest release entirely from secondaries because of this. Use the helper, which
reads the page with a client the edge accepts and falls back to a dated archive copy:

```bash
python3 scripts/fetch_openai.py --since <window start>   # what OpenAI has published
python3 scripts/fetch_openai.py --url https://openai.com/index/<slug>/
```

`--since` lists candidate slugs from OpenAI's own sitemap. Its dates are re-render dates,
not publication dates, so read each page for its real date. If the helper cannot reach a
page either, say in the report that the primary could not be read -- do not quietly promote
a secondary into its place.

Aim to surface 20-30 candidates, so that selection is a real filter rather than a formality.
Log every candidate as you go -- URL, date, one line of what it claims -- because Phase 5
needs the ones you rejected too.

## Phase 2 — Select

Keep 10-14 items. Rank each candidate on three questions, in this order:

1. **Does it change what someone building with AI would do next week?** A released weight
   set beats a preprint; a preprint with code beats one without; an incremental SOTA point
   on a saturated benchmark usually beats nothing.
2. **Is it verifiable right now?** Self-reported numbers with no artifact are a rumour with
   a chart. Either say who reported it, or drop it.
3. **Will it still be true in a month?** Funding rumours and unnamed-source scoops age badly.

Balance the issue: roughly 2-4 releases, 3-5 papers, one benchmark table, 2-4 industry or
policy items, 3 forward-looking items. If a beat was genuinely quiet, say so in one line and
delete the section -- a thin section is worse than an absent one.

## Phase 3 — Write

Copy `template/report_template.tex` to `<today>/report.tex` and replace every block marked
`% >>> REPLACE`. Fill the six metadata fields first. **The issue number identifies the window,
not the run:** it is one more than the highest `\briefnumber` in the existing dated folders,
except when you are rebuilding a window that already has a folder -- then keep the number that
folder already carries. Two issues covering 19--25 August are both #01.

`\briefweek` spans seven days *inclusive*, so its endpoints are six days apart: the week
ending Tuesday 25 August is `19--25 August`, never `18--25`. Check both ends against Phase 0.
Do not copy the logos -- `\graphicspath` in the template resolves them out of `template/`.
Both marks belong in the title block of every issue: KAUST Academy left, KAUST right.

The standard the prose has to meet:

- **Lead with the claim.** "Qwen3-Coder-480B ships under Apache 2.0" -- not "This week saw
  interesting developments in open models."
- **Every item carries a number or a name.** What size, which licence, which benchmark,
  whose baseline, how much money.
- **Benchmark scores name their reporter.** Self-reported and independently reproduced are
  different facts and get different sentences.
- **`\why{}` is one sentence about consequence**, and it never restates the headline.
- **No hype vocabulary.** "Breakthrough", "game-changing", "revolutionary" are banned unless
  the evidence sits in the same sentence. State the result; let the reader be impressed.
- **Hedge honestly.** If a claim is preliminary, unreproduced, or from a single source, the
  sentence says so. Confidence you have not earned is the one unrecoverable error here.
- Every `\srcref{n}` matches the numbering in `SOURCES.md` exactly.

## Phase 4 — Build and look at it

```bash
python3 scripts/build_report.py <today>     # from the repo root
```

It fails loudly on a LaTeX error and exits 2 if the PDF is outside 3-5 pages. Over budget:
cut the weakest item, not the sources section. Under: the research section is too shallow.

Then **actually look at the output** -- render page 1 and read it:

```bash
python3 -c "import fitz;d=fitz.open('<today>/report.pdf');[p.get_pixmap(dpi=110).save(f'/tmp/p{i+1}.png') for i,p in enumerate(d)]"
```

Check: no overfull lines running into the margin, no orphaned headings at a page foot, no
placeholder text survived, the table fits its column widths.

## Phase 5 — SOURCES.md

Write `<today>/SOURCES.md` from `template/SOURCES_template.md`. It has three parts:

1. **Cited sources** -- numbered S1..Sn, matching `\srcref{}` in the report one-for-one.
   Each row: title, publisher/org, type (paper / lab blog / leaderboard / press / filing),
   publication date, URL, date accessed, and the claim it supports.
2. **Also reviewed, not included** -- the candidates you rejected, with a half-line reason.
   This is what makes the brief auditable, and it is what next week's Phase 0 reads.
3. **Method** -- the window covered, which beats were swept, and anything you could not
   verify and therefore left out.

Then verify the correspondence both ways -- this is mechanical, so let the script do it:

```bash
python3 scripts/check_sources.py <today>
```

It exits 2 on a dangling `\srcref` (a claim that lost its evidence during editing), on a
SOURCES.md row nothing cites (a source gathered then quietly dropped), or on surviving
template placeholder text.

## Phase 6 — Send

```bash
python3 scripts/send_report.py --pdf <today>/report.pdf --week "<18--25 August 2026>" --dry-run
python3 scripts/send_report.py --pdf <today>/report.pdf --week "<18--25 August 2026>"
```

Each recipient gets their own message with a first-name greeting and the PDF attached.

- **Interactive run:** dry-run first, show the recipient list, then ask before sending.
- **Scheduled run (the Tuesday cron, or any prompt that says send it):** send without asking.
  Report per-recipient success; a partial failure exits 1 and must be surfaced, not swallowed.

## Before you send — the gate

- [ ] Every number, ID and date was read from a primary source you fetched this run
- [ ] Nothing is outside the seven-day window without a sentence saying why it is here
- [ ] No `% >>> REPLACE`, no "Headline one", no template placeholder anywhere in the PDF
- [ ] `python3 scripts/check_sources.py <today>` passes
- [ ] PDF is 3-5 pages and page 1 was rendered and read
- [ ] No claim stated more confidently than its evidence supports
- [ ] Recipient list read from `Weekly_AI_Reports/List_Of_People_To_Send_To.csv`

## Failure modes, and what to do

| Symptom | Do this |
|---|---|
| No network / searches fail | Stop. Do not write from memory. Report the failure; a missed week beats a fabricated one. |
| `403` from openai.com | Expected -- the fetch tool is blocked there. Use `python3 scripts/fetch_openai.py --url <page>`. Never fall back to secondaries without trying it. |
| tectonic missing | Reinstall: musl binary from the tectonic GitHub releases into `~/bin`. |
| Over 5 pages | Drop the weakest item entirely. Never shrink margins or font size. |
| SMTP auth fails | `.env` is missing or the credential rotated. Report it; the PDF is still saved. |
| Mail authenticates but never arrives | Check SPF/DKIM alignment for the `From` domain against the relay -- see the deliverability section in `Weekly_AI_Reports/README.md`. Auth succeeding says nothing about whether the receiver will accept it. |
| A quiet week | Fewer, deeper items. Never pad with recycled news or vague "the field continues to move". |
