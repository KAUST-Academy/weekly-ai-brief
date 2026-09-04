#!/bin/bash
# The weekly brief, run on a compute node.
#
# Why this exists: the agent cannot run on an IBEX login node. It was tried twice on
# 2026-09-04 and killed both times -- SIGKILL, exit 137, at 38s and again at 110s
# with the SSH session held open. Not memory (the user cgroup reported oom_kill 0
# against a 20 GiB cap) and not the ssh disconnect: a login-node reaper sweeps up
# sustained processes, which is exactly what a 10-30 minute research agent looks
# like. Login nodes are for light work, so the work moved instead of fighting it.
#
# Cron still fires on the login node -- submitting a job is light. The job does the work.
#
# Submit it with scripts/submit_weekly.sh, which fills in the partition, the log
# paths and WEEKLY_AI_ROOT. Those are the three things that cannot be written down
# here without naming one cluster and one account.
#
#SBATCH --job-name=weekly-ai-brief
#SBATCH --partition=batch
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G

# Slurm runs a copy of this file out of its spool directory, so the script cannot
# find the repo from its own path the way every other script here does.
ROOT="${WEEKLY_AI_ROOT:?set by scripts/submit_weekly.sh -- submit through that, not sbatch directly}"

echo "=== slurm job ${SLURM_JOB_ID:-?} on $(hostname) at $(date -Is) ==="

# DRY_RUN / FORCE / PUBLISH reach here through sbatch's default --export=ALL.
bash "$ROOT/scripts/run_weekly.sh"
STATUS=$?

echo "=== slurm job ${SLURM_JOB_ID:-?} finished at $(date -Is), status $STATUS ==="
exit $STATUS
