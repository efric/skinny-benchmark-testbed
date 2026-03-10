# Skinny GEMM Validation

Benchmarking VDMFMA (sparse trick / smfmac) vs baseline MFMA for M=8 skinny GEMMs.

## Quick start

```bash
./compile_all_variants.sh   # compile all 8 variants
./compile_dumps.sh          # produce vmfbs + verify assembly
./benchmark_compare.sh      # benchmark all and print comparison table
```

## Scripts

### Compilation

| Script | Description |
|--------|-------------|
| `compile_all.sh [prefix]` | Base compiler script. Compiles `skinny_gemm_*.mlir` into dump directories. Respects env vars below. |
| `compile_all_variants.sh` | Runs `compile_all.sh` 8 times with all combinations of env vars. Produces `{vdmfma,baseline}-{full,half}-{sg2,sg4}-*` directories. |
| `compile_baseline.sh [prefix]` | Shorthand: sets `IREE_DISABLE_VDMFMA=1` and calls `compile_all.sh`. |
| `compile_dumps.sh [prefix...]` | Compiles `*_benchmark.mlir` from dump directories into `.vmfb` files. Reports smfmac/mfma counts, workgroup size, VGPR count. Defaults to all prefixes. |

### Benchmarking

| Script | Description |
|--------|-------------|
| `benchmark_compare.sh [postfix...]` | Benchmarks vmfbs across all variants for given shapes, prints a comparison table of `real_time_median`. Postfix example: `f16_8x13312x16384`. Defaults to all shapes. |
| `benchmark_vmfbs.sh` | Simple: benchmarks all `*.vmfb` in the directory. |
| `benchmark_with_rocprof.sh [postfix...]` | Runs `rocprofv3 --att` on vmfbs. Traces go to `traces/{prefix}/{shape}/`. |

### Cleanup

| Script | Description |
|--------|-------------|
| `clean.sh [prefix...]` | Removes dump directories and vmfb files. Defaults to all known prefixes. |
| `clean_vmfbs.sh` | Removes all `*.vmfb` files only. |

## Environment variables

Set these before calling `compile_all.sh` (or let `compile_all_variants.sh` handle it):

| Variable | Values | Effect |
|----------|--------|--------|
| `IREE_DISABLE_VDMFMA` | unset / `1` | VDMFMA (smfmac) vs baseline (mfma) |
| `IREE_HALVE_MMA` | unset / `1` | Default vs halved kTileSizes (fewer MMAs per loop iteration) |
| `IREE_SUBGROUP_COUNT` | `2` / `4` / unset | 128 vs 256 threads per workgroup (unset = heuristic default) |

## Variant naming

`{intrinsic}-{ktiles}-{subgroups}-skinny_gemm_{type}_{MxNxK}`

- **intrinsic**: `vdmfma` (smfmac) or `baseline` (mfma)
- **ktiles**: `full` (default heuristic) or `half` (halved K unroll)
- **subgroups**: `sg2` (128 threads) or `sg4` (256 threads)

Example: `vdmfma-half-sg4-skinny_gemm_f16_8x13312x16384`

## Composing manually

```bash
# Single variant
IREE_HALVE_MMA=1 IREE_SUBGROUP_COUNT=4 ./compile_all.sh vdmfma-half-sg4

# Compile its vmfbs
./compile_dumps.sh vdmfma-half-sg4

# Benchmark one shape across all compiled variants
./benchmark_compare.sh f16_8x13312x16384

# Profile with rocprof
./benchmark_with_rocprof.sh f16_8x13312x16384
```
