# Weekly AI Brief

A 3–5 page report on the week in AI — papers, model releases, benchmark movements,
industry and policy — written, typeset, saved with its sources, and mailed out.

Driven by the **`weekly-ai-report`** skill (`~/.claude/skills/weekly-ai-report/`).
Ask Claude for "the weekly AI brief" or run `/weekly-ai-report`; the schedule fires it
automatically every **Tuesday at 15:00**.

## Layout

```
Weekly_AI_Reports/
├── List_Of_People_To_Send_To.csv   recipients (Name,Email) — gitignored, real addresses
├── List_Of_People_To_Send_To.example.csv   tracked placeholder showing the format
├── .env                            SMTP credentials — chmod 600, never committed
├── .env.example                    template for the above
├── .gitignore                      keeps .env and the real recipient list off GitHub
├── skill/                          the weekly-ai-report skill — install to ~/.claude/skills/
│   ├── SKILL.md                    how an issue gets researched, written and checked
│   └── references/beats.md         the beats each issue must sweep
├── template/
│   ├── report_template.tex         the LaTeX template — copy per issue, never edit in place
│   ├── SOURCES_template.md         schema for the sources log
│   ├── KAUST_Academy_Logo.png      title block, top left
│   └── KAUST_Logo.png              title block, top right
├── scripts/
│   ├── _common.sh                  shared setup — works out ROOT and PATH
│   ├── install_skill.sh            copies skill/ into ~/.claude/skills/
│   ├── build_report.py             tex → pdf, enforces the 3–5 page budget
│   ├── check_sources.py            srcref ↔ SOURCES.md correspondence check
│   ├── fetch_openai.py             reads openai.com, which blocks the fetch tool
│   ├── submit_weekly.sh            queues the Slurm job (cron target)
│   ├── weekly_job.sbatch           the job: runs the brief on a compute node
│   ├── run_weekly.sh               unattended end-to-end run (what the job runs)
│   ├── check_auth.sh               is the Claude login usable? (preflight)
│   ├── check_issue.sh              did an issue actually appear this week?
│   ├── auth_keepalive.sh           daily token refresh + early warning (cron target)
│   ├── notify.py                   emails an operational alert when a run fails
│   ├── install_cron.sh             installs all three crontab entries
│   ├── publish_to_github.sh        commits the issue and pushes it
│   └── send_report.py              CSV → personalised mail with the PDF attached
├── logs/                           run transcripts — local only, never pushed
└── YYYY-MM-DD/                     one folder per issue
    ├── report.tex
    ├── report.pdf
    └── SOURCES.md                  every source cited, plus what was rejected and why
```

## One-time setup

```bash
cp .env.example .env && chmod 600 .env    # then fill in WEEKLY_AI_SMTP_PASS
```

The LaTeX engine is `~/bin/tectonic` (self-contained, no root, fetches packages on demand).
`build_report.py` finds it automatically and falls back to `latexmk`/`pdflatex` if present.
Page counting needs `pymupdf` (already installed).

## Running an issue by hand

```bash
python3 scripts/build_report.py 2026-08-25                        # build + page check
python3 scripts/send_report.py --pdf 2026-08-25/report.pdf --dry-run
python3 scripts/send_report.py --pdf 2026-08-25/report.pdf        # actually send
```

Each recipient receives their own message with a first-name greeting and the PDF attached —
no shared To: line.

## The weekly schedule

The brief runs every **Tuesday at 15:00** via cron. Install it **on a login node** — IBEX
cron spools are per-node, so an entry made on a compute node dies with the allocation:

```bash
ssh glogin
cd /path/to/weekly-ai-brief
bash scripts/install_cron.sh   # idempotent -- paths worked out at install time
crontab -l                     # verify
```

That installs four lines:

```
0  9 * * *  .../scripts/auth_keepalive.sh    keep the login warm, warn early if it dies
45 14 * * 2 .../scripts/auth_keepalive.sh    one more refresh, 15 min before the build
0  15 * * 2 .../scripts/submit_weekly.sh     queue the build as a Slurm job
0  9 * * 3  .../scripts/check_issue.sh       did an issue actually appear?
```

Cron only **queues** the work — see [why it runs on a compute node](#why-it-runs-on-a-compute-node).
The job runs `run_weekly.sh`, which invokes `claude -p` against the `weekly-ai-report` skill,
builds into a dated folder, sends, then runs `check_sources.py` — logging each run to
`logs/run-YYYY-MM-DD.log` and keeping the last 12.

```bash
bash scripts/submit_weekly.sh          # queue a real run now
squeue -u $USER -n weekly-ai-brief     # watch it
FORCE=1 bash scripts/submit_weekly.sh  # rebuild + resend an existing issue
bash scripts/install_cron.sh --remove  # uninstall the schedule

DRY_RUN=1 bash scripts/run_weekly.sh   # rehearse directly (no Slurm, no mail)
```

Four safeguards worth knowing about:

- **A dated issue is never silently rebuilt.** If `<date>/report.pdf` exists the run exits 0
  with `SKIP`, so a second cron fire or a manual re-run cannot re-send a delivered brief.
  `FORCE=1` overrides.
- **Dry runs are isolated** into `.dryrun-<date>/` so testing never overwrites a real issue.
- **The login is checked before any work starts.** `check_auth.sh` runs first; if it fails the
  run stops immediately with a named cause and an alert, rather than burning a slot and
  leaving a bare "no PDF produced" in the log.
- **Failures are mailed, not just logged.** Any non-zero run emails `WEEKLY_AI_ALERT_TO`.

**Cron environment:** cron gives a non-login, non-interactive shell, so `~/.bashrc` is not
sourced — conda is absent and bare `python3` would be `/usr/bin/python3` (3.9, no pymupdf,
which would silently drop the page-budget check). `run_weekly.sh` therefore puts
`miniconda3/bin`, `~/bin` and `~/.local/bin` on PATH explicitly and warns if pymupdf is still
missing. Verified under a stripped `env -i` shell.

## Why it runs on a compute node

The agent **cannot run on an IBEX login node.** It was tried twice on 2026-09-04 and killed
both times — `SIGKILL`, exit 137, once at 38 seconds and again at 110 seconds with the SSH
session held open, so it is not a disconnect artefact.

It is also not memory: the user cgroup reported `oom_kill 0` with a peak of 23 MB against a
20 GiB cap, and the only OOM in `dmesg` belonged to another user. A login-node reaper sweeps
up sustained processes, and a research agent that runs for 10–30 minutes is exactly its
target. Login nodes are for light work, so the work moved rather than fighting the policy.

Cron still fires on the login node, because *submitting* a job is light. `submit_weekly.sh`
calls `sbatch`; `weekly_job.sbatch` runs the brief on a compute node with 4 CPUs, 16 GB and a
two-hour limit. Compute nodes reach everything the run needs — the Anthropic API, the Mandrill
relay, and GitHub.

The trade-off is queue time: the brief goes out when the job starts, not exactly at 15:00.
On `batch` that is usually seconds.

## Keeping the Claude login alive

This is the failure mode that has actually bitten, so it is worth understanding.

`run_weekly.sh` drives the `claude` CLI, which holds an OAuth session: an access token good
for about eight hours, renewed with a refresh token. **Nothing renews it unless the CLI
runs.** Left untouched between weekly runs the session goes stale.

That is exactly how the **2026-09-01 issue was lost**. Cron fired on time, on the right node;
`claude` exited four seconds later with `OAuth session expired and could not be refreshed`;
no report was built and no one was told for three days. The schedule was never the problem.

Two changes close it:

- `auth_keepalive.sh` runs **daily at 09:00**, which both refreshes the token and proves the
  refresh path still works. If it ever fails you get an email that morning — with days to
  act, because a dead login can only be fixed by a human signing in.
- It runs **again at 14:45 on Tuesday**, so the 15:00 build starts on a token minted minutes
  earlier rather than one that has been idle since the last run.

Renewing a dead login is manual and unavoidable:

```bash
ssh login510-27              # the node this deployment's cron lives on
claude                       # sign in interactively
cd /path/to/weekly-ai-brief
bash scripts/check_auth.sh   # confirm
```

Then rebuild the missed issue with `FORCE=1 bash scripts/run_weekly.sh`.

## When something goes wrong

Set `WEEKLY_AI_ALERT_TO` in `.env` (see `.env.example`) and any failed run emails you. Leave
it empty and alerting quietly does nothing — `notify.py` never fails a run that is already
failing.

Alerts carry **no log contents**, only a one-line cause and the log's path. The run log is the
verbatim transcript of an agent that reads `.env` and the recipient CSV during the same run,
so it can quote a credential or an address; mailing it through a third-party relay would undo
the work done to keep those off the wire. Read the log on the machine:

```bash
tail -40 logs/run-<date>.log   # the run that failed
tail -20 logs/auth.log         # daily login checks
tail -40 logs/cron.log         # what cron saw
tail -20 logs/submit.log       # whether a job was ever queued
```

Dry runs suppress alerts — a rehearsal you are watching should not mail you.

**The backstop.** Every alert above fires from *inside* a run. If the Slurm job never starts —
queue backlog, node failure, a submission that vanished — nothing runs and nothing complains,
and silence looks exactly like success. `check_issue.sh` runs Wednesday morning and checks for
the artefact itself: if no `<date>/report.pdf` has appeared in the last 8 days, it says so.

## Sending: SMTP relay and deliverability

`send_report.py` authenticates as `WEEKLY_AI_SMTP_USER` and sends as `WEEKLY_AI_SMTP_FROM`
(defaulting to the login user). The pipeline sends through **Mandrill**
(`smtp.mandrillapp.com:587`, account username + `md-` API key).

**Verified by a real send on 2026-08-25:** all 7 recipients reached `state=sent` in the
Mandrill API with zero bounces and zero rejects; account reputation 96.

This works despite `kaust.edu.sa` not listing Mandrill in its SPF record, because SPF
authenticates the **envelope** sender, not the header `From`. Mandrill sets its own
Return-Path on `mandrillapp.com` and DKIM-signs with its own domain, so both checks pass on
the relay's domain. `kaust.edu.sa` publishes no DMARC record, so nothing requires the header
`From` to align with them. Worth knowing about that arrangement:

- It depends on the absence of a DMARC policy. If KAUST IT ever publishes
  `_dmarc.kaust.edu.sa` with `p=quarantine` or `p=reject`, these sends start failing --
  the fix then is `include:spf.mandrillapp.com` in SPF plus Mandrill's DKIM record.
- Receivers see an unaligned `From`, which is a mild spam signal on its own. It has not
  been a problem in practice here.
- To move off Mandrill: set `WEEKLY_AI_SMTP_SERVER=smtp.office365.com` with the mailbox
  address and password, and leave `WEEKLY_AI_SMTP_FROM` unset.

## Publishing to GitHub

Every issue is committed and pushed to
**[KAUST-Academy/weekly-ai-brief](https://github.com/KAUST-Academy/weekly-ai-brief)**
(private) at the end of each weekly run. `run_weekly.sh` calls
`scripts/publish_to_github.sh` once the PDF exists and the mail has gone out.

Three things are deliberately **not** published, and `.gitignore` keeps them out:

| Local only | Tracked stand-in | Why |
|---|---|---|
| `.env` | `.env.example` | holds the live Mandrill API key |
| `List_Of_People_To_Send_To.csv` | `List_Of_People_To_Send_To.example.csv` | holds personal addresses |
| `logs/` | — | see below |

The run log is the reason for the third row, and it is the least obvious of the three.
`run_weekly.sh` tees the entire transcript of a headless `claude -p` agent into
`logs/run-<date>.log`, and that agent reads **both** `.env` and the recipient CSV during
the same run. Anything it chooses to quote — a name, an address, a traceback carrying the
API key — lands in that file. Publishing it would route around the whole point of ignoring
the two source files, so the logs stay on the machine.

`.gitignore` alone is not a guarantee — it only protects files that were never added,
and a `git add -f` would make one tracked forever. So `publish_to_github.sh` re-checks
the index on every run and refuses to push if any of the three has become tracked. The
check uses `:(glob)**/` pathspecs, so a stray `2026-09-01/.env` is caught too, not just
one at the repo root.

A failed push does **not** mean a lost issue: the report was already built and mailed,
and the commit is sitting locally. Retry it with

```bash
bash scripts/publish_to_github.sh 2026-08-25     # the issue's date
```

To make the repo public, or to skip publishing on a manual run:

```bash
gh repo edit KAUST-Academy/weekly-ai-brief --visibility public --accept-visibility-change-consequences
PUBLISH=0 bash scripts/run_weekly.sh
```

### Recreating the repo from scratch

```bash
cd /path/to/weekly-ai-brief
git init -b main
gh repo create KAUST-Academy/weekly-ai-brief --private
git remote add origin https://github.com/KAUST-Academy/weekly-ai-brief.git
git add .gitignore && git commit -m "chore(repo): ignore secrets and recipient list"
git push -u origin main
```

Pushing from cron works because `gh auth setup-git` has installed a credential helper
in `~/.gitconfig`; cron does not source `~/.bashrc`, but it does set `HOME`, which is
all the helper needs to find the token.

## Changing the recipient list

Edit `List_Of_People_To_Send_To.csv`. Columns are `Name,Email`; the header is required and a
UTF-8 BOM is tolerated. `send_report.py` refuses to run on a malformed address rather than
silently skipping it.

## Using this on another machine

Everything needed is in this repo — the skill, the scripts, the template and the logos.
Nothing points at an account or a cluster: each script works out where it lives from its own
path, so a clone runs wherever you put it.

```bash
git clone https://github.com/KAUST-Academy/weekly-ai-brief.git
cd weekly-ai-brief

bash scripts/install_skill.sh              # copies skill/ into ~/.claude/skills/
cp .env.example .env && chmod 600 .env     # SMTP details + WEEKLY_AI_ALERT_TO
cp List_Of_People_To_Send_To.example.csv List_Of_People_To_Send_To.csv
```

The skill step is not optional. Claude Code loads skills only from `~/.claude/skills/`, never
from a repo, so until it is installed `run_weekly.sh` asks for a skill that is not there and
the run produces nothing useful. It is a copy rather than a symlink, so the installed skill
keeps working if the clone moves — re-run `install_skill.sh` after pulling changes to `skill/`.

Then check it and go:

```bash
bash scripts/check_auth.sh          # is the Claude login usable?
bash scripts/install_cron.sh        # schedule it (paths worked out at install time)
bash scripts/submit_weekly.sh       # or queue one right now
```

**What you may still want to change:**

| Setting | How |
|---|---|
| Slurm partition | `WEEKLY_AI_PARTITION=gpu bash scripts/submit_weekly.sh` (default `batch`) |
| Python with `pymupdf` | `WEEKLY_AI_CONDA_BIN=/path/to/env/bin` — otherwise the first conda-ish install found, else system `python3` |
| Repo location | derived automatically; override with `WEEKLY_AI_ROOT` if you ever need to |
| Logos and branding | swap the two PNGs in `template/` |

`tectonic` is preferred for the build and is looked for on `PATH` and in `~/bin`;
`build_report.py` falls back to `latexmk` or `pdflatex`.

**Not on a cluster?** There is no Slurm and no login-node reaper, so delete
`submit_weekly.sh` and `weekly_job.sbatch` and point cron straight at `run_weekly.sh` —
edit the one line in `install_cron.sh`.

## Where the standards live

The research procedure, the sourcing rules ("never write a fact you have not opened"), the
prose standard and the pre-send gate are all in the skill: `~/.claude/skills/weekly-ai-report/SKILL.md`.
The per-beat source list is in `references/beats.md` next to it.
