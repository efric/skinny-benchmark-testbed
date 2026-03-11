#!/bin/bash
# Shared constants and helpers for skinny GEMM validation scripts.

# Core variant prefixes (all 8 combinations).
ALL_PREFIXES=(
  vdmfma-full-sg2 vdmfma-full-sg4 vdmfma-half-sg2 vdmfma-half-sg4
  baseline-full-sg2 baseline-full-sg4 baseline-half-sg2 baseline-half-sg4
)

# Parse -p/--prefix flags from arguments.
# Sets: SELECTED_PREFIXES=() and REMAINING_ARGS=()
parse_prefix_args() {
  SELECTED_PREFIXES=()
  REMAINING_ARGS=()
  while [ $# -gt 0 ]; do
    case "$1" in
      -p|--prefix)
        if [ $# -lt 2 ]; then
          echo "Error: $1 requires an argument" >&2
          exit 1
        fi
        SELECTED_PREFIXES+=("$2")
        shift 2
        ;;
      --)
        shift
        REMAINING_ARGS+=("$@")
        break
        ;;
      *)
        REMAINING_ARGS+=("$1")
        shift
        ;;
    esac
  done
}

# Override ALL_PREFIXES with SELECTED_PREFIXES if any were given.
apply_prefix_filter() {
  if [ ${#SELECTED_PREFIXES[@]} -gt 0 ]; then
    ALL_PREFIXES=("${SELECTED_PREFIXES[@]}")
  fi
}

# Check if a filename starts with any of the given prefixes.
# Usage: matches_prefix "filename" prefix1 prefix2 ...
matches_prefix() {
  local name="$1"; shift
  for p in "$@"; do
    [[ "$name" == "${p}-"* ]] && return 0
  done
  return 1
}
