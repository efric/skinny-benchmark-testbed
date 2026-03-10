#!/bin/bash
# Compile skinny_gemm_*.mlir with baseline MFMA (no VDMFMA/smfmac).
# Produces baseline-* dump directories.
# Passes through IREE_HALVE_MMA if set.
set -e
export IREE_DISABLE_VDMFMA=1
exec ./compile_all.sh "${1:-baseline}" "${@:2}"
