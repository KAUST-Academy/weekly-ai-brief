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

source "$(dirname "${BASH_SOURCE[0]}")/_common.sh"
CLAUDE="${CLAUDE_BIN:-$(command -v claude || echo "$HOME/.local/bin/claude")}"
LOGDIR="$ROOT/logs"
STAMP="$(date +%F)"

mkdir -p "$LOGDIR"
HEALTH="ok"
REASON=""

# A dry run must not append to the live issue's log -- that log is the audit record of
# what was actually built and mailed, and interleaving a rehearsal into it corrupts it.
if [[ "${DRY_RUN:-0}" == "1" ]]; then
  OUTDIR="$ROOT/.dryrun/$(issue_dir "$STAMP")"   # never touches a real issue folder
  LOG="$LOGDIR/dryrun-$STAMP.log"
  SEND_CLAUSE="Do NOT send any email; stop after building the PDF and writing SOURCES.md."
else
  OUTDIR="$ROOT/$(issue_dir "$STAMP")"
  LOG="$LOGDIR/run-$STAMP.log"
  SEND_CLAUSE="Then send it to everyone in List_Of_People_To_Send_To.csv without asking for confirmation -- this is the scheduled unattended run."
fi

alert() {   # $1=subject $2=message -- silent during rehearsals
  [[ "${DRY_RUN:-0}" == "1" ]] && { echo "(dry run: alert suppressed -- $1)"; return 0; }
  python3 "$ROOT/scripts/notify.py" --subject "$1" --message "$2" --log-path "$LOG"
}

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

  # Check the login before starting, not after. An expired OAuth session is the one
  # failure that cannot be fixed unattended, and it is what lost the 2026-09-01
  # issue -- claude exited in four seconds and nobody was told. Failing here gives a
  # named cause and an alert instead of a bare "no PDF produced".
  if ! bash "$ROOT/scripts/check_auth.sh" opus; then
    REASON="The Claude login is not usable, so no report could be built.

Fix: SSH to this node and run 'claude' interactively, then sign in.
  ssh $(hostname)
  claude

Then rebuild this week's issue with:
  FORCE=1 bash $ROOT/scripts/run_weekly.sh"
    echo "FAIL: authentication preflight failed -- not starting the build"
    alert "login expired -- this week's brief did not build" "$REASON"
    echo "=== done: $(date -Is), status 1 ==="
    exit 1
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
    if ! python3 "$ROOT/scripts/check_sources.py" "$OUTDIR"; then
      REASON="The brief was built and mailed, but its source check did not pass -- some figure may not be backed by a primary source. Worth reading before anyone acts on it."
      STATUS=1
      HEALTH="check-failed"
    fi
  else
    echo "FAIL: no PDF produced at $OUTDIR/report.pdf"
    REASON="The run finished but produced no PDF at $OUTDIR/report.pdf, so nothing was mailed."
    STATUS=1
  fi

  # keep the last 12 weeks of logs
  ls -1t "$LOGDIR"/run-*.log 2>/dev/null | tail -n +13 | xargs -r rm -f

  # Publish the issue to GitHub. Dry runs build into an ignored folder, so there is
  # nothing to publish; a missing PDF means the run failed and there is nothing to
  # commit either. A push failure does not undo the mail that already went out -- it
  # just needs retrying, so it is reported rather than treated as a lost issue.
  # An issue whose source check failed is still published, because it was still mailed
  # -- but $HEALTH makes the commit message say so instead of looking clean.
  if [[ "${DRY_RUN:-0}" != "1" && "${PUBLISH:-1}" == "1" && -f "$OUTDIR/report.pdf" ]]; then
    bash "$ROOT/scripts/publish_to_github.sh" "$STAMP" "$HEALTH" || {
      echo "WARN: the issue was built and mailed but not pushed -- retry with:"
      echo "      bash $ROOT/scripts/publish_to_github.sh $STAMP"
      REASON="The brief was built and mailed, but pushing it to GitHub failed. The issue went out; only the archive copy is missing. Retry with:
  bash $ROOT/scripts/publish_to_github.sh $STAMP"
      STATUS=1
    }
  fi

  if [[ $STATUS -ne 0 ]]; then
    alert "weekly run finished with problems" \
      "${REASON:-The weekly run exited non-zero. See the log on the machine.}"
  fi

  echo "=== done: $(date -Is), status $STATUS ==="
  exit $STATUS
} 2>&1 | tee -a "$LOG"
