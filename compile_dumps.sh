#!/bin/bash
# Step 2: Compile dump directories to produce .vmfb files and report MMA stats.
# Usage: ./compile_dumps.sh [-p prefix...] [prefix...]
#   -p/--prefix: select which variant prefixes to compile (repeatable)
#   Positional args are also treated as prefixes (for backward compatibility).
#   If no prefixes given, compiles all variants.
#
# Examples:
#   ./compile_dumps.sh                          # all variants
#   ./compile_dumps.sh vdmfma-half-sg4          # one variant (positional)
#   ./compile_dumps.sh -p vdmfma-half-sg4 -p baseline-half-sg4  # two variants
set -e

source "$(dirname "$0")/common.sh"

IREE_COMPILE="${IREE_COMPILE:-/home/ericfeng/iree_/iree/svmfma/build/tools/iree-compile}"
TARGET="${TARGET:-gfx942}"

parse_prefix_args "$@"
# Positional args are also prefixes (backward compatibility).
SELECTED_PREFIXES+=("${REMAINING_ARGS[@]}")

# Include legacy prefixes in the default set.
if [ ${#SELECTED_PREFIXES[@]} -gt 0 ]; then
  PREFIXES=("${SELECTED_PREFIXES[@]}")
else
  PREFIXES=("${ALL_PREFIXES[@]}" dump baseline)
fi

for PREFIX in "${PREFIXES[@]}"; do
  # Skip prefixes with no matching directories.
  dirs=("${PREFIX}"-skinny_gemm_*/)
  [ -d "${dirs[0]}" ] || continue

  echo "============================================="
  echo " Variant: $PREFIX"
  echo "============================================="

  for dump_dir in "${PREFIX}"-*/; do
    base="${dump_dir#${PREFIX}-}"
    base="${base%/}"
    mlir=$(ls "$dump_dir"*_benchmark.mlir 2>/dev/null | head -1)
    if [ -z "$mlir" ]; then
      echo "=== Skipping $dump_dir: no *_benchmark.mlir found ==="
      continue
    fi
    vmfb="${PREFIX}-${base}.vmfb"
    echo "=== Compiling $mlir -> $vmfb ==="
    "$IREE_COMPILE" "$mlir" \
      --iree-hal-target-backends=rocm \
      --iree-rocm-target="$TARGET" \
      -o "$vmfb"

    rocmasm=$(ls "$dump_dir"*.rocmasm 2>/dev/null | head -1)
    if [ -z "$rocmasm" ]; then
      echo "  WARNING: no .rocmasm file found in $dump_dir"
    else
      smfmac_count=$(grep -c 'v_smfmac' "$rocmasm" || true)
      mfma_count=$(grep -c 'v_mfma' "$rocmasm" || true)
      wg=$(grep 'max_flat_workgroup_size' "$rocmasm" | awk '{print $NF}')
      vgpr=$(grep '\.vgpr_count' "$rocmasm" | awk '{print $NF}')

      # Detect expected intrinsic type from prefix.
      if [[ "$PREFIX" == vdmfma* ]]; then
        expected="smfmac"
      elif [[ "$PREFIX" == baseline* ]]; then
        expected="mfma"
      elif [[ "$PREFIX" == dump* ]]; then
        expected="smfmac"
      else
        expected="unknown"
      fi

      echo "  smfmac: $smfmac_count | mfma: $mfma_count | wg: $wg | vgpr: $vgpr"
      if [ "$expected" = "smfmac" ]; then
        if [ "$smfmac_count" -gt 0 ] && [ "$mfma_count" -eq 0 ]; then
          echo "  PASS"
        else
          echo "  FAIL: expected only smfmac"
        fi
      elif [ "$expected" = "mfma" ]; then
        if [ "$mfma_count" -gt 0 ] && [ "$smfmac_count" -eq 0 ]; then
          echo "  PASS"
        else
          echo "  FAIL: expected only mfma"
        fi
      fi
    fi
    echo
  done
done
