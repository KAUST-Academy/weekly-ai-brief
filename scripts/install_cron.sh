#!/usr/bin/env bash
# Install (or refresh) the crontab entries for the Weekly AI Brief.
# Idempotent: re-running replaces the existing lines rather than adding more.
#
# Four entries, all tagged with the same marker so --remove takes them all:
#
#   09:00 daily      keep the Claude login warm, and alert if it has died. A dead
#                    login can only be fixed by a human signing in, so the warning
#                    has to arrive with days to spare, not at build time.
#   14:45 Tuesday    one more refresh so the build starts on a minutes-old token.
#   15:00 Tuesday    submit the build to Slurm. The agent cannot run on a login node
#                    -- it gets reaped (see weekly_job.sbatch) -- so cron only queues
#                    the job and a compute node does the work.
#   09:00 Wednesday  confirm an issue actually appeared. If the job never ran, no
#                    other alert can fire, so this checks for the artefact itself.
#
# Run this ON A LOGIN NODE (glogin*), not a compute node -- the cron spool is
# node-local, so an entry installed on a compute node disappears with the job.
#
#   bash scripts/install_cron.sh          # install / refresh
#   bash scripts/install_cron.sh --remove # uninstall
#   crontab -l                            # verify
set -euo pipefail

ROOT="/ibex/user/habiam0b/Weekly_AI_Reports"
MARKER="# weekly-ai-brief"
SUBMIT="/usr/bin/env bash $ROOT/scripts/submit_weekly.sh >> $ROOT/logs/cron.log 2>&1"
KEEP="/usr/bin/env bash $ROOT/scripts/auth_keepalive.sh >> $ROOT/logs/cron.log 2>&1"
VERIFY="/usr/bin/env bash $ROOT/scripts/check_issue.sh >> $ROOT/logs/cron.log 2>&1"

LINES=(
  "0 9 * * *  $KEEP $MARKER"
  "45 14 * * 2 $KEEP $MARKER"
  "0 15 * * 2 $SUBMIT $MARKER"
  "0 9 * * 3  $VERIFY $MARKER"
)

case "$(hostname)" in
  glogin*|login*) : ;;
  *) echo "warning: $(hostname) does not look like a login node." >&2
     echo "         Cron spools are per-node; this entry may never fire." >&2
     read -r -p "         Install anyway? [y/N] " reply
     [[ "$reply" == [yY] ]] || { echo "aborted."; exit 1; } ;;
esac

mkdir -p "$ROOT/logs"
current="$(crontab -l 2>/dev/null || true)"
cleaned="$(printf '%s\n' "$current" | grep -v -F "$MARKER" || true)"

if [[ "${1:-}" == "--remove" ]]; then
  printf '%s\n' "$cleaned" | grep -v '^$' | crontab -
  echo "removed. current crontab:"; crontab -l 2>/dev/null || echo "  (empty)"
  exit 0
fi

{ printf '%s\n' "$cleaned" | grep -v '^$' || true; printf '%s\n' "${LINES[@]}"; } | crontab -
echo "installed on $(hostname):"
crontab -l | grep -F "$MARKER"
echo
echo "Next: confirm the pipeline works unattended before Tuesday --"
echo "  bash $ROOT/scripts/check_auth.sh          # is the login usable?"
echo "  bash $ROOT/scripts/submit_weekly.sh       # queue a real run now"
echo "  squeue -u \$USER -n weekly-ai-brief        # watch it"
