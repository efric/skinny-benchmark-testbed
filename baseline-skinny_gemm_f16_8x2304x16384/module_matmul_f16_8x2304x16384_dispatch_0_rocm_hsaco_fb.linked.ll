; ModuleID = 'matmul_f16_8x2304x16384_dispatch_0'
source_filename = "matmul_f16_8x2304x16384_dispatch_0"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"

@__shared_memory___0 = private addrspace(3) global [64 x [132 x half]] undef, align 16
@__shared_memory__ = private addrspace(3) global [16 x [132 x half]] undef, align 16

; Function Attrs: alwaysinline
define amdgpu_kernel void @matmul_f16_8x2304x16384_dispatch_0_matmul_like_8x2304x16384_f16xf16xf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %1, ptr addrspace(1) inreg noalias noundef nonnull align 16 %2) #0 !reqd_work_group_size !2 {
  %4 = call range(i32 0, 128) i32 @llvm.amdgcn.workitem.id.x()
  %5 = sext i32 %4 to i64
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %6 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %0, i16 0, i64 262144, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %7 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %1, i16 0, i64 75497472, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  %8 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %2, i16 0, i64 73728, i32 159744)
  %9 = trunc i64 %5 to i32
  %10 = udiv i32 %9, 64
  %11 = urem i32 %9, 64
  %12 = udiv i32 %11, 16
  %13 = urem i32 %11, 16
  %14 = zext i32 %13 to i64
  %15 = mul nsw i32 %12, 4
  %16 = zext i32 %15 to i64
  %17 = udiv i32 %9, 16
  %18 = zext i32 %17 to i64
  %19 = urem i32 %9, 16
  %20 = call i32 @llvm.umin.i32(i32 %17, i32 8)
  %21 = zext i32 %20 to i64
  %22 = add nsw i32 %9, 128
  %23 = udiv i32 %22, 16
  %24 = zext i32 %23 to i64
  %25 = urem i32 %22, 16
  %26 = add nsw i32 %9, 256
  %27 = udiv i32 %26, 16
  %28 = zext i32 %27 to i64
  %29 = urem i32 %26, 16
  %30 = add nsw i32 %9, 384
  %31 = udiv i32 %30, 16
  %32 = zext i32 %31 to i64
  %33 = urem i32 %30, 16
  %34 = add nsw i32 %9, 512
  %35 = udiv i32 %34, 16
  %36 = zext i32 %35 to i64
  %37 = urem i32 %34, 16
  %38 = add nsw i32 %9, 640
  %39 = udiv i32 %38, 16
  %40 = zext i32 %39 to i64
  %41 = urem i32 %38, 16
  %42 = add nsw i32 %9, 768
  %43 = udiv i32 %42, 16
  %44 = zext i32 %43 to i64
  %45 = urem i32 %42, 16
  %46 = add nsw i32 %9, 896
  %47 = udiv i32 %46, 16
  %48 = zext i32 %47 to i64
  %49 = urem i32 %46, 16
  %50 = mul nsw i32 %19, 8
  %51 = zext i32 %50 to i64
  %52 = mul nsw i32 %25, 8
  %53 = zext i32 %52 to i64
  %54 = mul nsw i32 %29, 8
  %55 = zext i32 %54 to i64
  %56 = mul nsw i32 %33, 8
  %57 = zext i32 %56 to i64
  %58 = mul nsw i32 %37, 8
  %59 = zext i32 %58 to i64
  %60 = mul nsw i32 %41, 8
  %61 = zext i32 %60 to i64
  %62 = mul nsw i32 %45, 8
  %63 = zext i32 %62 to i64
  %64 = mul nsw i32 %49, 8
  %65 = zext i32 %64 to i64
  %66 = trunc i64 %16 to i32
  %67 = insertelement <1 x i32> poison, i32 %66, i32 0
  %68 = add <1 x i32> zeroinitializer, %67
  %69 = add <1 x i32> zeroinitializer, %67
  %70 = add <1 x i32> splat (i32 1), %67
  %71 = add <1 x i32> splat (i32 1), %67
  %72 = add <1 x i32> splat (i32 2), %67
  %73 = add <1 x i32> splat (i32 2), %67
  %74 = add <1 x i32> splat (i32 3), %67
  %75 = add <1 x i32> splat (i32 3), %67
  %76 = mul nsw i32 %10, 2
  %77 = zext i32 %76 to i64
  %78 = trunc i64 %77 to i32
  %79 = add i32 0, %78
  %80 = add i32 1, %78
  %81 = mul nsw i32 %79, 16
  %82 = mul nsw i32 %80, 16
  %83 = trunc i64 %14 to i32
  %84 = add nsw i32 %81, %83
  %85 = add nsw i32 %82, %83
  %86 = extractelement <1 x i32> %68, i64 0
  %87 = icmp ult i32 %86, 8
  %88 = extractelement <1 x i32> %69, i64 0
  %89 = icmp ult i32 %88, 8
  %90 = extractelement <1 x i32> %70, i64 0
  %91 = icmp ult i32 %90, 8
  %92 = extractelement <1 x i32> %71, i64 0
  %93 = icmp ult i32 %92, 8
  %94 = extractelement <1 x i32> %72, i64 0
  %95 = icmp ult i32 %94, 8
  %96 = extractelement <1 x i32> %73, i64 0
  %97 = icmp ult i32 %96, 8
  %98 = extractelement <1 x i32> %74, i64 0
  %99 = icmp ult i32 %98, 8
  %100 = extractelement <1 x i32> %75, i64 0
  %101 = icmp ult i32 %100, 8
  %102 = extractelement <1 x i32> %68, i64 0
  %103 = mul nsw i32 %102, 2304
  %104 = extractelement <1 x i32> %69, i64 0
  %105 = mul nsw i32 %104, 2304
  %106 = extractelement <1 x i32> %70, i64 0
  %107 = mul nsw i32 %106, 2304
  %108 = extractelement <1 x i32> %71, i64 0
  %109 = mul nsw i32 %108, 2304
  %110 = extractelement <1 x i32> %72, i64 0
  %111 = mul nsw i32 %110, 2304
  %112 = extractelement <1 x i32> %73, i64 0
  %113 = mul nsw i32 %112, 2304
  %114 = extractelement <1 x i32> %74, i64 0
  %115 = mul nsw i32 %114, 2304
  %116 = extractelement <1 x i32> %75, i64 0
  %117 = mul nsw i32 %116, 2304
  %118 = insertelement <8 x i1> poison, i1 %87, i64 0
  %119 = insertelement <8 x i1> %118, i1 %89, i64 1
  %120 = insertelement <8 x i1> %119, i1 %91, i64 2
  %121 = insertelement <8 x i1> %120, i1 %93, i64 3
  %122 = insertelement <8 x i1> %121, i1 %95, i64 4
  %123 = insertelement <8 x i1> %122, i1 %97, i64 5
  %124 = insertelement <8 x i1> %123, i1 %99, i64 6
  %125 = insertelement <8 x i1> %124, i1 %101, i64 7
  %126 = call range(i32 0, 36) i32 @llvm.amdgcn.workgroup.id.x()
  %127 = sext i32 %126 to i64
  %128 = trunc i64 %127 to i32
  %129 = mul nsw i32 %128, 64
  %130 = zext i32 %129 to i64
  %131 = mul i64 %21, 16384
  %132 = add i64 %131, %51
  %133 = getelementptr half, ptr addrspace(7) %6, i64 %132
  %134 = load <8 x half>, ptr addrspace(7) %133, align 2
  %135 = add i32 %17, %129
  %136 = zext i32 %135 to i64
  %137 = mul i64 %136, 16384
  %138 = add i64 %137, %51
  %139 = getelementptr half, ptr addrspace(7) %7, i64 %138
  %140 = load <8 x half>, ptr addrspace(7) %139, align 2
  %141 = add i32 %23, %129
  %142 = zext i32 %141 to i64
  %143 = mul i64 %142, 16384
  %144 = add i64 %143, %53
  %145 = getelementptr half, ptr addrspace(7) %7, i64 %144
  %146 = load <8 x half>, ptr addrspace(7) %145, align 2
  %147 = add i32 %27, %129
  %148 = zext i32 %147 to i64
  %149 = mul i64 %148, 16384
  %150 = add i64 %149, %55
  %151 = getelementptr half, ptr addrspace(7) %7, i64 %150
  %152 = load <8 x half>, ptr addrspace(7) %151, align 2
  %153 = add i32 %31, %129
  %154 = zext i32 %153 to i64
  %155 = mul i64 %154, 16384
  %156 = add i64 %155, %57
  %157 = getelementptr half, ptr addrspace(7) %7, i64 %156
  %158 = load <8 x half>, ptr addrspace(7) %157, align 2
  %159 = add i32 %35, %129
  %160 = zext i32 %159 to i64
  %161 = mul i64 %160, 16384
  %162 = add i64 %161, %59
  %163 = getelementptr half, ptr addrspace(7) %7, i64 %162
  %164 = load <8 x half>, ptr addrspace(7) %163, align 2
  %165 = add i32 %39, %129
  %166 = zext i32 %165 to i64
  %167 = mul i64 %166, 16384
  %168 = add i64 %167, %61
  %169 = getelementptr half, ptr addrspace(7) %7, i64 %168
  %170 = load <8 x half>, ptr addrspace(7) %169, align 2
  %171 = add i32 %43, %129
  %172 = zext i32 %171 to i64
  %173 = mul i64 %172, 16384
  %174 = add i64 %173, %63
  %175 = getelementptr half, ptr addrspace(7) %7, i64 %174
  %176 = load <8 x half>, ptr addrspace(7) %175, align 2
  %177 = add i32 %47, %129
  %178 = zext i32 %177 to i64
  %179 = mul i64 %178, 16384
  %180 = add i64 %179, %65
  %181 = getelementptr half, ptr addrspace(7) %7, i64 %180
  %182 = load <8 x half>, ptr addrspace(7) %181, align 2
  %183 = mul i64 %18, 132
  %184 = add i64 %183, %51
  %185 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %184
  store <8 x half> %134, ptr addrspace(3) %185, align 2
  %186 = mul i64 %24, 132
  %187 = add i64 %186, %53
  %188 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %187
  store <8 x half> zeroinitializer, ptr addrspace(3) %188, align 2
  %189 = mul i64 %18, 132
  %190 = add i64 %189, %51
  %191 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %190
  store <8 x half> %140, ptr addrspace(3) %191, align 2
  %192 = mul i64 %24, 132
  %193 = add i64 %192, %53
  %194 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %193
  store <8 x half> %146, ptr addrspace(3) %194, align 2
  %195 = mul i64 %28, 132
  %196 = add i64 %195, %55
  %197 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %196
  store <8 x half> %152, ptr addrspace(3) %197, align 2
  %198 = mul i64 %32, 132
  %199 = add i64 %198, %57
  %200 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %199
  store <8 x half> %158, ptr addrspace(3) %200, align 2
  %201 = mul i64 %36, 132
  %202 = add i64 %201, %59
  %203 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %202
  store <8 x half> %164, ptr addrspace(3) %203, align 2
  %204 = mul i64 %40, 132
  %205 = add i64 %204, %61
  %206 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %205
  store <8 x half> %170, ptr addrspace(3) %206, align 2
  %207 = mul i64 %44, 132
  %208 = add i64 %207, %63
  %209 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %208
  store <8 x half> %176, ptr addrspace(3) %209, align 2
  %210 = mul i64 %48, 132
  %211 = add i64 %210, %65
  %212 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %211
  store <8 x half> %182, ptr addrspace(3) %212, align 2
  %213 = add nsw i32 %15, 16
  %214 = zext i32 %213 to i64
  %215 = add nsw i32 %15, 32
  %216 = zext i32 %215 to i64
  %217 = add nsw i32 %15, 48
  %218 = zext i32 %217 to i64
  %219 = add nsw i32 %15, 64
  %220 = zext i32 %219 to i64
  %221 = add nsw i32 %15, 80
  %222 = zext i32 %221 to i64
  %223 = add nsw i32 %15, 96
  %224 = zext i32 %223 to i64
  %225 = add nsw i32 %15, 112
  %226 = zext i32 %225 to i64
  %227 = mul nsw i32 %10, 32
  %228 = add nsw i32 %227, %13
  %229 = zext i32 %228 to i64
  %230 = add nsw i32 %228, 16
  %231 = zext i32 %230 to i64
  br label %232

232:                                              ; preds = %236, %3
  %233 = phi i32 [ %237, %236 ], [ 0, %3 ]
  %234 = phi [1 x [2 x [4 x <1 x float>]]] [ %453, %236 ], [ zeroinitializer, %3 ]
  %235 = icmp slt i32 %233, 1016
  br i1 %235, label %236, label %484

236:                                              ; preds = %232
  %237 = add i32 %233, 8
  %238 = mul nsw i32 %237, 16
  %239 = add i32 %50, %238
  %240 = zext i32 %239 to i64
  %241 = mul i64 %21, 16384
  %242 = add i64 %241, %240
  %243 = getelementptr half, ptr addrspace(7) %6, i64 %242
  %244 = load <8 x half>, ptr addrspace(7) %243, align 2
  %245 = mul i64 %136, 16384
  %246 = add i64 %245, %240
  %247 = getelementptr half, ptr addrspace(7) %7, i64 %246
  %248 = load <8 x half>, ptr addrspace(7) %247, align 2
  %249 = add i32 %52, %238
  %250 = zext i32 %249 to i64
  %251 = mul i64 %142, 16384
  %252 = add i64 %251, %250
  %253 = getelementptr half, ptr addrspace(7) %7, i64 %252
  %254 = load <8 x half>, ptr addrspace(7) %253, align 2
  %255 = add i32 %54, %238
  %256 = zext i32 %255 to i64
  %257 = mul i64 %148, 16384
  %258 = add i64 %257, %256
  %259 = getelementptr half, ptr addrspace(7) %7, i64 %258
  %260 = load <8 x half>, ptr addrspace(7) %259, align 2
  %261 = add i32 %56, %238
  %262 = zext i32 %261 to i64
  %263 = mul i64 %154, 16384
  %264 = add i64 %263, %262
  %265 = getelementptr half, ptr addrspace(7) %7, i64 %264
  %266 = load <8 x half>, ptr addrspace(7) %265, align 2
  %267 = add i32 %58, %238
  %268 = zext i32 %267 to i64
  %269 = mul i64 %160, 16384
  %270 = add i64 %269, %268
  %271 = getelementptr half, ptr addrspace(7) %7, i64 %270
  %272 = load <8 x half>, ptr addrspace(7) %271, align 2
  %273 = add i32 %60, %238
  %274 = zext i32 %273 to i64
  %275 = mul i64 %166, 16384
  %276 = add i64 %275, %274
  %277 = getelementptr half, ptr addrspace(7) %7, i64 %276
  %278 = load <8 x half>, ptr addrspace(7) %277, align 2
  %279 = add i32 %62, %238
  %280 = zext i32 %279 to i64
  %281 = mul i64 %172, 16384
  %282 = add i64 %281, %280
  %283 = getelementptr half, ptr addrspace(7) %7, i64 %282
  %284 = load <8 x half>, ptr addrspace(7) %283, align 2
  %285 = add i32 %64, %238
  %286 = zext i32 %285 to i64
  %287 = mul i64 %178, 16384
  %288 = add i64 %287, %286
  %289 = getelementptr half, ptr addrspace(7) %7, i64 %288
  %290 = load <8 x half>, ptr addrspace(7) %289, align 2
  fence syncscope("workgroup") release, !mmra !3
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %291 = mul i64 %14, 132
  %292 = add i64 %291, %16
  %293 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %292
  %294 = load <4 x half>, ptr addrspace(3) %293, align 2
  %295 = mul i64 %14, 132
  %296 = add i64 %295, %214
  %297 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %296
  %298 = load <4 x half>, ptr addrspace(3) %297, align 2
  %299 = mul i64 %14, 132
  %300 = add i64 %299, %216
  %301 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %300
  %302 = load <4 x half>, ptr addrspace(3) %301, align 2
  %303 = mul i64 %14, 132
  %304 = add i64 %303, %218
  %305 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %304
  %306 = load <4 x half>, ptr addrspace(3) %305, align 2
  %307 = mul i64 %14, 132
  %308 = add i64 %307, %220
  %309 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %308
  %310 = load <4 x half>, ptr addrspace(3) %309, align 2
  %311 = mul i64 %14, 132
  %312 = add i64 %311, %222
  %313 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %312
  %314 = load <4 x half>, ptr addrspace(3) %313, align 2
  %315 = mul i64 %14, 132
  %316 = add i64 %315, %224
  %317 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %316
  %318 = load <4 x half>, ptr addrspace(3) %317, align 2
  %319 = mul i64 %14, 132
  %320 = add i64 %319, %226
  %321 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %320
  %322 = load <4 x half>, ptr addrspace(3) %321, align 2
  %323 = mul i64 %229, 132
  %324 = add i64 %323, %16
  %325 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %324
  %326 = load <4 x half>, ptr addrspace(3) %325, align 2
  %327 = mul i64 %229, 132
  %328 = add i64 %327, %214
  %329 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %328
  %330 = load <4 x half>, ptr addrspace(3) %329, align 2
  %331 = mul i64 %229, 132
  %332 = add i64 %331, %216
  %333 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %332
  %334 = load <4 x half>, ptr addrspace(3) %333, align 2
  %335 = mul i64 %229, 132
  %336 = add i64 %335, %218
  %337 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %336
  %338 = load <4 x half>, ptr addrspace(3) %337, align 2
  %339 = mul i64 %229, 132
  %340 = add i64 %339, %220
  %341 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %340
  %342 = load <4 x half>, ptr addrspace(3) %341, align 2
  %343 = mul i64 %229, 132
  %344 = add i64 %343, %222
  %345 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %344
  %346 = load <4 x half>, ptr addrspace(3) %345, align 2
  %347 = mul i64 %229, 132
  %348 = add i64 %347, %224
  %349 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %348
  %350 = load <4 x half>, ptr addrspace(3) %349, align 2
  %351 = mul i64 %229, 132
  %352 = add i64 %351, %226
  %353 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %352
  %354 = load <4 x half>, ptr addrspace(3) %353, align 2
  %355 = mul i64 %231, 132
  %356 = add i64 %355, %16
  %357 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %356
  %358 = load <4 x half>, ptr addrspace(3) %357, align 2
  %359 = mul i64 %231, 132
  %360 = add i64 %359, %214
  %361 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %360
  %362 = load <4 x half>, ptr addrspace(3) %361, align 2
  %363 = mul i64 %231, 132
  %364 = add i64 %363, %216
  %365 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %364
  %366 = load <4 x half>, ptr addrspace(3) %365, align 2
  %367 = mul i64 %231, 132
  %368 = add i64 %367, %218
  %369 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %368
  %370 = load <4 x half>, ptr addrspace(3) %369, align 2
  %371 = mul i64 %231, 132
  %372 = add i64 %371, %220
  %373 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %372
  %374 = load <4 x half>, ptr addrspace(3) %373, align 2
  %375 = mul i64 %231, 132
  %376 = add i64 %375, %222
  %377 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %376
  %378 = load <4 x half>, ptr addrspace(3) %377, align 2
  %379 = mul i64 %231, 132
  %380 = add i64 %379, %224
  %381 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %380
  %382 = load <4 x half>, ptr addrspace(3) %381, align 2
  %383 = mul i64 %231, 132
  %384 = add i64 %383, %226
  %385 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %384
  %386 = load <4 x half>, ptr addrspace(3) %385, align 2
  %387 = extractvalue [1 x [2 x [4 x <1 x float>]]] %234, 0, 0, 0
  %388 = extractelement <1 x float> %387, i64 0
  %389 = insertelement <4 x float> poison, float %388, i64 0
  %390 = extractvalue [1 x [2 x [4 x <1 x float>]]] %234, 0, 0, 1
  %391 = extractelement <1 x float> %390, i64 0
  %392 = insertelement <4 x float> %389, float %391, i64 1
  %393 = extractvalue [1 x [2 x [4 x <1 x float>]]] %234, 0, 0, 2
  %394 = extractelement <1 x float> %393, i64 0
  %395 = insertelement <4 x float> %392, float %394, i64 2
  %396 = extractvalue [1 x [2 x [4 x <1 x float>]]] %234, 0, 0, 3
  %397 = extractelement <1 x float> %396, i64 0
  %398 = insertelement <4 x float> %395, float %397, i64 3
  %399 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %294, <4 x half> %326, <4 x float> %398, i32 0, i32 0, i32 0)
  %400 = extractvalue [1 x [2 x [4 x <1 x float>]]] %234, 0, 1, 0
  %401 = extractelement <1 x float> %400, i64 0
  %402 = insertelement <4 x float> poison, float %401, i64 0
  %403 = extractvalue [1 x [2 x [4 x <1 x float>]]] %234, 0, 1, 1
  %404 = extractelement <1 x float> %403, i64 0
  %405 = insertelement <4 x float> %402, float %404, i64 1
  %406 = extractvalue [1 x [2 x [4 x <1 x float>]]] %234, 0, 1, 2
  %407 = extractelement <1 x float> %406, i64 0
  %408 = insertelement <4 x float> %405, float %407, i64 2
  %409 = extractvalue [1 x [2 x [4 x <1 x float>]]] %234, 0, 1, 3
  %410 = extractelement <1 x float> %409, i64 0
  %411 = insertelement <4 x float> %408, float %410, i64 3
  %412 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %294, <4 x half> %358, <4 x float> %411, i32 0, i32 0, i32 0)
  %413 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %298, <4 x half> %330, <4 x float> %399, i32 0, i32 0, i32 0)
  %414 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %298, <4 x half> %362, <4 x float> %412, i32 0, i32 0, i32 0)
  %415 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %302, <4 x half> %334, <4 x float> %413, i32 0, i32 0, i32 0)
  %416 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %302, <4 x half> %366, <4 x float> %414, i32 0, i32 0, i32 0)
  %417 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %306, <4 x half> %338, <4 x float> %415, i32 0, i32 0, i32 0)
  %418 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %306, <4 x half> %370, <4 x float> %416, i32 0, i32 0, i32 0)
  %419 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %310, <4 x half> %342, <4 x float> %417, i32 0, i32 0, i32 0)
  %420 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %310, <4 x half> %374, <4 x float> %418, i32 0, i32 0, i32 0)
  %421 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %314, <4 x half> %346, <4 x float> %419, i32 0, i32 0, i32 0)
  %422 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %314, <4 x half> %378, <4 x float> %420, i32 0, i32 0, i32 0)
  %423 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %318, <4 x half> %350, <4 x float> %421, i32 0, i32 0, i32 0)
  %424 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %318, <4 x half> %382, <4 x float> %422, i32 0, i32 0, i32 0)
  %425 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %322, <4 x half> %354, <4 x float> %423, i32 0, i32 0, i32 0)
  %426 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %322, <4 x half> %386, <4 x float> %424, i32 0, i32 0, i32 0)
  %427 = extractelement <4 x float> %425, i64 0
  %428 = insertelement <1 x float> poison, float %427, i64 0
  %429 = insertvalue [4 x <1 x float>] poison, <1 x float> %428, 0
  %430 = extractelement <4 x float> %425, i64 1
  %431 = insertelement <1 x float> poison, float %430, i64 0
  %432 = insertvalue [4 x <1 x float>] %429, <1 x float> %431, 1
  %433 = extractelement <4 x float> %425, i64 2
  %434 = insertelement <1 x float> poison, float %433, i64 0
  %435 = insertvalue [4 x <1 x float>] %432, <1 x float> %434, 2
  %436 = extractelement <4 x float> %425, i64 3
  %437 = insertelement <1 x float> poison, float %436, i64 0
  %438 = insertvalue [4 x <1 x float>] %435, <1 x float> %437, 3
  %439 = insertvalue [2 x [4 x <1 x float>]] zeroinitializer, [4 x <1 x float>] %438, 0
  %440 = extractelement <4 x float> %426, i64 0
  %441 = insertelement <1 x float> poison, float %440, i64 0
  %442 = insertvalue [4 x <1 x float>] poison, <1 x float> %441, 0
  %443 = extractelement <4 x float> %426, i64 1
  %444 = insertelement <1 x float> poison, float %443, i64 0
  %445 = insertvalue [4 x <1 x float>] %442, <1 x float> %444, 1
  %446 = extractelement <4 x float> %426, i64 2
  %447 = insertelement <1 x float> poison, float %446, i64 0
  %448 = insertvalue [4 x <1 x float>] %445, <1 x float> %447, 2
  %449 = extractelement <4 x float> %426, i64 3
  %450 = insertelement <1 x float> poison, float %449, i64 0
  %451 = insertvalue [4 x <1 x float>] %448, <1 x float> %450, 3
  %452 = insertvalue [2 x [4 x <1 x float>]] %439, [4 x <1 x float>] %451, 1
  %453 = insertvalue [1 x [2 x [4 x <1 x float>]]] poison, [2 x [4 x <1 x float>]] %452, 0
  fence syncscope("workgroup") release, !mmra !3
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  call void @llvm.amdgcn.sched.barrier(i32 0)
  %454 = mul i64 %18, 132
  %455 = add i64 %454, %51
  %456 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %455
  store <8 x half> %244, ptr addrspace(3) %456, align 2
  %457 = mul i64 %24, 132
  %458 = add i64 %457, %53
  %459 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %458
  store <8 x half> zeroinitializer, ptr addrspace(3) %459, align 2
  %460 = mul i64 %18, 132
  %461 = add i64 %460, %51
  %462 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %461
  store <8 x half> %248, ptr addrspace(3) %462, align 2
  %463 = mul i64 %24, 132
  %464 = add i64 %463, %53
  %465 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %464
  store <8 x half> %254, ptr addrspace(3) %465, align 2
  %466 = mul i64 %28, 132
  %467 = add i64 %466, %55
  %468 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %467
  store <8 x half> %260, ptr addrspace(3) %468, align 2
  %469 = mul i64 %32, 132
  %470 = add i64 %469, %57
  %471 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %470
  store <8 x half> %266, ptr addrspace(3) %471, align 2
  %472 = mul i64 %36, 132
  %473 = add i64 %472, %59
  %474 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %473
  store <8 x half> %272, ptr addrspace(3) %474, align 2
  %475 = mul i64 %40, 132
  %476 = add i64 %475, %61
  %477 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %476
  store <8 x half> %278, ptr addrspace(3) %477, align 2
  %478 = mul i64 %44, 132
  %479 = add i64 %478, %63
  %480 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %479
  store <8 x half> %284, ptr addrspace(3) %480, align 2
  %481 = mul i64 %48, 132
  %482 = add i64 %481, %65
  %483 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %482
  store <8 x half> %290, ptr addrspace(3) %483, align 2
  br label %232

484:                                              ; preds = %232
  fence syncscope("workgroup") release, !mmra !3
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %485 = mul i64 %14, 132
  %486 = add i64 %485, %16
  %487 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %486
  %488 = load <4 x half>, ptr addrspace(3) %487, align 2
  %489 = mul i64 %14, 132
  %490 = add i64 %489, %214
  %491 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %490
  %492 = load <4 x half>, ptr addrspace(3) %491, align 2
  %493 = mul i64 %14, 132
  %494 = add i64 %493, %216
  %495 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %494
  %496 = load <4 x half>, ptr addrspace(3) %495, align 2
  %497 = mul i64 %14, 132
  %498 = add i64 %497, %218
  %499 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %498
  %500 = load <4 x half>, ptr addrspace(3) %499, align 2
  %501 = mul i64 %14, 132
  %502 = add i64 %501, %220
  %503 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %502
  %504 = load <4 x half>, ptr addrspace(3) %503, align 2
  %505 = mul i64 %14, 132
  %506 = add i64 %505, %222
  %507 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %506
  %508 = load <4 x half>, ptr addrspace(3) %507, align 2
  %509 = mul i64 %14, 132
  %510 = add i64 %509, %224
  %511 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %510
  %512 = load <4 x half>, ptr addrspace(3) %511, align 2
  %513 = mul i64 %14, 132
  %514 = add i64 %513, %226
  %515 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %514
  %516 = load <4 x half>, ptr addrspace(3) %515, align 2
  %517 = mul i64 %229, 132
  %518 = add i64 %517, %16
  %519 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %518
  %520 = load <4 x half>, ptr addrspace(3) %519, align 2
  %521 = mul i64 %229, 132
  %522 = add i64 %521, %214
  %523 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %522
  %524 = load <4 x half>, ptr addrspace(3) %523, align 2
  %525 = mul i64 %229, 132
  %526 = add i64 %525, %216
  %527 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %526
  %528 = load <4 x half>, ptr addrspace(3) %527, align 2
  %529 = mul i64 %229, 132
  %530 = add i64 %529, %218
  %531 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %530
  %532 = load <4 x half>, ptr addrspace(3) %531, align 2
  %533 = mul i64 %229, 132
  %534 = add i64 %533, %220
  %535 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %534
  %536 = load <4 x half>, ptr addrspace(3) %535, align 2
  %537 = mul i64 %229, 132
  %538 = add i64 %537, %222
  %539 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %538
  %540 = load <4 x half>, ptr addrspace(3) %539, align 2
  %541 = mul i64 %229, 132
  %542 = add i64 %541, %224
  %543 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %542
  %544 = load <4 x half>, ptr addrspace(3) %543, align 2
  %545 = mul i64 %229, 132
  %546 = add i64 %545, %226
  %547 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %546
  %548 = load <4 x half>, ptr addrspace(3) %547, align 2
  %549 = mul i64 %231, 132
  %550 = add i64 %549, %16
  %551 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %550
  %552 = load <4 x half>, ptr addrspace(3) %551, align 2
  %553 = mul i64 %231, 132
  %554 = add i64 %553, %214
  %555 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %554
  %556 = load <4 x half>, ptr addrspace(3) %555, align 2
  %557 = mul i64 %231, 132
  %558 = add i64 %557, %216
  %559 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %558
  %560 = load <4 x half>, ptr addrspace(3) %559, align 2
  %561 = mul i64 %231, 132
  %562 = add i64 %561, %218
  %563 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %562
  %564 = load <4 x half>, ptr addrspace(3) %563, align 2
  %565 = mul i64 %231, 132
  %566 = add i64 %565, %220
  %567 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %566
  %568 = load <4 x half>, ptr addrspace(3) %567, align 2
  %569 = mul i64 %231, 132
  %570 = add i64 %569, %222
  %571 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %570
  %572 = load <4 x half>, ptr addrspace(3) %571, align 2
  %573 = mul i64 %231, 132
  %574 = add i64 %573, %224
  %575 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %574
  %576 = load <4 x half>, ptr addrspace(3) %575, align 2
  %577 = mul i64 %231, 132
  %578 = add i64 %577, %226
  %579 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %578
  %580 = load <4 x half>, ptr addrspace(3) %579, align 2
  %581 = extractvalue [1 x [2 x [4 x <1 x float>]]] %234, 0, 0, 0
  %582 = extractelement <1 x float> %581, i64 0
  %583 = insertelement <4 x float> poison, float %582, i64 0
  %584 = extractvalue [1 x [2 x [4 x <1 x float>]]] %234, 0, 0, 1
  %585 = extractelement <1 x float> %584, i64 0
  %586 = insertelement <4 x float> %583, float %585, i64 1
  %587 = extractvalue [1 x [2 x [4 x <1 x float>]]] %234, 0, 0, 2
  %588 = extractelement <1 x float> %587, i64 0
  %589 = insertelement <4 x float> %586, float %588, i64 2
  %590 = extractvalue [1 x [2 x [4 x <1 x float>]]] %234, 0, 0, 3
  %591 = extractelement <1 x float> %590, i64 0
  %592 = insertelement <4 x float> %589, float %591, i64 3
  %593 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %488, <4 x half> %520, <4 x float> %592, i32 0, i32 0, i32 0)
  %594 = extractvalue [1 x [2 x [4 x <1 x float>]]] %234, 0, 1, 0
  %595 = extractelement <1 x float> %594, i64 0
  %596 = insertelement <4 x float> poison, float %595, i64 0
  %597 = extractvalue [1 x [2 x [4 x <1 x float>]]] %234, 0, 1, 1
  %598 = extractelement <1 x float> %597, i64 0
  %599 = insertelement <4 x float> %596, float %598, i64 1
  %600 = extractvalue [1 x [2 x [4 x <1 x float>]]] %234, 0, 1, 2
  %601 = extractelement <1 x float> %600, i64 0
  %602 = insertelement <4 x float> %599, float %601, i64 2
  %603 = extractvalue [1 x [2 x [4 x <1 x float>]]] %234, 0, 1, 3
  %604 = extractelement <1 x float> %603, i64 0
  %605 = insertelement <4 x float> %602, float %604, i64 3
  %606 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %488, <4 x half> %552, <4 x float> %605, i32 0, i32 0, i32 0)
  %607 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %492, <4 x half> %524, <4 x float> %593, i32 0, i32 0, i32 0)
  %608 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %492, <4 x half> %556, <4 x float> %606, i32 0, i32 0, i32 0)
  %609 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %496, <4 x half> %528, <4 x float> %607, i32 0, i32 0, i32 0)
  %610 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %496, <4 x half> %560, <4 x float> %608, i32 0, i32 0, i32 0)
  %611 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %500, <4 x half> %532, <4 x float> %609, i32 0, i32 0, i32 0)
  %612 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %500, <4 x half> %564, <4 x float> %610, i32 0, i32 0, i32 0)
  %613 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %504, <4 x half> %536, <4 x float> %611, i32 0, i32 0, i32 0)
  %614 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %504, <4 x half> %568, <4 x float> %612, i32 0, i32 0, i32 0)
  %615 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %508, <4 x half> %540, <4 x float> %613, i32 0, i32 0, i32 0)
  %616 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %508, <4 x half> %572, <4 x float> %614, i32 0, i32 0, i32 0)
  %617 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %512, <4 x half> %544, <4 x float> %615, i32 0, i32 0, i32 0)
  %618 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %512, <4 x half> %576, <4 x float> %616, i32 0, i32 0, i32 0)
  %619 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %516, <4 x half> %548, <4 x float> %617, i32 0, i32 0, i32 0)
  %620 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %516, <4 x half> %580, <4 x float> %618, i32 0, i32 0, i32 0)
  %621 = trunc i64 %130 to i32
  %622 = add i32 %621, %84
  %623 = add i32 %621, %85
  %624 = add nsw i32 %103, %622
  %625 = add nsw i32 %105, %623
  %626 = add nsw i32 %107, %622
  %627 = add nsw i32 %109, %623
  %628 = add nsw i32 %111, %622
  %629 = add nsw i32 %113, %623
  %630 = add nsw i32 %115, %622
  %631 = add nsw i32 %117, %623
  %632 = zext i32 %624 to i64
  %633 = zext i32 %625 to i64
  %634 = zext i32 %626 to i64
  %635 = zext i32 %627 to i64
  %636 = zext i32 %628 to i64
  %637 = zext i32 %629 to i64
  %638 = zext i32 %630 to i64
  %639 = zext i32 %631 to i64
  %640 = insertelement <8 x i64> poison, i64 %632, i64 0
  %641 = insertelement <8 x i64> %640, i64 %633, i64 1
  %642 = insertelement <8 x i64> %641, i64 %634, i64 2
  %643 = insertelement <8 x i64> %642, i64 %635, i64 3
  %644 = insertelement <8 x i64> %643, i64 %636, i64 4
  %645 = insertelement <8 x i64> %644, i64 %637, i64 5
  %646 = insertelement <8 x i64> %645, i64 %638, i64 6
  %647 = insertelement <8 x i64> %646, i64 %639, i64 7
  %648 = extractelement <4 x float> %619, i64 0
  %649 = extractelement <4 x float> %620, i64 0
  %650 = extractelement <4 x float> %619, i64 1
  %651 = extractelement <4 x float> %620, i64 1
  %652 = extractelement <4 x float> %619, i64 2
  %653 = extractelement <4 x float> %620, i64 2
  %654 = extractelement <4 x float> %619, i64 3
  %655 = extractelement <4 x float> %620, i64 3
  %656 = insertelement <8 x float> poison, float %648, i64 0
  %657 = insertelement <8 x float> %656, float %649, i64 1
  %658 = insertelement <8 x float> %657, float %650, i64 2
  %659 = insertelement <8 x float> %658, float %651, i64 3
  %660 = insertelement <8 x float> %659, float %652, i64 4
  %661 = insertelement <8 x float> %660, float %653, i64 5
  %662 = insertelement <8 x float> %661, float %654, i64 6
  %663 = insertelement <8 x float> %662, float %655, i64 7
  %664 = getelementptr float, ptr addrspace(7) %8, <8 x i64> %647
  call void @llvm.masked.scatter.v8f32.v8p7(<8 x float> %663, <8 x ptr addrspace(7)> align 4 %664, <8 x i1> %125)
  fence syncscope("workgroup") release, !mmra !3
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  ret void
}

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: alwaysinline nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

; Function Attrs: alwaysinline nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) readnone, i16, i64, i32) #3

; Function Attrs: alwaysinline nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #3

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: alwaysinline convergent nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #4

; Function Attrs: alwaysinline convergent nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half>, <4 x half>, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #5

; Function Attrs: alwaysinline nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v8f32.v8p7(<8 x float>, <8 x ptr addrspace(7)>, <8 x i1>) #6

; Function Attrs: alwaysinline convergent nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.sched.barrier(i32 immarg) #4

attributes #0 = { alwaysinline "amdgpu-flat-work-group-size"="128,128" "uniform-work-group-size"="true" }
attributes #1 = { alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { alwaysinline nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #3 = { alwaysinline nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { alwaysinline convergent nocallback nofree nounwind willreturn }
attributes #5 = { alwaysinline convergent nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none) }
attributes #6 = { alwaysinline nocallback nofree nosync nounwind willreturn memory(write) }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"amdhsa_code_object_version", i32 500}
!2 = !{i32 128, i32 1, i32 1}
!3 = !{!"amdgpu-synchronize-as", !"local"}
