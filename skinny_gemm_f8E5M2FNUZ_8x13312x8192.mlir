func.func @matmul_f8E5M2FNUZ_8x13312x8192(%arg0: tensor<8x8192xf8E5M2FNUZ>, %arg1: tensor<13312x8192xf8E5M2FNUZ>) -> tensor<8x13312xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<8x13312xf32>
  %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<8x13312xf32>) -> tensor<8x13312xf32>

  %2 = linalg.generic {
    indexing_maps = [
      affine_map<(d0, d1, d2) -> (d0, d2)>,
      affine_map<(d0, d1, d2) -> (d1, d2)>,
      affine_map<(d0, d1, d2) -> (d0, d1)>
    ],
    iterator_types = ["parallel", "parallel", "reduction"]
  } ins(%arg0, %arg1 : tensor<8x8192xf8E5M2FNUZ>, tensor<13312x8192xf8E5M2FNUZ>)
    outs(%1 : tensor<8x13312xf32>)
    {
    ^bb0(%in: f8E5M2FNUZ, %in_0: f8E5M2FNUZ, %out: f32):
      %3 = arith.extf %in : f8E5M2FNUZ to f32
      %4 = arith.extf %in_0 : f8E5M2FNUZ to f32
      %5 = arith.mulf %3, %4 : f32
      %6 = arith.addf %out, %5 : f32
      linalg.yield %6 : f32
  } -> tensor<8x13312xf32>

  return %2 : tensor<8x13312xf32>
}
