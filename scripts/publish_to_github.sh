#!/usr/bin/env bash
# Commit one week's issue and push it to GitHub. Called by run_weekly.sh after a
# successful run; safe to run by hand to retry a push that failed.
#
#   bash scripts/publish_to_github.sh 2026-08-25            # normal
#   bash scripts/publish_to_github.sh 2026-08-25 check-failed  # note a failed source check
#
# Exits non-zero if the push did not land, so the caller can report it. The mail has
# already gone out by then -- a failure here means "retry the push", nothing more.
set -uo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/_common.sh"
STAMP="${1:-$(date +%F)}"
HEALTH="${2:-ok}"
OUTDIR="$ROOT/$(issue_dir "$STAMP")"
BRANCH="main"

cd "$ROOT" || exit 1

if [[ ! -d .git ]]; then
  echo "publish: no git repo at $ROOT -- see 'Publishing to GitHub' in README.md"
  exit 1
fi

# --- branch guard -------------------------------------------------------------
# `git commit` writes to HEAD but `git push origin main` pushes the ref by NAME. If
# HEAD is detached or on another branch, the commit lands off-branch, the push is a
# silent no-op, and it still exits 0 -- an unattended run would report success while
# the issue never reached GitHub. Refuse to guess.
CURRENT=$(git symbolic-ref --quiet --short HEAD)
if [[ -z "$CURRENT" ]]; then
  echo "publish: ABORT -- HEAD is detached; check out $BRANCH before publishing"
  exit 1
fi
if [[ "$CURRENT" != "$BRANCH" ]]; then
  echo "publish: ABORT -- on branch '$CURRENT', expected '$BRANCH'"
  exit 1
fi

# --- secret guard -------------------------------------------------------------
# .gitignore only protects files that were never added; anything force-added stays
# tracked forever. Re-check the index before every push. The globs must match at ANY
# depth -- a bare `.env` pathspec anchors at the repo root and would miss 2026-08-25/.env.
TRACKED_SECRETS=$(git ls-files -- \
  ':(glob)**/.env' ':(glob).env' \
  ':(glob)**/List_Of_People_To_Send_To.csv' ':(glob)List_Of_People_To_Send_To.csv' \
  ':(glob)**/.ipynb_checkpoints/**' \
  ':(glob)logs/**' 2>/dev/null)
if [[ -n "$TRACKED_SECRETS" ]]; then
  echo "publish: ABORT -- these are tracked but must never be pushed:"
  echo "$TRACKED_SECRETS" | sed 's/^/  /'
  echo "publish: fix with 'git rm --cached <file>' before pushing"
  exit 1
fi

# --- stage this week's output -------------------------------------------------
# Explicit path only: never `git add -A`, which would sweep up whatever else happens
# to be sitting in the working tree. Run logs are deliberately NOT published -- they
# are a verbatim transcript of an agent that reads .env and the recipient CSV, so they
# can quote either. They stay on the machine.
if [[ ! -d "$OUTDIR" ]]; then
  echo "publish: nothing to publish -- $OUTDIR does not exist"
  exit 1
fi

git add -- "$(issue_dir "$STAMP")" || exit 1

# `grep -c` prints 0 AND exits 1 when nothing matches, so an `|| echo` fallback inside
# the substitution appends a SECOND line and the arithmetic below dies on "0\n1".
count_matches() {   # $1=regex $2=file -- prints a plain integer, 0 if the file is missing
  local n
  [[ -f "$2" ]] || { printf '0'; return; }
  n=$(grep -cE "$1" "$2" 2>/dev/null)
  printf '%s' "${n:-0}"
}

if git diff --cached --quiet; then
  echo "publish: no staged changes for $STAMP -- already committed, moving to push"
else
  PAGES=$(python3 -c "import fitz,sys; print(fitz.open(sys.argv[1]).page_count)" \
            "$OUTDIR/report.pdf" 2>/dev/null) || PAGES=""
  [[ -n "$PAGES" ]] || PAGES="?"
  SOURCES=$(count_matches '^\|[[:space:]]*S[0-9]+[[:space:]]*\|' "$OUTDIR/SOURCES.md")
  ROWS=$(count_matches '[^[:space:]]' "$ROOT/List_Of_People_To_Send_To.csv")
  PEOPLE=$(( ROWS > 0 ? ROWS - 1 : 0 ))

  BODY="- $PAGES pages, $SOURCES sources, $PEOPLE recipients"
  # An issue that failed its source check was still built and mailed, so it belongs in
  # the history -- but the commit has to say so rather than look clean.
  [[ "$HEALTH" == "ok" ]] || BODY="$BODY
- WARNING: source check did not pass"

  git commit -q -m "docs(brief): add issue for $STAMP" -m "$BODY" || exit 1
  echo "publish: committed $(git rev-parse --short HEAD)"
fi

# --- push ---------------------------------------------------------------------
if ! git remote get-url origin >/dev/null 2>&1; then
  echo "publish: no 'origin' remote configured"
  exit 1
fi

# Push the commit we just made, by SHA, not by branch name.
push() { git push -q origin "HEAD:$BRANCH" 2>&1; }

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
echo "publish: push FAILED -- the issue is committed locally, retry with:"
echo "         bash scripts/publish_to_github.sh $STAMP"
exit 1
