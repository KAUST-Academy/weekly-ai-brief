# Shared setup for every script in this pipeline. Sourced, never executed.
#
# Nothing here names an account, a cluster or a home directory. ROOT is worked out
# from this file's own location, so a clone runs wherever it is put -- which is the
# whole point of keeping the skill, the template and the scripts in one repo.
#
# Override ROOT with WEEKLY_AI_ROOT when the caller cannot rely on its own path,
# which is what the Slurm job does: Slurm runs a *copy* of the batch script from its
# spool directory, so BASH_SOURCE there points somewhere useless.

_wa_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="${WEEKLY_AI_ROOT:-$(cd "$_wa_dir/.." && pwd)}"
unset _wa_dir

# Add a directory to the front of PATH, but only if it exists and is not already
# there. Written as a plain if so it always succeeds -- several callers run under
# `set -e`, where a bare `[[ -d x ]] && ...` that finds nothing would kill the script.
_wa_prepend() {
  if [[ -d "$1" ]]; then
    case ":$PATH:" in
      *":$1:"*) : ;;
      *) PATH="$1:$PATH" ;;
    esac
  fi
  return 0
}

# Lowest priority first -- each prepend pushes the previous one down.
_wa_prepend "$HOME/.local/bin"                                    # claude
_wa_prepend "$HOME/bin"                                           # tectonic
_wa_prepend "/opt/slurm/cluster/ibex/install-v2/RedHat-9/bin"     # sbatch on IBEX
for _wa_c in "${WEEKLY_AI_CONDA_BIN:-}" \
             "/ibex/user/${USER:-nobody}/miniconda3/bin" \
             "$HOME/miniconda3/bin"; do
  if [[ -n "$_wa_c" && -d "$_wa_c" ]]; then
    _wa_prepend "$_wa_c"                                          # python3 with pymupdf
    break
  fi
done
unset _wa_c
export PATH
