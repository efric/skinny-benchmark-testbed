#!/bin/bash
# Compile all skinny gemm validation tests from dump subdirectories and verify smfmac emission.
set -e

IREE_COMPILE="${IREE_COMPILE:-iree-compile}"
TARGET="${TARGET:-gfx942}"

for dump_dir in dump-*/; do
  base="${dump_dir#dump-}"
  base="${base%/}"
  mlir=$(ls "$dump_dir"*_benchmark.mlir 2>/dev/null | head -1)
  if [ -z "$mlir" ]; then
    echo "=== Skipping $dump_dir: no *_benchmark.mlir found ==="
    continue
  fi
  vmfb="${base}.vmfb"
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
