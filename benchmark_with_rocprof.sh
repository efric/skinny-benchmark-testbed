#!/bin/bash
# Run rocprofv3 with iree-benchmark-module on variant vmfbs.
# Usage: ./benchmark_with_rocprof.sh [postfix...]
#   postfix: type+shape suffix, e.g. f16_8x13312x16384
#   If omitted, profiles all available vmfbs.
#
# Examples:
#   ./benchmark_with_rocprof.sh f16_8x13312x16384
#   ./benchmark_with_rocprof.sh f16_8x13312x16384 f8E4M3FNUZ_8x13312x16384
#   ./benchmark_with_rocprof.sh   # all
set -e

DEVICE="${DEVICE:---device=hip://7}"

if [ $# -gt 0 ]; then
  # Build vmfb list from postfix args.
  vmfbs=()
  for post in "$@"; do
    for f in *-skinny_gemm_"${post}".vmfb skinny_gemm_"${post}".vmfb; do
      [ -f "$f" ] && vmfbs+=("$f")
    done
  done
else
  vmfbs=(*.vmfb)
fi

for vmfb in "${vmfbs[@]}"; do
  [ -f "$vmfb" ] || continue
  name="${vmfb%.vmfb}"
  # Derive trace subdirectory from the variant prefix.
  # e.g. vdmfma-half-sg4-skinny_gemm_f16_8x13312x16384 -> traces/vdmfma-half-sg4/skinny_gemm_f16_8x13312x16384
  if [[ "$name" == *-skinny_gemm_* ]]; then
    prefix="${name%-skinny_gemm_*}"
    shape="skinny_gemm_${name##*-skinny_gemm_}"
    trace_dir="traces/${prefix}/${shape}"
  else
    trace_dir="traces/${name}"
  fi

  echo "=== Profiling $vmfb -> $trace_dir ==="
  mkdir -p "$trace_dir"
  rocprofv3 --att -d "$trace_dir" -- iree-benchmark-module \
    $DEVICE \
    --device_allocator=caching \
    --hip_use_streams=true \
    --module="$vmfb"
  echo
done
