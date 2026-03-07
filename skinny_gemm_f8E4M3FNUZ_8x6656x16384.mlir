func.func @matmul_f8E4M3FNUZ_8x6656x16384(%arg0: tensor<8x16384xf8E4M3FNUZ>, %arg1: tensor<6656x16384xf8E4M3FNUZ>) -> tensor<8x6656xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<8x6656xf32>
  %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<8x6656xf32>) -> tensor<8x6656xf32>

  %2 = linalg.generic {
    indexing_maps = [
      affine_map<(d0, d1, d2) -> (d0, d2)>,
      affine_map<(d0, d1, d2) -> (d1, d2)>,
      affine_map<(d0, d1, d2) -> (d0, d1)>
    ],
    iterator_types = ["parallel", "parallel", "reduction"]
  } ins(%arg0, %arg1 : tensor<8x16384xf8E4M3FNUZ>, tensor<6656x16384xf8E4M3FNUZ>)
    outs(%1 : tensor<8x6656xf32>)
    {
    ^bb0(%in: f8E4M3FNUZ, %in_0: f8E4M3FNUZ, %out: f32):
      %3 = arith.extf %in : f8E4M3FNUZ to f32
      %4 = arith.extf %in_0 : f8E4M3FNUZ to f32
      %5 = arith.mulf %3, %4 : f32
      %6 = arith.addf %out, %5 : f32
      linalg.yield %6 : f32
  } -> tensor<8x6656xf32>

  return %2 : tensor<8x6656xf32>
}
