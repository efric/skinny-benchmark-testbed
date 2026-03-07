; ModuleID = 'matmul_f8E4M3FNUZ_8x13312x16384_dispatch_0'
source_filename = "matmul_f8E4M3FNUZ_8x13312x16384_dispatch_0"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"

@__shared_memory___0 = private addrspace(3) global [64 x [264 x i8]] undef, align 16
@__shared_memory__ = private addrspace(3) global [8 x [264 x i8]] undef, align 16

; Function Attrs: alwaysinline
define amdgpu_kernel void @matmul_f8E4M3FNUZ_8x13312x16384_dispatch_0_matmul_like_8x13312x16384_f8E4M3FNUZxf8E4M3FNUZxf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %1, ptr addrspace(1) inreg noalias noundef nonnull align 16 %2) #0 !reqd_work_group_size !2 {
  %4 = call range(i32 0, 128) i32 @llvm.amdgcn.workitem.id.x()
  %5 = sext i32 %4 to i64
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %6 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %0, i16 0, i64 131072, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %7 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %1, i16 0, i64 218103808, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  %8 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %2, i16 0, i64 425984, i32 159744)
  %9 = trunc i64 %5 to i32
  %10 = udiv i32 %9, 64
  %11 = urem i32 %9, 64
  %12 = udiv i32 %11, 16
  %13 = urem i32 %11, 16
  %14 = mul nsw i32 %12, 2
  %15 = zext i32 %14 to i64
  %16 = udiv i32 %13, 2
  %17 = zext i32 %16 to i64
  %18 = urem i32 %11, 2
  %19 = mul nsw i32 %12, 32
  %20 = mul nsw i32 %18, 16
  %21 = add nsw i32 %19, %20
  %22 = zext i32 %21 to i64
  %23 = zext i32 %19 to i64
  %24 = udiv i32 %9, 16
  %25 = zext i32 %24 to i64
  %26 = urem i32 %9, 16
  %27 = add nsw i32 %9, 128
  %28 = udiv i32 %27, 16
  %29 = zext i32 %28 to i64
  %30 = urem i32 %27, 16
  %31 = add nsw i32 %9, 256
  %32 = udiv i32 %31, 16
  %33 = zext i32 %32 to i64
  %34 = urem i32 %31, 16
  %35 = add nsw i32 %9, 384
  %36 = udiv i32 %35, 16
  %37 = zext i32 %36 to i64
  %38 = urem i32 %35, 16
  %39 = add nsw i32 %9, 512
  %40 = udiv i32 %39, 16
  %41 = zext i32 %40 to i64
  %42 = urem i32 %39, 16
  %43 = add nsw i32 %9, 640
  %44 = udiv i32 %43, 16
  %45 = zext i32 %44 to i64
  %46 = urem i32 %43, 16
  %47 = add nsw i32 %9, 768
  %48 = udiv i32 %47, 16
  %49 = zext i32 %48 to i64
  %50 = urem i32 %47, 16
  %51 = add nsw i32 %9, 896
  %52 = udiv i32 %51, 16
  %53 = zext i32 %52 to i64
  %54 = urem i32 %51, 16
  %55 = call noundef range(i32 0, 32) i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %56 = call noundef range(i32 0, 64) i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %55)
  %57 = sext i32 %56 to i64
  %58 = trunc i64 %57 to i32
  %59 = and i32 %58, 1
  %60 = icmp ne i32 %59, 0
  %61 = select i1 %60, <2 x i16> <i16 -4370, i16 0>, <2 x i16> <i16 17476, i16 0>
  %62 = mul nsw i32 %26, 16
  %63 = zext i32 %62 to i64
  %64 = mul nsw i32 %30, 16
  %65 = zext i32 %64 to i64
  %66 = mul nsw i32 %34, 16
  %67 = zext i32 %66 to i64
  %68 = mul nsw i32 %38, 16
  %69 = zext i32 %68 to i64
  %70 = mul nsw i32 %42, 16
  %71 = zext i32 %70 to i64
  %72 = mul nsw i32 %46, 16
  %73 = zext i32 %72 to i64
  %74 = mul nsw i32 %50, 16
  %75 = zext i32 %74 to i64
  %76 = mul nsw i32 %54, 16
  %77 = zext i32 %76 to i64
  %78 = call range(i32 0, 208) i32 @llvm.amdgcn.workgroup.id.x()
  %79 = sext i32 %78 to i64
  %80 = mul i64 %25, 16384
  %81 = add i64 %80, %63
  %82 = getelementptr i8, ptr addrspace(7) %6, i64 %81
  %83 = load <16 x i8>, ptr addrspace(7) %82, align 1
  %84 = trunc i64 %79 to i32
  %85 = mul nsw i32 %84, 64
  %86 = add i32 %24, %85
  %87 = zext i32 %86 to i64
  %88 = mul i64 %87, 16384
  %89 = add i64 %88, %63
  %90 = getelementptr i8, ptr addrspace(7) %7, i64 %89
  %91 = load <16 x i8>, ptr addrspace(7) %90, align 1
  %92 = add i32 %28, %85
  %93 = zext i32 %92 to i64
  %94 = mul i64 %93, 16384
  %95 = add i64 %94, %65
  %96 = getelementptr i8, ptr addrspace(7) %7, i64 %95
  %97 = load <16 x i8>, ptr addrspace(7) %96, align 1
  %98 = add i32 %32, %85
  %99 = zext i32 %98 to i64
  %100 = mul i64 %99, 16384
  %101 = add i64 %100, %67
  %102 = getelementptr i8, ptr addrspace(7) %7, i64 %101
  %103 = load <16 x i8>, ptr addrspace(7) %102, align 1
  %104 = add i32 %36, %85
  %105 = zext i32 %104 to i64
  %106 = mul i64 %105, 16384
  %107 = add i64 %106, %69
  %108 = getelementptr i8, ptr addrspace(7) %7, i64 %107
  %109 = load <16 x i8>, ptr addrspace(7) %108, align 1
  %110 = add i32 %40, %85
  %111 = zext i32 %110 to i64
  %112 = mul i64 %111, 16384
  %113 = add i64 %112, %71
  %114 = getelementptr i8, ptr addrspace(7) %7, i64 %113
  %115 = load <16 x i8>, ptr addrspace(7) %114, align 1
  %116 = add i32 %44, %85
  %117 = zext i32 %116 to i64
  %118 = mul i64 %117, 16384
  %119 = add i64 %118, %73
  %120 = getelementptr i8, ptr addrspace(7) %7, i64 %119
  %121 = load <16 x i8>, ptr addrspace(7) %120, align 1
  %122 = add i32 %48, %85
  %123 = zext i32 %122 to i64
  %124 = mul i64 %123, 16384
  %125 = add i64 %124, %75
  %126 = getelementptr i8, ptr addrspace(7) %7, i64 %125
  %127 = load <16 x i8>, ptr addrspace(7) %126, align 1
  %128 = add i32 %52, %85
  %129 = zext i32 %128 to i64
  %130 = mul i64 %129, 16384
  %131 = add i64 %130, %77
  %132 = getelementptr i8, ptr addrspace(7) %7, i64 %131
  %133 = load <16 x i8>, ptr addrspace(7) %132, align 1
  %134 = mul i64 %25, 264
  %135 = add i64 %134, %63
  %136 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %135
  store <16 x i8> %83, ptr addrspace(3) %136, align 1
  %137 = mul i64 %25, 264
  %138 = add i64 %137, %63
  %139 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %138
  store <16 x i8> %91, ptr addrspace(3) %139, align 1
  %140 = mul i64 %29, 264
  %141 = add i64 %140, %65
  %142 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %141
  store <16 x i8> %97, ptr addrspace(3) %142, align 1
  %143 = mul i64 %33, 264
  %144 = add i64 %143, %67
  %145 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %144
  store <16 x i8> %103, ptr addrspace(3) %145, align 1
  %146 = mul i64 %37, 264
  %147 = add i64 %146, %69
  %148 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %147
  store <16 x i8> %109, ptr addrspace(3) %148, align 1
  %149 = mul i64 %41, 264
  %150 = add i64 %149, %71
  %151 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %150
  store <16 x i8> %115, ptr addrspace(3) %151, align 1
  %152 = mul i64 %45, 264
  %153 = add i64 %152, %73
  %154 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %153
  store <16 x i8> %121, ptr addrspace(3) %154, align 1
  %155 = mul i64 %49, 264
  %156 = add i64 %155, %75
  %157 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %156
  store <16 x i8> %127, ptr addrspace(3) %157, align 1
  %158 = mul i64 %53, 264
  %159 = add i64 %158, %77
  %160 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %159
  store <16 x i8> %133, ptr addrspace(3) %160, align 1
  %161 = add nsw i32 %21, 128
  %162 = zext i32 %161 to i64
  %163 = mul nsw i32 %10, 2
  %164 = mul nsw i32 %10, 32
  %165 = add nsw i32 %164, %13
  %166 = zext i32 %165 to i64
  %167 = add nsw i32 %19, 128
  %168 = zext i32 %167 to i64
  %169 = add nsw i32 %165, 16
  %170 = zext i32 %169 to i64
  br label %171

171:                                              ; preds = %175, %3
  %172 = phi i32 [ %176, %175 ], [ 0, %3 ]
  %173 = phi [1 x [2 x [2 x <1 x float>]]] [ %340, %175 ], [ zeroinitializer, %3 ]
  %174 = icmp slt i32 %172, 126
  br i1 %174, label %175, label %368

175:                                              ; preds = %171
  %176 = add i32 %172, 2
  %177 = mul nsw i32 %176, 128
  %178 = add i32 %62, %177
  %179 = zext i32 %178 to i64
  %180 = mul i64 %25, 16384
  %181 = add i64 %180, %179
  %182 = getelementptr i8, ptr addrspace(7) %6, i64 %181
  %183 = load <16 x i8>, ptr addrspace(7) %182, align 1
  %184 = mul i64 %87, 16384
  %185 = add i64 %184, %179
  %186 = getelementptr i8, ptr addrspace(7) %7, i64 %185
  %187 = load <16 x i8>, ptr addrspace(7) %186, align 1
  %188 = add i32 %64, %177
  %189 = zext i32 %188 to i64
  %190 = mul i64 %93, 16384
  %191 = add i64 %190, %189
  %192 = getelementptr i8, ptr addrspace(7) %7, i64 %191
  %193 = load <16 x i8>, ptr addrspace(7) %192, align 1
  %194 = add i32 %66, %177
  %195 = zext i32 %194 to i64
  %196 = mul i64 %99, 16384
  %197 = add i64 %196, %195
  %198 = getelementptr i8, ptr addrspace(7) %7, i64 %197
  %199 = load <16 x i8>, ptr addrspace(7) %198, align 1
  %200 = add i32 %68, %177
  %201 = zext i32 %200 to i64
  %202 = mul i64 %105, 16384
  %203 = add i64 %202, %201
  %204 = getelementptr i8, ptr addrspace(7) %7, i64 %203
  %205 = load <16 x i8>, ptr addrspace(7) %204, align 1
  %206 = add i32 %70, %177
  %207 = zext i32 %206 to i64
  %208 = mul i64 %111, 16384
  %209 = add i64 %208, %207
  %210 = getelementptr i8, ptr addrspace(7) %7, i64 %209
  %211 = load <16 x i8>, ptr addrspace(7) %210, align 1
  %212 = add i32 %72, %177
  %213 = zext i32 %212 to i64
  %214 = mul i64 %117, 16384
  %215 = add i64 %214, %213
  %216 = getelementptr i8, ptr addrspace(7) %7, i64 %215
  %217 = load <16 x i8>, ptr addrspace(7) %216, align 1
  %218 = add i32 %74, %177
  %219 = zext i32 %218 to i64
  %220 = mul i64 %123, 16384
  %221 = add i64 %220, %219
  %222 = getelementptr i8, ptr addrspace(7) %7, i64 %221
  %223 = load <16 x i8>, ptr addrspace(7) %222, align 1
  %224 = add i32 %76, %177
  %225 = zext i32 %224 to i64
  %226 = mul i64 %129, 16384
  %227 = add i64 %226, %225
  %228 = getelementptr i8, ptr addrspace(7) %7, i64 %227
  %229 = load <16 x i8>, ptr addrspace(7) %228, align 1
  fence syncscope("workgroup") release, !mmra !3
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %230 = mul i64 %17, 264
  %231 = add i64 %230, %22
  %232 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %231
  %233 = load <16 x i8>, ptr addrspace(3) %232, align 1
  %234 = mul i64 %17, 264
  %235 = add i64 %234, %162
  %236 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %235
  %237 = load <16 x i8>, ptr addrspace(3) %236, align 1
  %238 = mul i64 %166, 264
  %239 = add i64 %238, %23
  %240 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %239
  %241 = load <32 x i8>, ptr addrspace(3) %240, align 1
  %242 = mul i64 %166, 264
  %243 = add i64 %242, %168
  %244 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %243
  %245 = load <32 x i8>, ptr addrspace(3) %244, align 1
  %246 = mul i64 %170, 264
  %247 = add i64 %246, %23
  %248 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %247
  %249 = load <32 x i8>, ptr addrspace(3) %248, align 1
  %250 = mul i64 %170, 264
  %251 = add i64 %250, %168
  %252 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %251
  %253 = load <32 x i8>, ptr addrspace(3) %252, align 1
  %254 = extractvalue [1 x [2 x [2 x <1 x float>]]] %173, 0, 0, 0
  %255 = extractelement <1 x float> %254, i64 0
  %256 = insertelement <2 x float> poison, float %255, i64 0
  %257 = extractvalue [1 x [2 x [2 x <1 x float>]]] %173, 0, 0, 1
  %258 = extractelement <1 x float> %257, i64 0
  %259 = insertelement <2 x float> %256, float %258, i64 1
  %260 = shufflevector <2 x float> %259, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %261 = shufflevector <16 x i8> %233, <16 x i8> %233, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %262 = shufflevector <32 x i8> %241, <32 x i8> %241, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %263 = bitcast <8 x i8> %261 to <2 x i32>
  %264 = bitcast <16 x i8> %262 to <4 x i32>
  %265 = bitcast <2 x i16> %61 to i32
  %266 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %263, <4 x i32> %264, <4 x float> %260, i32 %265, i32 0, i32 0)
  %267 = shufflevector <16 x i8> %233, <16 x i8> %233, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %268 = shufflevector <32 x i8> %241, <32 x i8> %241, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %269 = bitcast <8 x i8> %267 to <2 x i32>
  %270 = bitcast <16 x i8> %268 to <4 x i32>
  %271 = bitcast <2 x i16> %61 to i32
  %272 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %269, <4 x i32> %270, <4 x float> %266, i32 %271, i32 0, i32 0)
  %273 = shufflevector <4 x float> %272, <4 x float> %272, <2 x i32> <i32 0, i32 2>
  %274 = shufflevector <4 x float> %272, <4 x float> %272, <2 x i32> <i32 1, i32 3>
  %275 = fadd <2 x float> %273, %274
  %276 = extractvalue [1 x [2 x [2 x <1 x float>]]] %173, 0, 1, 0
  %277 = extractelement <1 x float> %276, i64 0
  %278 = insertelement <2 x float> poison, float %277, i64 0
  %279 = extractvalue [1 x [2 x [2 x <1 x float>]]] %173, 0, 1, 1
  %280 = extractelement <1 x float> %279, i64 0
  %281 = insertelement <2 x float> %278, float %280, i64 1
  %282 = shufflevector <2 x float> %281, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %283 = shufflevector <32 x i8> %249, <32 x i8> %249, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %284 = bitcast <8 x i8> %261 to <2 x i32>
  %285 = bitcast <16 x i8> %283 to <4 x i32>
  %286 = bitcast <2 x i16> %61 to i32
  %287 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %284, <4 x i32> %285, <4 x float> %282, i32 %286, i32 0, i32 0)
  %288 = shufflevector <32 x i8> %249, <32 x i8> %249, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %289 = bitcast <8 x i8> %267 to <2 x i32>
  %290 = bitcast <16 x i8> %288 to <4 x i32>
  %291 = bitcast <2 x i16> %61 to i32
  %292 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %289, <4 x i32> %290, <4 x float> %287, i32 %291, i32 0, i32 0)
  %293 = shufflevector <4 x float> %292, <4 x float> %292, <2 x i32> <i32 0, i32 2>
  %294 = shufflevector <4 x float> %292, <4 x float> %292, <2 x i32> <i32 1, i32 3>
  %295 = fadd <2 x float> %293, %294
  %296 = shufflevector <2 x float> %275, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %297 = shufflevector <16 x i8> %237, <16 x i8> %237, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %298 = shufflevector <32 x i8> %245, <32 x i8> %245, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %299 = bitcast <8 x i8> %297 to <2 x i32>
  %300 = bitcast <16 x i8> %298 to <4 x i32>
  %301 = bitcast <2 x i16> %61 to i32
  %302 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %299, <4 x i32> %300, <4 x float> %296, i32 %301, i32 0, i32 0)
  %303 = shufflevector <16 x i8> %237, <16 x i8> %237, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %304 = shufflevector <32 x i8> %245, <32 x i8> %245, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %305 = bitcast <8 x i8> %303 to <2 x i32>
  %306 = bitcast <16 x i8> %304 to <4 x i32>
  %307 = bitcast <2 x i16> %61 to i32
  %308 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %305, <4 x i32> %306, <4 x float> %302, i32 %307, i32 0, i32 0)
  %309 = shufflevector <4 x float> %308, <4 x float> %308, <2 x i32> <i32 0, i32 2>
  %310 = shufflevector <4 x float> %308, <4 x float> %308, <2 x i32> <i32 1, i32 3>
  %311 = fadd <2 x float> %309, %310
  %312 = shufflevector <2 x float> %295, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %313 = shufflevector <32 x i8> %253, <32 x i8> %253, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %314 = bitcast <8 x i8> %297 to <2 x i32>
  %315 = bitcast <16 x i8> %313 to <4 x i32>
  %316 = bitcast <2 x i16> %61 to i32
  %317 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %314, <4 x i32> %315, <4 x float> %312, i32 %316, i32 0, i32 0)
  %318 = shufflevector <32 x i8> %253, <32 x i8> %253, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %319 = bitcast <8 x i8> %303 to <2 x i32>
  %320 = bitcast <16 x i8> %318 to <4 x i32>
  %321 = bitcast <2 x i16> %61 to i32
  %322 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %319, <4 x i32> %320, <4 x float> %317, i32 %321, i32 0, i32 0)
  %323 = shufflevector <4 x float> %322, <4 x float> %322, <2 x i32> <i32 0, i32 2>
  %324 = shufflevector <4 x float> %322, <4 x float> %322, <2 x i32> <i32 1, i32 3>
  %325 = fadd <2 x float> %323, %324
  %326 = extractelement <2 x float> %311, i64 0
  %327 = insertelement <1 x float> poison, float %326, i64 0
  %328 = insertvalue [2 x <1 x float>] poison, <1 x float> %327, 0
  %329 = extractelement <2 x float> %311, i64 1
  %330 = insertelement <1 x float> poison, float %329, i64 0
  %331 = insertvalue [2 x <1 x float>] %328, <1 x float> %330, 1
  %332 = insertvalue [2 x [2 x <1 x float>]] zeroinitializer, [2 x <1 x float>] %331, 0
  %333 = extractelement <2 x float> %325, i64 0
  %334 = insertelement <1 x float> poison, float %333, i64 0
  %335 = insertvalue [2 x <1 x float>] poison, <1 x float> %334, 0
  %336 = extractelement <2 x float> %325, i64 1
  %337 = insertelement <1 x float> poison, float %336, i64 0
  %338 = insertvalue [2 x <1 x float>] %335, <1 x float> %337, 1
  %339 = insertvalue [2 x [2 x <1 x float>]] %332, [2 x <1 x float>] %338, 1
  %340 = insertvalue [1 x [2 x [2 x <1 x float>]]] poison, [2 x [2 x <1 x float>]] %339, 0
  fence syncscope("workgroup") release, !mmra !3
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  call void @llvm.amdgcn.sched.barrier(i32 0)
  %341 = mul i64 %25, 264
  %342 = add i64 %341, %63
  %343 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %342
  store <16 x i8> %183, ptr addrspace(3) %343, align 1
  %344 = mul i64 %25, 264
  %345 = add i64 %344, %63
  %346 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %345
  store <16 x i8> %187, ptr addrspace(3) %346, align 1
  %347 = mul i64 %29, 264
  %348 = add i64 %347, %65
  %349 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %348
  store <16 x i8> %193, ptr addrspace(3) %349, align 1
  %350 = mul i64 %33, 264
  %351 = add i64 %350, %67
  %352 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %351
  store <16 x i8> %199, ptr addrspace(3) %352, align 1
  %353 = mul i64 %37, 264
  %354 = add i64 %353, %69
  %355 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %354
  store <16 x i8> %205, ptr addrspace(3) %355, align 1
  %356 = mul i64 %41, 264
  %357 = add i64 %356, %71
  %358 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %357
  store <16 x i8> %211, ptr addrspace(3) %358, align 1
  %359 = mul i64 %45, 264
  %360 = add i64 %359, %73
  %361 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %360
  store <16 x i8> %217, ptr addrspace(3) %361, align 1
  %362 = mul i64 %49, 264
  %363 = add i64 %362, %75
  %364 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %363
  store <16 x i8> %223, ptr addrspace(3) %364, align 1
  %365 = mul i64 %53, 264
  %366 = add i64 %365, %77
  %367 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %366
  store <16 x i8> %229, ptr addrspace(3) %367, align 1
  br label %171

368:                                              ; preds = %171
  fence syncscope("workgroup") release, !mmra !3
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %369 = mul i64 %17, 264
  %370 = add i64 %369, %22
  %371 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %370
  %372 = load <16 x i8>, ptr addrspace(3) %371, align 1
  %373 = mul i64 %17, 264
  %374 = add i64 %373, %162
  %375 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %374
  %376 = load <16 x i8>, ptr addrspace(3) %375, align 1
  %377 = mul i64 %166, 264
  %378 = add i64 %377, %23
  %379 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %378
  %380 = load <32 x i8>, ptr addrspace(3) %379, align 1
  %381 = mul i64 %166, 264
  %382 = add i64 %381, %168
  %383 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %382
  %384 = load <32 x i8>, ptr addrspace(3) %383, align 1
  %385 = mul i64 %170, 264
  %386 = add i64 %385, %23
  %387 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %386
  %388 = load <32 x i8>, ptr addrspace(3) %387, align 1
  %389 = mul i64 %170, 264
  %390 = add i64 %389, %168
  %391 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %390
  %392 = load <32 x i8>, ptr addrspace(3) %391, align 1
  %393 = extractvalue [1 x [2 x [2 x <1 x float>]]] %173, 0, 0, 0
  %394 = extractelement <1 x float> %393, i64 0
  %395 = insertelement <2 x float> poison, float %394, i64 0
  %396 = extractvalue [1 x [2 x [2 x <1 x float>]]] %173, 0, 0, 1
  %397 = extractelement <1 x float> %396, i64 0
  %398 = insertelement <2 x float> %395, float %397, i64 1
  %399 = shufflevector <2 x float> %398, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %400 = shufflevector <16 x i8> %372, <16 x i8> %372, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %401 = shufflevector <32 x i8> %380, <32 x i8> %380, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %402 = bitcast <8 x i8> %400 to <2 x i32>
  %403 = bitcast <16 x i8> %401 to <4 x i32>
  %404 = bitcast <2 x i16> %61 to i32
  %405 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %402, <4 x i32> %403, <4 x float> %399, i32 %404, i32 0, i32 0)
  %406 = shufflevector <16 x i8> %372, <16 x i8> %372, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %407 = shufflevector <32 x i8> %380, <32 x i8> %380, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %408 = bitcast <8 x i8> %406 to <2 x i32>
  %409 = bitcast <16 x i8> %407 to <4 x i32>
  %410 = bitcast <2 x i16> %61 to i32
  %411 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %408, <4 x i32> %409, <4 x float> %405, i32 %410, i32 0, i32 0)
  %412 = shufflevector <4 x float> %411, <4 x float> %411, <2 x i32> <i32 0, i32 2>
  %413 = shufflevector <4 x float> %411, <4 x float> %411, <2 x i32> <i32 1, i32 3>
  %414 = fadd <2 x float> %412, %413
  %415 = extractvalue [1 x [2 x [2 x <1 x float>]]] %173, 0, 1, 0
  %416 = extractelement <1 x float> %415, i64 0
  %417 = insertelement <2 x float> poison, float %416, i64 0
  %418 = extractvalue [1 x [2 x [2 x <1 x float>]]] %173, 0, 1, 1
  %419 = extractelement <1 x float> %418, i64 0
  %420 = insertelement <2 x float> %417, float %419, i64 1
  %421 = shufflevector <2 x float> %420, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %422 = shufflevector <32 x i8> %388, <32 x i8> %388, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %423 = bitcast <8 x i8> %400 to <2 x i32>
  %424 = bitcast <16 x i8> %422 to <4 x i32>
  %425 = bitcast <2 x i16> %61 to i32
  %426 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %423, <4 x i32> %424, <4 x float> %421, i32 %425, i32 0, i32 0)
  %427 = shufflevector <32 x i8> %388, <32 x i8> %388, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %428 = bitcast <8 x i8> %406 to <2 x i32>
  %429 = bitcast <16 x i8> %427 to <4 x i32>
  %430 = bitcast <2 x i16> %61 to i32
  %431 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %428, <4 x i32> %429, <4 x float> %426, i32 %430, i32 0, i32 0)
  %432 = shufflevector <4 x float> %431, <4 x float> %431, <2 x i32> <i32 0, i32 2>
  %433 = shufflevector <4 x float> %431, <4 x float> %431, <2 x i32> <i32 1, i32 3>
  %434 = fadd <2 x float> %432, %433
  %435 = shufflevector <2 x float> %414, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %436 = shufflevector <16 x i8> %376, <16 x i8> %376, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %437 = shufflevector <32 x i8> %384, <32 x i8> %384, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %438 = bitcast <8 x i8> %436 to <2 x i32>
  %439 = bitcast <16 x i8> %437 to <4 x i32>
  %440 = bitcast <2 x i16> %61 to i32
  %441 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %438, <4 x i32> %439, <4 x float> %435, i32 %440, i32 0, i32 0)
  %442 = shufflevector <16 x i8> %376, <16 x i8> %376, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %443 = shufflevector <32 x i8> %384, <32 x i8> %384, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %444 = bitcast <8 x i8> %442 to <2 x i32>
  %445 = bitcast <16 x i8> %443 to <4 x i32>
  %446 = bitcast <2 x i16> %61 to i32
  %447 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %444, <4 x i32> %445, <4 x float> %441, i32 %446, i32 0, i32 0)
  %448 = shufflevector <4 x float> %447, <4 x float> %447, <2 x i32> <i32 0, i32 2>
  %449 = shufflevector <4 x float> %447, <4 x float> %447, <2 x i32> <i32 1, i32 3>
  %450 = fadd <2 x float> %448, %449
  %451 = shufflevector <2 x float> %434, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %452 = shufflevector <32 x i8> %392, <32 x i8> %392, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %453 = bitcast <8 x i8> %436 to <2 x i32>
  %454 = bitcast <16 x i8> %452 to <4 x i32>
  %455 = bitcast <2 x i16> %61 to i32
  %456 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %453, <4 x i32> %454, <4 x float> %451, i32 %455, i32 0, i32 0)
  %457 = shufflevector <32 x i8> %392, <32 x i8> %392, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %458 = bitcast <8 x i8> %442 to <2 x i32>
  %459 = bitcast <16 x i8> %457 to <4 x i32>
  %460 = bitcast <2 x i16> %61 to i32
  %461 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %458, <4 x i32> %459, <4 x float> %456, i32 %460, i32 0, i32 0)
  %462 = shufflevector <4 x float> %461, <4 x float> %461, <2 x i32> <i32 0, i32 2>
  %463 = shufflevector <4 x float> %461, <4 x float> %461, <2 x i32> <i32 1, i32 3>
  %464 = fadd <2 x float> %462, %463
  %465 = extractelement <2 x float> %450, i64 0
  %466 = insertelement <1 x float> poison, float %465, i64 0
  %467 = extractelement <2 x float> %450, i64 1
  %468 = insertelement <1 x float> poison, float %467, i64 0
  %469 = extractelement <2 x float> %464, i64 0
  %470 = insertelement <1 x float> poison, float %469, i64 0
  %471 = extractelement <2 x float> %464, i64 1
  %472 = insertelement <1 x float> poison, float %471, i64 0
  %473 = mul nsw i32 %84, 4
  %474 = add i32 %163, %473
  %475 = mul nsw i32 %474, 16
  %476 = add nsw i32 %475, %13
  %477 = zext i32 %476 to i64
  %478 = mul i64 %15, 13312
  %479 = add i64 %478, %477
  %480 = getelementptr float, ptr addrspace(7) %8, i64 %479
  store <1 x float> %466, ptr addrspace(7) %480, align 4
  %481 = add nsw i32 %476, 16
  %482 = zext i32 %481 to i64
  %483 = mul i64 %15, 13312
  %484 = add i64 %483, %482
  %485 = getelementptr float, ptr addrspace(7) %8, i64 %484
  store <1 x float> %470, ptr addrspace(7) %485, align 4
  %486 = add nsw i32 %14, 1
  %487 = zext i32 %486 to i64
  %488 = mul i64 %487, 13312
  %489 = add i64 %488, %477
  %490 = getelementptr float, ptr addrspace(7) %8, i64 %489
  store <1 x float> %468, ptr addrspace(7) %490, align 4
  %491 = mul i64 %487, 13312
  %492 = add i64 %491, %482
  %493 = getelementptr float, ptr addrspace(7) %8, i64 %492
  store <1 x float> %472, ptr addrspace(7) %493, align 4
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

; Function Attrs: alwaysinline nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #4

; Function Attrs: alwaysinline nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #4

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: alwaysinline convergent nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #5

; Function Attrs: alwaysinline convergent nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32>, <4 x i32>, <4 x float>, i32, i32 immarg, i32 immarg) #6

; Function Attrs: alwaysinline convergent nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.sched.barrier(i32 immarg) #5

attributes #0 = { alwaysinline "amdgpu-flat-work-group-size"="128,128" "uniform-work-group-size"="true" }
attributes #1 = { alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { alwaysinline nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #3 = { alwaysinline nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { alwaysinline nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none) }
attributes #5 = { alwaysinline convergent nocallback nofree nounwind willreturn }
attributes #6 = { alwaysinline convergent nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"amdhsa_code_object_version", i32 500}
!2 = !{i32 128, i32 1, i32 1}
!3 = !{!"amdgpu-synchronize-as", !"local"}
