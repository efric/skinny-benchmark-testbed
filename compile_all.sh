#!/bin/bash
# Step 1: Compile skinny_gemm_*.mlir to produce dump-* directories.
# Usage: ./compile_all.sh [dump_prefix]
#   dump_prefix: prefix for dump directories (default: dump)
set -e

IREE_COMPILE="${IREE_COMPILE:-iree-compile}"
TARGET="${TARGET:-gfx942}"
DUMP_PREFIX="${1:-dump}"

for mlir in skinny_gemm_*.mlir; do
  [ -f "$mlir" ] || continue
  base="${mlir%.mlir}"
  dump_dir="${DUMP_PREFIX}-${base}"
  echo "=== Compiling $mlir -> $dump_dir ==="
  "$IREE_COMPILE" "$mlir" \
    --iree-hal-target-backends=rocm \
    --iree-rocm-target="$TARGET" \
    -o "/dev/null" \
    --iree-hal-dump-executable-files-to="$dump_dir"
  echo
done
