#!/usr/bin/env bash
# Commit one week's issue and push it to GitHub. Called by run_weekly.sh after a
# successful run; safe to run by hand to retry a push that failed.
#
#   bash scripts/publish_to_github.sh 2026-08-25
#
# Exits non-zero if the push did not land, so the caller can report it. The mail
# has already gone out by then -- a failure here means "retry the push", nothing more.
set -uo pipefail

ROOT="/ibex/user/habiam0b/Weekly_AI_Reports"
STAMP="${1:-$(date +%F)}"
OUTDIR="$ROOT/$STAMP"
BRANCH="main"

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
cd "$ROOT" || exit 1

if [[ ! -d .git ]]; then
  echo "publish: no git repo at $ROOT -- see 'Publishing to GitHub' in README.md"
  exit 1
fi

# --- secret guard -------------------------------------------------------------
# .gitignore only protects files that were never added. Anything force-added stays
# tracked forever, so re-check the index itself before every push.
TRACKED_SECRETS=$(git ls-files -- .env 'List_Of_People_To_Send_To.csv' '*.ipynb_checkpoints*' 2>/dev/null)
if [[ -n "$TRACKED_SECRETS" ]]; then
  echo "publish: ABORT -- these are tracked but must never be pushed:"
  echo "$TRACKED_SECRETS" | sed 's/^/  /'
  echo "publish: fix with 'git rm --cached <file>' before pushing"
  exit 1
fi

# --- stage this week's output -------------------------------------------------
# Explicit paths only: never `git add -A`, which would sweep up whatever else
# happens to be sitting in the working tree.
if [[ ! -d "$OUTDIR" ]]; then
  echo "publish: nothing to publish -- $OUTDIR does not exist"
  exit 1
fi

git add -- "$STAMP" || exit 1
[[ -f "logs/run-$STAMP.log" ]] && git add -- "logs/run-$STAMP.log"
# Log pruning deletes older logs; record those removals too.
git add -u -- logs 2>/dev/null

if git diff --cached --quiet; then
  echo "publish: no staged changes for $STAMP -- already committed, moving to push"
else
  PAGES=$(python3 -c "import fitz,sys; print(fitz.open(sys.argv[1]).page_count)" "$OUTDIR/report.pdf" 2>/dev/null || echo "?")
  SOURCES=$(grep -cE '^\|\s*S[0-9]+\s*\|' "$OUTDIR/SOURCES.md" 2>/dev/null || echo "?")
  PEOPLE=$(( $(grep -cve '^\s*$' "$ROOT/List_Of_People_To_Send_To.csv" 2>/dev/null || echo 1) - 1 ))

  git commit -q \
    -m "docs(brief): add issue for $STAMP" \
    -m "- $PAGES pages, $SOURCES sources, $PEOPLE recipients
- run log kept for audit" || exit 1
  echo "publish: committed $(git rev-parse --short HEAD)"
fi

# --- push ---------------------------------------------------------------------
if ! git remote get-url origin >/dev/null 2>&1; then
  echo "publish: no 'origin' remote configured"
  exit 1
fi

push() { git push -q origin "$BRANCH" 2>&1; }

if push; then
  echo "publish: pushed to $(git remote get-url origin) ($BRANCH)"
  exit 0
fi

# Someone committed in between. Replay our commit on top and try once more.
echo "publish: push rejected, rebasing on origin/$BRANCH and retrying"
git fetch -q origin "$BRANCH" || { echo "publish: fetch failed"; exit 1; }
if ! git rebase -q "origin/$BRANCH"; then
  git rebase --abort 2>/dev/null
  echo "publish: rebase conflict -- resolve by hand, then rerun this script"
  exit 1
fi
if push; then
  echo "publish: pushed after rebase"
  exit 0
fi
echo "publish: push FAILED -- the issue is committed locally, retry with 'bash scripts/publish_to_github.sh $STAMP'"
exit 1
