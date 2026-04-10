func.func @matmul_f8E4M3FN_8x2304x16384(%arg0: tensor<8x16384xf8E4M3FN>, %arg1: tensor<2304x16384xf8E4M3FN>) -> tensor<8x2304xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<8x2304xf32>
  %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<8x2304xf32>) -> tensor<8x2304xf32>

  %2 = linalg.generic {
    indexing_maps = [
      affine_map<(d0, d1, d2) -> (d0, d2)>,
      affine_map<(d0, d1, d2) -> (d1, d2)>,
      affine_map<(d0, d1, d2) -> (d0, d1)>
    ],
    iterator_types = ["parallel", "parallel", "reduction"]
  } ins(%arg0, %arg1 : tensor<8x16384xf8E4M3FN>, tensor<2304x16384xf8E4M3FN>)
    outs(%1 : tensor<8x2304xf32>)
    {
    ^bb0(%in: f8E4M3FN, %in_0: f8E4M3FN, %out: f32):
      %3 = arith.extf %in : f8E4M3FN to f32
      %4 = arith.extf %in_0 : f8E4M3FN to f32
      %5 = arith.mulf %3, %4 : f32
      %6 = arith.addf %out, %5 : f32
      linalg.yield %6 : f32
  } -> tensor<8x2304xf32>

  return %2 : tensor<8x2304xf32>
}
