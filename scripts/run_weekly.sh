#!/usr/bin/env bash
# Unattended weekly run: research -> write -> build -> save -> email.
# Invoked by cron every Tuesday at 15:00. Safe to run by hand to test.
#
#   bash scripts/run_weekly.sh            # full run, sends the mail
#   DRY_RUN=1 bash scripts/run_weekly.sh  # builds into .dryrun-<date>/, sends nothing
#   FORCE=1 bash scripts/run_weekly.sh    # rebuild + resend an issue that already exists
#
# Cron gives a non-login, non-interactive shell: ~/.bashrc is NOT sourced, so conda is
# absent and `python3` would be /usr/bin/python3 (no pymupdf -> no page-budget check).
# Everything this script needs is put on PATH explicitly below.
set -uo pipefail

ROOT="/ibex/user/habiam0b/Weekly_AI_Reports"
CONDA_BIN="/ibex/user/habiam0b/miniconda3/bin"
CLAUDE="${CLAUDE_BIN:-$HOME/.local/bin/claude}"
LOGDIR="$ROOT/logs"
STAMP="$(date +%F)"
LOG="$LOGDIR/run-$STAMP.log"

mkdir -p "$LOGDIR"
export PATH="$CONDA_BIN:$HOME/bin:$HOME/.local/bin:$PATH"

if [[ "${DRY_RUN:-0}" == "1" ]]; then
  OUTDIR="$ROOT/.dryrun-$STAMP"      # never touches a real issue folder
  SEND_CLAUSE="Do NOT send any email; stop after building the PDF and writing SOURCES.md."
else
  OUTDIR="$ROOT/$STAMP"
  SEND_CLAUSE="Then send it to everyone in List_Of_People_To_Send_To.csv without asking for confirmation -- this is the scheduled unattended run."
fi

{
  echo "=== Weekly AI Brief run: $(date -Is) on $(hostname) ==="
  echo "mode=$([[ "${DRY_RUN:-0}" == "1" ]] && echo dry-run || echo live)  outdir=$OUTDIR"

  if [[ ! -x "$CLAUDE" ]]; then
    echo "FATAL: claude CLI not executable at $CLAUDE"
    exit 1
  fi

  # Fail loudly rather than silently losing the page-budget gate.
  if ! python3 -c "import fitz" 2>/dev/null; then
    echo "WARN: python3 ($(command -v python3)) has no pymupdf -- the 3-5 page check will be skipped"
  fi

  # A second cron fire, or a manual re-run, must not rebuild and re-send a delivered issue.
  if [[ -f "$OUTDIR/report.pdf" && "${FORCE:-0}" != "1" ]]; then
    echo "SKIP: $OUTDIR/report.pdf already exists. Re-run with FORCE=1 to rebuild and resend."
    exit 0
  fi

  # Headless print mode denies any tool that would need an approval prompt, so the
  # research and build tools have to be granted explicitly or the run dies at Phase 1.
  # The model is pinned rather than inherited so a settings change cannot silently
  # downgrade the Tuesday run.
  # --allowedTools is variadic, so it swallows a positional prompt. Feed the prompt on
  # stdin instead -- with the prompt as an argument the CLI exits "Input must be provided".
  cd "$ROOT" || exit 1
  PROMPT="Use the weekly-ai-report skill to produce this week's issue end to end: research the last seven days, write report.tex from the template, build the PDF into $OUTDIR/, and write SOURCES.md alongside it. $SEND_CLAUSE"
  printf '%s' "$PROMPT" | "$CLAUDE" -p --model opus \
    --allowedTools "WebSearch,WebFetch,Read,Write,Edit,Glob,Grep,Bash" 2>&1
  STATUS=${PIPESTATUS[1]}

  echo "--- claude exited $STATUS ---"
  if [[ -f "$OUTDIR/report.pdf" ]]; then
    echo "OK: $OUTDIR/report.pdf ($(stat -c%s "$OUTDIR/report.pdf") bytes)"
    python3 "$ROOT/scripts/check_sources.py" "$OUTDIR" || STATUS=1
  else
    echo "FAIL: no PDF produced at $OUTDIR/report.pdf"
    STATUS=1
  fi

  # keep the last 12 weeks of logs
  ls -1t "$LOGDIR"/run-*.log 2>/dev/null | tail -n +13 | xargs -r rm -f

  # Publish the issue to GitHub. Dry runs build into an ignored folder, so there is
  # nothing to publish; a missing PDF means the run failed and there is nothing to
  # commit either. A push failure does not undo the mail that already went out -- it
  # just needs retrying, so it is reported rather than treated as a lost issue.
  # The log committed here stops at this line; its tail is picked up by next week's
  # commit, which restages any tracked log that changed.
  if [[ "${DRY_RUN:-0}" != "1" && "${PUBLISH:-1}" == "1" && -f "$OUTDIR/report.pdf" ]]; then
    bash "$ROOT/scripts/publish_to_github.sh" "$STAMP" || {
      echo "WARN: the issue was built and mailed but not pushed -- retry with:"
      echo "      bash $ROOT/scripts/publish_to_github.sh $STAMP"
      STATUS=1
    }
  fi

  echo "=== done: $(date -Is), status $STATUS ==="
  exit $STATUS
} 2>&1 | tee -a "$LOG"
