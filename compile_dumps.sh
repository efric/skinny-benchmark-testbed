#!/bin/bash
# Step 2: Compile dump-* directories to produce .vmfb files and verify smfmac emission.
# Usage: ./compile_dumps.sh [dump_prefix] [vmfb_prefix]
#   dump_prefix: prefix of dump directories to look for (default: dump)
#   vmfb_prefix: prefix for output .vmfb filenames (default: none)
set -e

IREE_COMPILE="${IREE_COMPILE:-/home/ericfeng/iree_/iree/svmfma/build/tools/iree-compile}"
TARGET="${TARGET:-gfx942}"
DUMP_PREFIX="${1:-dump}"
VMFB_PREFIX="${2:-}"

for dump_dir in "${DUMP_PREFIX}"-*/; do
  base="${dump_dir#${DUMP_PREFIX}-}"
  base="${base%/}"
  mlir=$(ls "$dump_dir"*_benchmark.mlir 2>/dev/null | head -1)
  if [ -z "$mlir" ]; then
    echo "=== Skipping $dump_dir: no *_benchmark.mlir found ==="
    continue
  fi
  vmfb="${VMFB_PREFIX}${base}.vmfb"
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
    echo "  smfmac count: $smfmac_count"
    echo "  mfma count:   $mfma_count"
    if [ "$smfmac_count" -gt 0 ] && [ "$mfma_count" -eq 0 ]; then
      echo "  PASS: only smfmac emitted"
    else
      echo "  FAIL: expected only smfmac instructions"
    fi
  fi
  echo
done
