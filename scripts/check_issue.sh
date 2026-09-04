#!/usr/bin/env bash
# Did this week's brief actually get produced?
#
# Every other alert in this pipeline fires from inside a run. If the Slurm job never
# starts at all -- a queue backlog, a node failure, a submission that vanished -- then
# nothing runs, and nothing complains. Silence looks identical to success, which is
# precisely how the 2026-09-01 issue went unnoticed for three days.
#
# So this checks for the artefact itself rather than trusting any run to report in.
# Fires the morning after the scheduled build.
set -uo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/_common.sh"

MAX_AGE_DAYS="${MAX_AGE_DAYS:-8}"   # a week plus a day of slack

newest=""
for d in "$ROOT"/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]; do
  [[ -f "$d/report.pdf" ]] || continue
  stamp=$(basename "$d")
  [[ -z "$newest" || "$stamp" > "$newest" ]] && newest="$stamp"
done

if [[ -z "$newest" ]]; then
  echo "check: no issue has ever been built"
  python3 "$ROOT/scripts/notify.py" \
    --subject "no brief has ever been produced" \
    --message "No dated issue folder contains a report.pdf. The pipeline has never produced anything." \
    --log-path "$ROOT/logs/cron.log"
  exit 1
fi

age=$(( ( $(date +%s) - $(date -d "$newest" +%s) ) / 86400 ))

if (( age > MAX_AGE_DAYS )); then
  echo "check: newest issue is $newest, $age days old -- overdue"
  python3 "$ROOT/scripts/notify.py" \
    --subject "no brief this week -- the newest is $newest" \
    --message "The most recent issue is dated $newest, $age days ago, so this week's run did not produce one and did not report why.

Check whether the job was ever queued or ran:
  tail -20 $ROOT/logs/submit.log
  sacct -u \$USER --name=weekly-ai-brief -S \$(date -d '8 days ago' +%F)

Then build it by hand with:
  bash $ROOT/scripts/submit_weekly.sh" \
    --log-path "$ROOT/logs/cron.log"
  exit 1
fi

echo "check: newest issue is $newest, $age days old -- ok"
exit 0
