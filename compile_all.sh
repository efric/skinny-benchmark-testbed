#!/bin/bash
# Compile all skinny gemm validation tests and verify smfmac emission.
set -e

IREE_COMPILE="${IREE_COMPILE:-/home/ericfeng/iree_/iree/svmfma/build/tools/iree-compile}"
TARGET="${TARGET:-gfx942}"

for mlir in skinny_gemm_*.mlir; do
  base="${mlir%.mlir}"
  dump_dir="dump-${base}"
  vmfb="${base}.vmfb"
  echo "=== Compiling $mlir ==="
  "$IREE_COMPILE" "$mlir" \
    --iree-hal-target-backends=rocm \
    --iree-rocm-target="$TARGET" \
    -o "$vmfb" \
    --iree-hal-dump-executable-files-to="$dump_dir"

  rocmasm=$(ls "$dump_dir"/*.rocmasm 2>/dev/null | head -1)
  if [ -z "$rocmasm" ]; then
    echo "  ERROR: no .rocmasm file found in $dump_dir"
    continue
  fi
  smfmac_count=$(grep -c 'v_smfmac' "$rocmasm" || true)
  mfma_count=$(grep -c 'v_mfma' "$rocmasm" || true)
  echo "  smfmac count: $smfmac_count"
  echo "  mfma count:   $mfma_count"
  if [ "$smfmac_count" -gt 0 ] && [ "$mfma_count" -eq 0 ]; then
    echo "  PASS: only smfmac emitted"
  else
    echo "  FAIL: expected only smfmac instructions"
  fi
  echo
done
