#!/usr/bin/env bash
# Keep the Claude Code OAuth session alive, and shout early if it dies.
#
# Runs daily and again 15 minutes before the Tuesday build. Two jobs:
#
#   1. Renew. The CLI only refreshes its token when it runs. Left untouched between
#      weekly runs the session goes stale, which is what killed the 2026-09-01 issue.
#      The 14:45 Tuesday fire hands the 15:00 run a token minted minutes earlier.
#   2. Warn. A dead login needs a human to sign in interactively -- there is no
#      unattended fix. Finding out on the daily check leaves days to act; finding
#      out at 15:00 on Tuesday means the issue is already lost.
#
#   bash scripts/auth_keepalive.sh
set -uo pipefail

ROOT="/ibex/user/habiam0b/Weekly_AI_Reports"
CONDA_BIN="/ibex/user/habiam0b/miniconda3/bin"
LOG="$ROOT/logs/auth.log"
export PATH="$CONDA_BIN:$HOME/bin:$HOME/.local/bin:$PATH"

mkdir -p "$ROOT/logs"

OUT=$(bash "$ROOT/scripts/check_auth.sh" opus 2>&1)
RC=$?
printf '%s  %s\n' "$(date -Is)" "${OUT//$'\n'/ | }" >> "$LOG"

# Keep this log bounded; it gains one line a day forever otherwise.
if [[ $(wc -l < "$LOG") -gt 400 ]]; then
  tail -n 200 "$LOG" > "$LOG.tmp" && mv "$LOG.tmp" "$LOG"
fi

if [[ $RC -ne 0 ]]; then
  python3 "$ROOT/scripts/notify.py" \
    --subject "Claude login needs renewing -- Tuesday's brief will not build" \
    --message "The scheduled auth check failed, so the weekly run cannot start.

Fix: SSH to the cron node and run 'claude' interactively, then sign in.
  ssh login510-27
  claude

This check runs daily, so the alert repeats until the login is renewed." \
    --log-path "$LOG" >> "$LOG" 2>&1
  exit 1
fi

exit 0
