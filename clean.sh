#!/bin/bash
# Delete generated dump directories and .vmfb files.
# Usage: ./clean.sh [-p prefix...] [prefix...]
#   -p/--prefix or positional args: prefixes to clean (default: all known prefixes)
#
# Examples:
#   ./clean.sh                          # clean everything
#   ./clean.sh vdmfma-half-sg4          # clean one variant
#   ./clean.sh -p baseline-full-sg2 -p baseline-full-sg4  # clean two variants

source "$(dirname "$0")/common.sh"

LEGACY_PREFIXES=(dump baseline vdmfma-full vdmfma-half baseline-full baseline-half)

parse_prefix_args "$@"
# Positional args are also prefixes (backward compatibility).
SELECTED_PREFIXES+=("${REMAINING_ARGS[@]}")

if [ ${#SELECTED_PREFIXES[@]} -gt 0 ]; then
  PREFIXES=("${SELECTED_PREFIXES[@]}")
else
  PREFIXES=("${ALL_PREFIXES[@]}" "${LEGACY_PREFIXES[@]}")
fi

for PREFIX in "${PREFIXES[@]}"; do
  dirs=("${PREFIX}"-skinny_gemm_*/)
  if [ -d "${dirs[0]}" ]; then
    echo "Removing ${PREFIX}-skinny_gemm_*/ ..."
    rm -rf "${PREFIX}"-skinny_gemm_*/
  fi

  # Scope vmfb cleanup to the selected prefixes.
  vmfbs=("${PREFIX}"-skinny_gemm_*.vmfb)
  if [ -f "${vmfbs[0]}" ]; then
    echo "Removing ${PREFIX}-skinny_gemm_*.vmfb ..."
    rm -f "${PREFIX}"-skinny_gemm_*.vmfb
  fi
done

echo "Done."
