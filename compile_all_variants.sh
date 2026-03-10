#!/bin/bash
# Compile all variants of skinny GEMM tests.
#
# Naming: {intrinsic}-{ktiles}-{subgroups}-*
#   intrinsic:  vdmfma | baseline
#   ktiles:     full   | half
#   subgroups:  sg2    | sg4
#
# Environment variables controlling iree-compile behavior:
#   IREE_DISABLE_VDMFMA=1   → use baseline MFMA instead of VDMFMA
#   IREE_HALVE_MMA=1        → halve kTileSizes (fewer MMAs per iteration)
#   IREE_SUBGROUP_COUNT=N   → force N subgroups (omit for heuristic default)
set -e

compile_variant() {
  local name="$1" disable_vdmfma="$2" halve="$3" sg_count="$4"

  echo "============================="
  echo " $name"
  echo "============================="

  unset IREE_DISABLE_VDMFMA IREE_HALVE_MMA IREE_SUBGROUP_COUNT
  [ "$disable_vdmfma" = "1" ] && export IREE_DISABLE_VDMFMA=1
  [ "$halve" = "1" ]          && export IREE_HALVE_MMA=1
  [ -n "$sg_count" ]          && export IREE_SUBGROUP_COUNT="$sg_count"

  ./compile_all.sh "$name"
}

#                   name                    disable_vdmfma  halve  sg_count
compile_variant     vdmfma-full-sg2         ""              ""     2
compile_variant     vdmfma-full-sg4         ""              ""     4
compile_variant     vdmfma-half-sg2         ""              "1"    2
compile_variant     vdmfma-half-sg4         ""              "1"    4
compile_variant     baseline-full-sg2       "1"             ""     2
compile_variant     baseline-full-sg4       "1"             ""     4
compile_variant     baseline-half-sg2       "1"             "1"    2
compile_variant     baseline-half-sg4       "1"             "1"    4

echo "============================="
echo " Done. Summary:"
echo "============================="
for prefix in vdmfma-full-sg2 vdmfma-full-sg4 vdmfma-half-sg2 vdmfma-half-sg4 \
              baseline-full-sg2 baseline-full-sg4 baseline-half-sg2 baseline-half-sg4; do
  count=$(ls -d ${prefix}-skinny_gemm_* 2>/dev/null | wc -l)
  echo "  ${prefix}-*: ${count} dumps"
done
