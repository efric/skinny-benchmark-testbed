#!/bin/bash
# Compile skinny_gemm_*.mlir with baseline MFMA (no VDMFMA/smfmac).
# Produces baseline-* dump directories.
set -e
export IREE_DISABLE_VDMFMA=1
exec ./compile_all.sh baseline "$@"
