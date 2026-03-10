#!/bin/bash
# Benchmark vmfbs across all variants for given shapes and print a comparison table.
# Usage: ./benchmark_compare.sh [postfix...]
#   postfix: type+shape suffix, e.g. f16_8x13312x16384
#   If omitted, benchmarks all available postfixes.
#
# Examples:
#   ./benchmark_compare.sh f16_8x13312x16384
#   ./benchmark_compare.sh f16_8x13312x16384 f8E4M3FNUZ_8x13312x16384
#   ./benchmark_compare.sh   # all shapes found

BENCHMARK="${IREE_BENCHMARK:-iree-benchmark-module}"
DEVICE="${DEVICE:---device=hip://7}"
REPS="${REPS:-5}"

ALL_PREFIXES=(
  vdmfma-full-sg2 vdmfma-full-sg4 vdmfma-half-sg2 vdmfma-half-sg4
  baseline-full-sg2 baseline-full-sg4 baseline-half-sg2 baseline-half-sg4
)

# Discover postfixes from arguments or from available vmfb files.
if [ $# -gt 0 ]; then
  POSTFIXES=("$@")
else
  POSTFIXES=()
  for f in *-skinny_gemm_*.vmfb; do
    [ -f "$f" ] || continue
    post="${f##*skinny_gemm_}"
    post="${post%.vmfb}"
    POSTFIXES+=("$post")
  done
  # Deduplicate.
  IFS=$'\n' POSTFIXES=($(printf '%s\n' "${POSTFIXES[@]}" | sort -u)); unset IFS
fi

if [ ${#POSTFIXES[@]} -eq 0 ]; then
  echo "No vmfb files found. Run compile_dumps.sh first."
  exit 1
fi

# Collect results: results[prefix,postfix] = median_time
declare -A results

for post in "${POSTFIXES[@]}"; do
  for prefix in "${ALL_PREFIXES[@]}"; do
    vmfb="${prefix}-skinny_gemm_${post}.vmfb"
    [ -f "$vmfb" ] || continue

    echo "Benchmarking $vmfb ..." >&2
    output=$("$BENCHMARK" \
      $DEVICE \
      --device_allocator=caching \
      --hip_use_streams=true \
      --module="$vmfb" \
      --benchmark_repetitions="$REPS" 2>&1)

    median=$(echo "$output" | grep 'real_time_median' | awk '{print $NF}')
    if [ -z "$median" ]; then
      # Try alternate format: value before unit.
      median=$(echo "$output" | grep 'real_time_median' | grep -oP '[\d.]+\s+\w+$' | head -1)
    fi
    results["${prefix},${post}"]="${median:-N/A}"
  done
done

# Print table.
# Find which prefixes actually have results.
active_prefixes=()
for prefix in "${ALL_PREFIXES[@]}"; do
  for post in "${POSTFIXES[@]}"; do
    if [ -n "${results[${prefix},${post}]}" ]; then
      active_prefixes+=("$prefix")
      break
    fi
  done
done

# Header.
printf "%-28s" "shape"
for prefix in "${active_prefixes[@]}"; do
  printf "  %-22s" "$prefix"
done
echo

# Separator.
printf "%-28s" "----------------------------"
for prefix in "${active_prefixes[@]}"; do
  printf "  %-22s" "----------------------"
done
echo

# Rows.
for post in "${POSTFIXES[@]}"; do
  printf "%-28s" "$post"
  for prefix in "${active_prefixes[@]}"; do
    val="${results[${prefix},${post}]:-}"
    printf "  %-22s" "${val:---}"
  done
  echo
done
