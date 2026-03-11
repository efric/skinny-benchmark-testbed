#!/bin/bash
# Run iree-benchmark-module on .vmfb files in the directory.
# Usage: ./benchmark_vmfbs.sh [-p prefix...]
#   -p/--prefix: select which variant prefixes to benchmark (repeatable)
#   If no prefixes given, benchmarks all .vmfb files.
#
# Examples:
#   ./benchmark_vmfbs.sh
#   ./benchmark_vmfbs.sh -p vdmfma-full-sg2
#   ./benchmark_vmfbs.sh -p vdmfma-full-sg2 -p baseline-full-sg4
set -e

source "$(dirname "$0")/common.sh"

DEVICE="${DEVICE:---device=hip://7}"
REPS="${REPS:-5}"

parse_prefix_args "$@"
[ ${#REMAINING_ARGS[@]} -gt 0 ] && echo "Unknown arguments: ${REMAINING_ARGS[*]}" >&2 && exit 1

for vmfb in *.vmfb; do
  [ -f "$vmfb" ] || continue
  if [ ${#SELECTED_PREFIXES[@]} -gt 0 ]; then
    matches_prefix "$vmfb" "${SELECTED_PREFIXES[@]}" || continue
  fi

  echo "=== Benchmarking $vmfb ==="
  iree-benchmark-module \
    $DEVICE \
    --device_allocator=caching \
    --hip_use_streams=true \
    --module="$vmfb" \
    --benchmark_repetitions="$REPS"
  echo
done
