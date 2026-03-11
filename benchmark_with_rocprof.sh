#!/bin/bash
# Run rocprofv3 with iree-benchmark-module on variant vmfbs.
# Usage: ./benchmark_with_rocprof.sh [-p prefix...] [postfix...]
#   -p/--prefix: select which variant prefixes to profile (repeatable)
#   postfix: type+shape suffix, e.g. f16_8x13312x16384
#   If no prefixes given, profiles all variants.
#   If no postfixes given, profiles all available shapes.
#
# Examples:
#   ./benchmark_with_rocprof.sh f16_8x13312x16384
#   ./benchmark_with_rocprof.sh -p vdmfma-full-sg2
#   ./benchmark_with_rocprof.sh -p vdmfma-full-sg2 f16_8x13312x16384
#   ./benchmark_with_rocprof.sh   # all
set -e

source "$(dirname "$0")/common.sh"

DEVICE="${DEVICE:---device=hip://7}"

parse_prefix_args "$@"
POSTFIXES=("${REMAINING_ARGS[@]}")

if [ ${#POSTFIXES[@]} -gt 0 ]; then
  vmfbs=()
  for post in "${POSTFIXES[@]}"; do
    for f in *-skinny_gemm_"${post}".vmfb skinny_gemm_"${post}".vmfb; do
      [ -f "$f" ] && vmfbs+=("$f")
    done
  done
else
  vmfbs=(*.vmfb)
fi

# Filter by prefix.
if [ ${#SELECTED_PREFIXES[@]} -gt 0 ]; then
  filtered=()
  for vmfb in "${vmfbs[@]}"; do
    matches_prefix "$vmfb" "${SELECTED_PREFIXES[@]}" && filtered+=("$vmfb")
  done
  vmfbs=("${filtered[@]}")
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
    --benchmark_min_warmup_time=3.0 \
    --module="$vmfb"
  echo
done
