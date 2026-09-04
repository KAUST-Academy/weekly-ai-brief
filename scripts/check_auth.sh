#!/usr/bin/env bash
# Is the Claude Code CLI able to authenticate right now?
#
# The CLI holds an OAuth session whose access token lives ~8 hours and is renewed
# with a refresh token. Nothing renews it unless the CLI actually runs, so a session
# left idle for days can arrive at the weekly run already dead -- which is exactly
# how the 2026-09-01 issue was lost: cron fired on time, `claude` exited in four
# seconds with "OAuth session expired and could not be refreshed", and no report
# was ever built.
#
# Running this both refreshes the token and reports whether the refresh worked.
#
#   bash scripts/check_auth.sh          # exit 0 = authenticated
#   bash scripts/check_auth.sh opus     # check against a specific model
set -uo pipefail

CLAUDE="${CLAUDE_BIN:-$HOME/.local/bin/claude}"
MODEL="${1:-opus}"

if [[ ! -x "$CLAUDE" ]]; then
  echo "auth: FATAL -- claude CLI not executable at $CLAUDE"
  exit 2
fi

# No tools and a three-token answer: this costs essentially nothing, so it is cheap
# enough to run daily. --allowedTools is deliberately omitted; with no tools granted
# the CLI cannot do anything but answer.
OUT=$(printf '%s' "Reply with the single word: OK" \
      | timeout 180 "$CLAUDE" -p --model "$MODEL" 2>&1)
RC=$?

if [[ $RC -eq 0 ]]; then
  echo "auth: ok ($MODEL)"
  exit 0
fi

# Separate "the login is dead" from "the network/CLI misbehaved", because only the
# first one needs a human at a terminal running `claude` to sign in again.
if grep -qiE 'authenticat|oauth|expired|unauthorized|401' <<<"$OUT"; then
  echo "auth: FAILED -- the OAuth session is not usable (exit $RC)"
  echo "auth: fix by running 'claude' interactively on a login node and signing in"
  exit 1
fi

if [[ $RC -eq 124 ]]; then
  echo "auth: FAILED -- claude timed out after 180s (exit 124)"
  exit 1
fi

echo "auth: FAILED -- claude exited $RC without an auth-specific error"
exit 1
