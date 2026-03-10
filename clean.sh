#!/bin/bash
# Delete generated dump directories and .vmfb files.
# Usage: ./clean.sh [prefix...]
#   prefix: one or more prefixes to clean (default: all known prefixes)
#
# Examples:
#   ./clean.sh                          # clean everything
#   ./clean.sh vdmfma-half-sg4          # clean one variant
#   ./clean.sh baseline-full-sg2 baseline-full-sg4  # clean two variants

ALL_PREFIXES=(
  vdmfma-full-sg2 vdmfma-full-sg4 vdmfma-half-sg2 vdmfma-half-sg4
  baseline-full-sg2 baseline-full-sg4 baseline-half-sg2 baseline-half-sg4
  dump baseline
  vdmfma-full vdmfma-half baseline-full baseline-half
)

if [ $# -gt 0 ]; then
  PREFIXES=("$@")
else
  PREFIXES=("${ALL_PREFIXES[@]}")
fi

for PREFIX in "${PREFIXES[@]}"; do
  dirs=("${PREFIX}"-skinny_gemm_*/)
  if [ -d "${dirs[0]}" ]; then
    echo "Removing ${PREFIX}-skinny_gemm_*/ ..."
    rm -rf "${PREFIX}"-skinny_gemm_*/
  fi
done

# Clean .vmfb files (both prefixed and unprefixed).
vmfbs=(*skinny_gemm_*.vmfb)
if [ -f "${vmfbs[0]}" ]; then
  echo "Removing *skinny_gemm_*.vmfb ..."
  rm -f *skinny_gemm_*.vmfb
fi

echo "Done."
