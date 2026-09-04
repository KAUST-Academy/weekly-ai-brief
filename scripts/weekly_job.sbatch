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
#SBATCH --job-name=weekly-ai-brief
#SBATCH --partition=batch
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --output=/ibex/user/habiam0b/Weekly_AI_Reports/logs/slurm-%j.out
#SBATCH --error=/ibex/user/habiam0b/Weekly_AI_Reports/logs/slurm-%j.out

ROOT="/ibex/user/habiam0b/Weekly_AI_Reports"

echo "=== slurm job ${SLURM_JOB_ID:-?} on $(hostname) at $(date -Is) ==="

# DRY_RUN / FORCE / PUBLISH reach here through sbatch's default --export=ALL.
bash "$ROOT/scripts/run_weekly.sh"
STATUS=$?

echo "=== slurm job ${SLURM_JOB_ID:-?} finished at $(date -Is), status $STATUS ==="
exit $STATUS
