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

171:                                              ; preds = %176, %3
  %172 = phi i32 [ %177, %176 ], [ 0, %3 ]
  %173 = phi <4 x float> [ %288, %176 ], [ zeroinitializer, %3 ]
  %174 = phi <4 x float> [ %298, %176 ], [ zeroinitializer, %3 ]
  %175 = icmp slt i32 %172, 126
  br i1 %175, label %176, label %326

176:                                              ; preds = %171
  %177 = add i32 %172, 2
  %178 = mul nsw i32 %177, 128
  %179 = add i32 %62, %178
  %180 = zext i32 %179 to i64
  %181 = mul i64 %25, 16384
  %182 = add i64 %181, %180
  %183 = getelementptr i8, ptr addrspace(7) %6, i64 %182
  %184 = load <16 x i8>, ptr addrspace(7) %183, align 1
  %185 = mul i64 %87, 16384
  %186 = add i64 %185, %180
  %187 = getelementptr i8, ptr addrspace(7) %7, i64 %186
  %188 = load <16 x i8>, ptr addrspace(7) %187, align 1
  %189 = add i32 %64, %178
  %190 = zext i32 %189 to i64
  %191 = mul i64 %93, 16384
  %192 = add i64 %191, %190
  %193 = getelementptr i8, ptr addrspace(7) %7, i64 %192
  %194 = load <16 x i8>, ptr addrspace(7) %193, align 1
  %195 = add i32 %66, %178
  %196 = zext i32 %195 to i64
  %197 = mul i64 %99, 16384
  %198 = add i64 %197, %196
  %199 = getelementptr i8, ptr addrspace(7) %7, i64 %198
  %200 = load <16 x i8>, ptr addrspace(7) %199, align 1
  %201 = add i32 %68, %178
  %202 = zext i32 %201 to i64
  %203 = mul i64 %105, 16384
  %204 = add i64 %203, %202
  %205 = getelementptr i8, ptr addrspace(7) %7, i64 %204
  %206 = load <16 x i8>, ptr addrspace(7) %205, align 1
  %207 = add i32 %70, %178
  %208 = zext i32 %207 to i64
  %209 = mul i64 %111, 16384
  %210 = add i64 %209, %208
  %211 = getelementptr i8, ptr addrspace(7) %7, i64 %210
  %212 = load <16 x i8>, ptr addrspace(7) %211, align 1
  %213 = add i32 %72, %178
  %214 = zext i32 %213 to i64
  %215 = mul i64 %117, 16384
  %216 = add i64 %215, %214
  %217 = getelementptr i8, ptr addrspace(7) %7, i64 %216
  %218 = load <16 x i8>, ptr addrspace(7) %217, align 1
  %219 = add i32 %74, %178
  %220 = zext i32 %219 to i64
  %221 = mul i64 %123, 16384
  %222 = add i64 %221, %220
  %223 = getelementptr i8, ptr addrspace(7) %7, i64 %222
  %224 = load <16 x i8>, ptr addrspace(7) %223, align 1
  %225 = add i32 %76, %178
  %226 = zext i32 %225 to i64
  %227 = mul i64 %129, 16384
  %228 = add i64 %227, %226
  %229 = getelementptr i8, ptr addrspace(7) %7, i64 %228
  %230 = load <16 x i8>, ptr addrspace(7) %229, align 1
  fence syncscope("workgroup") release, !mmra !3
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %231 = mul i64 %17, 264
  %232 = add i64 %231, %22
  %233 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %232
  %234 = load <16 x i8>, ptr addrspace(3) %233, align 1
  %235 = mul i64 %17, 264
  %236 = add i64 %235, %162
  %237 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %236
  %238 = load <16 x i8>, ptr addrspace(3) %237, align 1
  %239 = mul i64 %166, 264
  %240 = add i64 %239, %23
  %241 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %240
  %242 = load <32 x i8>, ptr addrspace(3) %241, align 1
  %243 = mul i64 %166, 264
  %244 = add i64 %243, %168
  %245 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %244
  %246 = load <32 x i8>, ptr addrspace(3) %245, align 1
  %247 = mul i64 %170, 264
  %248 = add i64 %247, %23
  %249 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %248
  %250 = load <32 x i8>, ptr addrspace(3) %249, align 1
  %251 = mul i64 %170, 264
  %252 = add i64 %251, %168
  %253 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %252
  %254 = load <32 x i8>, ptr addrspace(3) %253, align 1
  %255 = shufflevector <16 x i8> %234, <16 x i8> %234, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %256 = shufflevector <32 x i8> %242, <32 x i8> %242, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %257 = bitcast <8 x i8> %255 to <2 x i32>
  %258 = bitcast <16 x i8> %256 to <4 x i32>
  %259 = bitcast <2 x i16> %61 to i32
  %260 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %257, <4 x i32> %258, <4 x float> %173, i32 %259, i32 0, i32 0)
  %261 = shufflevector <16 x i8> %234, <16 x i8> %234, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %262 = shufflevector <32 x i8> %242, <32 x i8> %242, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %263 = bitcast <8 x i8> %261 to <2 x i32>
  %264 = bitcast <16 x i8> %262 to <4 x i32>
  %265 = bitcast <2 x i16> %61 to i32
  %266 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %263, <4 x i32> %264, <4 x float> %260, i32 %265, i32 0, i32 0)
  %267 = shufflevector <32 x i8> %250, <32 x i8> %250, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %268 = bitcast <8 x i8> %255 to <2 x i32>
  %269 = bitcast <16 x i8> %267 to <4 x i32>
  %270 = bitcast <2 x i16> %61 to i32
  %271 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %268, <4 x i32> %269, <4 x float> %174, i32 %270, i32 0, i32 0)
  %272 = shufflevector <32 x i8> %250, <32 x i8> %250, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %273 = bitcast <8 x i8> %261 to <2 x i32>
  %274 = bitcast <16 x i8> %272 to <4 x i32>
  %275 = bitcast <2 x i16> %61 to i32
  %276 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %273, <4 x i32> %274, <4 x float> %271, i32 %275, i32 0, i32 0)
  %277 = shufflevector <16 x i8> %238, <16 x i8> %238, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %278 = shufflevector <32 x i8> %246, <32 x i8> %246, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %279 = bitcast <8 x i8> %277 to <2 x i32>
  %280 = bitcast <16 x i8> %278 to <4 x i32>
  %281 = bitcast <2 x i16> %61 to i32
  %282 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %279, <4 x i32> %280, <4 x float> %266, i32 %281, i32 0, i32 0)
  %283 = shufflevector <16 x i8> %238, <16 x i8> %238, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %284 = shufflevector <32 x i8> %246, <32 x i8> %246, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %285 = bitcast <8 x i8> %283 to <2 x i32>
  %286 = bitcast <16 x i8> %284 to <4 x i32>
  %287 = bitcast <2 x i16> %61 to i32
  %288 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %285, <4 x i32> %286, <4 x float> %282, i32 %287, i32 0, i32 0)
  %289 = shufflevector <32 x i8> %254, <32 x i8> %254, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %290 = bitcast <8 x i8> %277 to <2 x i32>
  %291 = bitcast <16 x i8> %289 to <4 x i32>
  %292 = bitcast <2 x i16> %61 to i32
  %293 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %290, <4 x i32> %291, <4 x float> %276, i32 %292, i32 0, i32 0)
  %294 = shufflevector <32 x i8> %254, <32 x i8> %254, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %295 = bitcast <8 x i8> %283 to <2 x i32>
  %296 = bitcast <16 x i8> %294 to <4 x i32>
  %297 = bitcast <2 x i16> %61 to i32
  %298 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %295, <4 x i32> %296, <4 x float> %293, i32 %297, i32 0, i32 0)
  fence syncscope("workgroup") release, !mmra !3
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  call void @llvm.amdgcn.sched.barrier(i32 0)
  %299 = mul i64 %25, 264
  %300 = add i64 %299, %63
  %301 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %300
  store <16 x i8> %184, ptr addrspace(3) %301, align 1
  %302 = mul i64 %25, 264
  %303 = add i64 %302, %63
  %304 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %303
  store <16 x i8> %188, ptr addrspace(3) %304, align 1
  %305 = mul i64 %29, 264
  %306 = add i64 %305, %65
  %307 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %306
  store <16 x i8> %194, ptr addrspace(3) %307, align 1
  %308 = mul i64 %33, 264
  %309 = add i64 %308, %67
  %310 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %309
  store <16 x i8> %200, ptr addrspace(3) %310, align 1
  %311 = mul i64 %37, 264
  %312 = add i64 %311, %69
  %313 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %312
  store <16 x i8> %206, ptr addrspace(3) %313, align 1
  %314 = mul i64 %41, 264
  %315 = add i64 %314, %71
  %316 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %315
  store <16 x i8> %212, ptr addrspace(3) %316, align 1
  %317 = mul i64 %45, 264
  %318 = add i64 %317, %73
  %319 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %318
  store <16 x i8> %218, ptr addrspace(3) %319, align 1
  %320 = mul i64 %49, 264
  %321 = add i64 %320, %75
  %322 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %321
  store <16 x i8> %224, ptr addrspace(3) %322, align 1
  %323 = mul i64 %53, 264
  %324 = add i64 %323, %77
  %325 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %324
  store <16 x i8> %230, ptr addrspace(3) %325, align 1
  br label %171

326:                                              ; preds = %171
  fence syncscope("workgroup") release, !mmra !3
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %327 = mul i64 %17, 264
  %328 = add i64 %327, %22
  %329 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %328
  %330 = load <16 x i8>, ptr addrspace(3) %329, align 1
  %331 = mul i64 %17, 264
  %332 = add i64 %331, %162
  %333 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %332
  %334 = load <16 x i8>, ptr addrspace(3) %333, align 1
  %335 = mul i64 %166, 264
  %336 = add i64 %335, %23
  %337 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %336
  %338 = load <32 x i8>, ptr addrspace(3) %337, align 1
  %339 = mul i64 %166, 264
  %340 = add i64 %339, %168
  %341 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %340
  %342 = load <32 x i8>, ptr addrspace(3) %341, align 1
  %343 = mul i64 %170, 264
  %344 = add i64 %343, %23
  %345 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %344
  %346 = load <32 x i8>, ptr addrspace(3) %345, align 1
  %347 = mul i64 %170, 264
  %348 = add i64 %347, %168
  %349 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %348
  %350 = load <32 x i8>, ptr addrspace(3) %349, align 1
  %351 = shufflevector <16 x i8> %330, <16 x i8> %330, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %352 = shufflevector <32 x i8> %338, <32 x i8> %338, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %353 = bitcast <8 x i8> %351 to <2 x i32>
  %354 = bitcast <16 x i8> %352 to <4 x i32>
  %355 = bitcast <2 x i16> %61 to i32
  %356 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %353, <4 x i32> %354, <4 x float> %173, i32 %355, i32 0, i32 0)
  %357 = shufflevector <16 x i8> %330, <16 x i8> %330, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %358 = shufflevector <32 x i8> %338, <32 x i8> %338, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %359 = bitcast <8 x i8> %357 to <2 x i32>
  %360 = bitcast <16 x i8> %358 to <4 x i32>
  %361 = bitcast <2 x i16> %61 to i32
  %362 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %359, <4 x i32> %360, <4 x float> %356, i32 %361, i32 0, i32 0)
  %363 = shufflevector <32 x i8> %346, <32 x i8> %346, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %364 = bitcast <8 x i8> %351 to <2 x i32>
  %365 = bitcast <16 x i8> %363 to <4 x i32>
  %366 = bitcast <2 x i16> %61 to i32
  %367 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %364, <4 x i32> %365, <4 x float> %174, i32 %366, i32 0, i32 0)
  %368 = shufflevector <32 x i8> %346, <32 x i8> %346, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %369 = bitcast <8 x i8> %357 to <2 x i32>
  %370 = bitcast <16 x i8> %368 to <4 x i32>
  %371 = bitcast <2 x i16> %61 to i32
  %372 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %369, <4 x i32> %370, <4 x float> %367, i32 %371, i32 0, i32 0)
  %373 = shufflevector <16 x i8> %334, <16 x i8> %334, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %374 = shufflevector <32 x i8> %342, <32 x i8> %342, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %375 = bitcast <8 x i8> %373 to <2 x i32>
  %376 = bitcast <16 x i8> %374 to <4 x i32>
  %377 = bitcast <2 x i16> %61 to i32
  %378 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %375, <4 x i32> %376, <4 x float> %362, i32 %377, i32 0, i32 0)
  %379 = shufflevector <16 x i8> %334, <16 x i8> %334, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %380 = shufflevector <32 x i8> %342, <32 x i8> %342, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %381 = bitcast <8 x i8> %379 to <2 x i32>
  %382 = bitcast <16 x i8> %380 to <4 x i32>
  %383 = bitcast <2 x i16> %61 to i32
  %384 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %381, <4 x i32> %382, <4 x float> %378, i32 %383, i32 0, i32 0)
  %385 = shufflevector <32 x i8> %350, <32 x i8> %350, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %386 = bitcast <8 x i8> %373 to <2 x i32>
  %387 = bitcast <16 x i8> %385 to <4 x i32>
  %388 = bitcast <2 x i16> %61 to i32
  %389 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %386, <4 x i32> %387, <4 x float> %372, i32 %388, i32 0, i32 0)
  %390 = shufflevector <32 x i8> %350, <32 x i8> %350, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %391 = bitcast <8 x i8> %379 to <2 x i32>
  %392 = bitcast <16 x i8> %390 to <4 x i32>
  %393 = bitcast <2 x i16> %61 to i32
  %394 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %391, <4 x i32> %392, <4 x float> %389, i32 %393, i32 0, i32 0)
  %395 = shufflevector <4 x float> %384, <4 x float> %384, <2 x i32> <i32 0, i32 2>
  %396 = shufflevector <4 x float> %384, <4 x float> %384, <2 x i32> <i32 1, i32 3>
  %397 = fadd <2 x float> %395, %396
  %398 = extractelement <2 x float> %397, i64 0
  %399 = insertelement <1 x float> poison, float %398, i64 0
  %400 = extractelement <2 x float> %397, i64 1
  %401 = insertelement <1 x float> poison, float %400, i64 0
  %402 = shufflevector <4 x float> %394, <4 x float> %394, <2 x i32> <i32 0, i32 2>
  %403 = shufflevector <4 x float> %394, <4 x float> %394, <2 x i32> <i32 1, i32 3>
  %404 = fadd <2 x float> %402, %403
  %405 = extractelement <2 x float> %404, i64 0
  %406 = insertelement <1 x float> poison, float %405, i64 0
  %407 = extractelement <2 x float> %404, i64 1
  %408 = insertelement <1 x float> poison, float %407, i64 0
  %409 = mul nsw i32 %84, 4
  %410 = add i32 %163, %409
  %411 = mul nsw i32 %410, 16
  %412 = add nsw i32 %411, %13
  %413 = zext i32 %412 to i64
  %414 = mul i64 %15, 13312
  %415 = add i64 %414, %413
  %416 = getelementptr float, ptr addrspace(7) %8, i64 %415
  store <1 x float> %399, ptr addrspace(7) %416, align 4
  %417 = add nsw i32 %412, 16
  %418 = zext i32 %417 to i64
  %419 = mul i64 %15, 13312
  %420 = add i64 %419, %418
  %421 = getelementptr float, ptr addrspace(7) %8, i64 %420
  store <1 x float> %406, ptr addrspace(7) %421, align 4
  %422 = add nsw i32 %14, 1
  %423 = zext i32 %422 to i64
  %424 = mul i64 %423, 13312
  %425 = add i64 %424, %413
  %426 = getelementptr float, ptr addrspace(7) %8, i64 %425
  store <1 x float> %401, ptr addrspace(7) %426, align 4
  %427 = mul i64 %423, 13312
  %428 = add i64 %427, %418
  %429 = getelementptr float, ptr addrspace(7) %8, i64 %428
  store <1 x float> %408, ptr addrspace(7) %429, align 4
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
