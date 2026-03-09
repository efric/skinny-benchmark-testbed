#!/bin/bash
# Run iree-benchmark-module on all .vmfb files in the directory.
set -e

for vmfb in *.vmfb; do
  [ -f "$vmfb" ] || continue
  echo "=== Benchmarking $vmfb ==="
  iree-benchmark-module \
    --device=hip://7 \
    --device_allocator=caching \
    --hip_use_streams=true \
    --module="$vmfb" \
    --benchmark_repetitions=5
  echo
done
