#!/usr/bin/env bash
# Cron target on the login node: hand the weekly brief to Slurm and get out of the way.
#
# Submitting is light enough for a login node; the run itself is not (see
# weekly_job.sbatch). If the submission fails there is no job and therefore nothing
# else that could ever alert, so this is the one place that has to speak up itself.
#
#   bash scripts/submit_weekly.sh            # queue this week's issue
#   FORCE=1 bash scripts/submit_weekly.sh    # rebuild + resend an existing issue
set -uo pipefail

ROOT="/ibex/user/habiam0b/Weekly_AI_Reports"
CONDA_BIN="/ibex/user/habiam0b/miniconda3/bin"
export PATH="/opt/slurm/cluster/ibex/install-v2/RedHat-9/bin:$CONDA_BIN:$HOME/bin:$HOME/.local/bin:$PATH"

mkdir -p "$ROOT/logs"
LOG="$ROOT/logs/submit.log"

say() { printf '%s  %s\n' "$(date -Is)" "$1" | tee -a "$LOG"; }

if ! command -v sbatch >/dev/null 2>&1; then
  say "FAIL: sbatch not on PATH -- cannot queue the weekly brief"
  python3 "$ROOT/scripts/notify.py" \
    --subject "could not queue this week's brief" \
    --message "sbatch was not found on the login node, so no job was submitted and no brief will be produced this week." \
    --log-path "$LOG" >> "$LOG" 2>&1
  exit 1
fi

OUT=$(sbatch "$ROOT/scripts/weekly_job.sbatch" 2>&1)
RC=$?

if [[ $RC -ne 0 ]]; then
  say "FAIL: sbatch rejected the job -- $OUT"
  python3 "$ROOT/scripts/notify.py" \
    --subject "could not queue this week's brief" \
    --message "Slurm refused the submission, so no brief will be produced this week.

sbatch said: $OUT

Retry with:
  bash $ROOT/scripts/submit_weekly.sh" \
    --log-path "$LOG" >> "$LOG" 2>&1
  exit 1
fi

say "queued: $OUT"
exit 0
