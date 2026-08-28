#!/usr/bin/env bash
# Install (or refresh) the Tuesday 15:00 crontab entry for the Weekly AI Brief.
# Idempotent: re-running replaces the existing line rather than adding a second.
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
LINE="0 15 * * 2 /usr/bin/env bash $ROOT/scripts/run_weekly.sh >> $ROOT/logs/cron.log 2>&1 $MARKER"

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

{ printf '%s\n' "$cleaned" | grep -v '^$' || true; printf '%s\n' "$LINE"; } | crontab -
echo "installed on $(hostname):"
crontab -l | grep -F "$MARKER"
echo
echo "Next: confirm the pipeline works unattended before Tuesday --"
echo "  DRY_RUN=1 bash $ROOT/scripts/run_weekly.sh"
