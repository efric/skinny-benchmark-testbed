#!/bin/bash
# Run rocprofv3 with iree-benchmark-module for baseline and sparse trick vmfbs.
# Baseline: baselineskinny_gemm_*.vmfb -> traces/baseline/<name>
# Sparse trick: skinny_gemm_*.vmfb -> traces/sparsetrick/<name>
set -e

for vmfb in baselineskinny_gemm_*.vmfb; do
  [ -f "$vmfb" ] || continue
  name="${vmfb%.vmfb}"
  trace_dir="traces/baseline/${name}"
  echo "=== Profiling (baseline) $vmfb -> $trace_dir ==="
  mkdir -p "$trace_dir"
  rocprofv3 --att -d "$trace_dir" -- iree-benchmark-module \
    --device=hip://7 \
    --device_allocator=caching \
    --hip_use_streams=true \
    --module="$vmfb"
  echo
done

for vmfb in skinny_gemm_*.vmfb; do
  [ -f "$vmfb" ] || continue
  name="${vmfb%.vmfb}"
  trace_dir="traces/sparsetrick/${name}"
  echo "=== Profiling (sparse trick) $vmfb -> $trace_dir ==="
  mkdir -p "$trace_dir"
  rocprofv3 --att -d "$trace_dir" -- iree-benchmark-module \
    --device=hip://7 \
    --device_allocator=caching \
    --hip_use_streams=true \
    --module="$vmfb"
  echo
done
