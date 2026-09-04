#!/usr/bin/env bash
# Copy the weekly-ai-report skill from this repo into ~/.claude/skills/.
#
# Claude Code only loads skills from ~/.claude/skills/, and it is not this repo. Until
# this has been run, run_weekly.sh asks Claude to use a skill that is not installed and
# the run produces nothing useful.
#
# A copy, not a symlink: the repo is meant to be self-contained, and the installed
# skill is meant to keep working if the clone moves or goes away. Re-run this after
# pulling changes to skill/.
#
#   bash scripts/install_skill.sh
set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/_common.sh"

SRC="$ROOT/skill"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}/weekly-ai-report"

[[ -f "$SRC/SKILL.md" ]] || { echo "install: no skill at $SRC" >&2; exit 1; }

if [[ -L "$DEST" ]]; then
  echo "install: $DEST is a symlink -- replacing it with a real copy"
  rm "$DEST"
elif [[ -d "$DEST" ]]; then
  if diff -r "$SRC" "$DEST" >/dev/null 2>&1; then
    echo "install: already up to date at $DEST"
    exit 0
  fi
  echo "install: refreshing $DEST"
  rm -rf "$DEST"
fi

mkdir -p "$(dirname "$DEST")"
cp -r "$SRC" "$DEST"
echo "install: skill installed to $DEST"
diff -r "$SRC" "$DEST" >/dev/null && echo "install: verified identical to skill/ in the repo"
