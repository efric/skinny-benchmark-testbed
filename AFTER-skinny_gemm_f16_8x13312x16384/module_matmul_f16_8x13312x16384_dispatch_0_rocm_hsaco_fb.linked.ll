; ModuleID = 'matmul_f16_8x13312x16384_dispatch_0'
source_filename = "matmul_f16_8x13312x16384_dispatch_0"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"

@__shared_memory___0 = private addrspace(3) global [64 x [132 x half]] undef, align 16
@__shared_memory__ = private addrspace(3) global [8 x [132 x half]] undef, align 16

; Function Attrs: alwaysinline
define amdgpu_kernel void @matmul_f16_8x13312x16384_dispatch_0_matmul_like_8x13312x16384_f16xf16xf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %1, ptr addrspace(1) inreg noalias noundef nonnull align 16 %2) #0 !reqd_work_group_size !2 {
  %4 = call range(i32 0, 128) i32 @llvm.amdgcn.workitem.id.x()
  %5 = sext i32 %4 to i64
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %6 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %0, i16 0, i64 262144, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %7 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %1, i16 0, i64 436207616, i32 159744)
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
  %19 = mul nsw i32 %12, 16
  %20 = mul nsw i32 %18, 8
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
  %61 = select i1 %60, <4 x i8> <i8 -18, i8 0, i8 0, i8 0>, <4 x i8> <i8 68, i8 0, i8 0, i8 0>
  %62 = mul nsw i32 %26, 8
  %63 = zext i32 %62 to i64
  %64 = mul nsw i32 %30, 8
  %65 = zext i32 %64 to i64
  %66 = mul nsw i32 %34, 8
  %67 = zext i32 %66 to i64
  %68 = mul nsw i32 %38, 8
  %69 = zext i32 %68 to i64
  %70 = mul nsw i32 %42, 8
  %71 = zext i32 %70 to i64
  %72 = mul nsw i32 %46, 8
  %73 = zext i32 %72 to i64
  %74 = mul nsw i32 %50, 8
  %75 = zext i32 %74 to i64
  %76 = mul nsw i32 %54, 8
  %77 = zext i32 %76 to i64
  %78 = call range(i32 0, 208) i32 @llvm.amdgcn.workgroup.id.x()
  %79 = sext i32 %78 to i64
  %80 = mul i64 %25, 16384
  %81 = add i64 %80, %63
  %82 = getelementptr half, ptr addrspace(7) %6, i64 %81
  %83 = load <8 x half>, ptr addrspace(7) %82, align 2
  %84 = trunc i64 %79 to i32
  %85 = mul nsw i32 %84, 64
  %86 = add i32 %24, %85
  %87 = zext i32 %86 to i64
  %88 = mul i64 %87, 16384
  %89 = add i64 %88, %63
  %90 = getelementptr half, ptr addrspace(7) %7, i64 %89
  %91 = load <8 x half>, ptr addrspace(7) %90, align 2
  %92 = add i32 %28, %85
  %93 = zext i32 %92 to i64
  %94 = mul i64 %93, 16384
  %95 = add i64 %94, %65
  %96 = getelementptr half, ptr addrspace(7) %7, i64 %95
  %97 = load <8 x half>, ptr addrspace(7) %96, align 2
  %98 = add i32 %32, %85
  %99 = zext i32 %98 to i64
  %100 = mul i64 %99, 16384
  %101 = add i64 %100, %67
  %102 = getelementptr half, ptr addrspace(7) %7, i64 %101
  %103 = load <8 x half>, ptr addrspace(7) %102, align 2
  %104 = add i32 %36, %85
  %105 = zext i32 %104 to i64
  %106 = mul i64 %105, 16384
  %107 = add i64 %106, %69
  %108 = getelementptr half, ptr addrspace(7) %7, i64 %107
  %109 = load <8 x half>, ptr addrspace(7) %108, align 2
  %110 = add i32 %40, %85
  %111 = zext i32 %110 to i64
  %112 = mul i64 %111, 16384
  %113 = add i64 %112, %71
  %114 = getelementptr half, ptr addrspace(7) %7, i64 %113
  %115 = load <8 x half>, ptr addrspace(7) %114, align 2
  %116 = add i32 %44, %85
  %117 = zext i32 %116 to i64
  %118 = mul i64 %117, 16384
  %119 = add i64 %118, %73
  %120 = getelementptr half, ptr addrspace(7) %7, i64 %119
  %121 = load <8 x half>, ptr addrspace(7) %120, align 2
  %122 = add i32 %48, %85
  %123 = zext i32 %122 to i64
  %124 = mul i64 %123, 16384
  %125 = add i64 %124, %75
  %126 = getelementptr half, ptr addrspace(7) %7, i64 %125
  %127 = load <8 x half>, ptr addrspace(7) %126, align 2
  %128 = add i32 %52, %85
  %129 = zext i32 %128 to i64
  %130 = mul i64 %129, 16384
  %131 = add i64 %130, %77
  %132 = getelementptr half, ptr addrspace(7) %7, i64 %131
  %133 = load <8 x half>, ptr addrspace(7) %132, align 2
  %134 = mul i64 %25, 132
  %135 = add i64 %134, %63
  %136 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %135
  store <8 x half> %83, ptr addrspace(3) %136, align 2
  %137 = mul i64 %25, 132
  %138 = add i64 %137, %63
  %139 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %138
  store <8 x half> %91, ptr addrspace(3) %139, align 2
  %140 = mul i64 %29, 132
  %141 = add i64 %140, %65
  %142 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %141
  store <8 x half> %97, ptr addrspace(3) %142, align 2
  %143 = mul i64 %33, 132
  %144 = add i64 %143, %67
  %145 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %144
  store <8 x half> %103, ptr addrspace(3) %145, align 2
  %146 = mul i64 %37, 132
  %147 = add i64 %146, %69
  %148 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %147
  store <8 x half> %109, ptr addrspace(3) %148, align 2
  %149 = mul i64 %41, 132
  %150 = add i64 %149, %71
  %151 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %150
  store <8 x half> %115, ptr addrspace(3) %151, align 2
  %152 = mul i64 %45, 132
  %153 = add i64 %152, %73
  %154 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %153
  store <8 x half> %121, ptr addrspace(3) %154, align 2
  %155 = mul i64 %49, 132
  %156 = add i64 %155, %75
  %157 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %156
  store <8 x half> %127, ptr addrspace(3) %157, align 2
  %158 = mul i64 %53, 132
  %159 = add i64 %158, %77
  %160 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %159
  store <8 x half> %133, ptr addrspace(3) %160, align 2
  %161 = add nsw i32 %21, 64
  %162 = zext i32 %161 to i64
  %163 = mul nsw i32 %10, 2
  %164 = mul nsw i32 %10, 32
  %165 = add nsw i32 %164, %13
  %166 = zext i32 %165 to i64
  %167 = add nsw i32 %19, 64
  %168 = zext i32 %167 to i64
  %169 = add nsw i32 %165, 16
  %170 = zext i32 %169 to i64
  br label %171

171:                                              ; preds = %176, %3
  %172 = phi i32 [ %177, %176 ], [ 0, %3 ]
  %173 = phi <4 x float> [ %276, %176 ], [ zeroinitializer, %3 ]
  %174 = phi <4 x float> [ %282, %176 ], [ zeroinitializer, %3 ]
  %175 = icmp slt i32 %172, 254
  br i1 %175, label %176, label %310

176:                                              ; preds = %171
  %177 = add i32 %172, 2
  %178 = mul nsw i32 %177, 64
  %179 = add i32 %62, %178
  %180 = zext i32 %179 to i64
  %181 = mul i64 %25, 16384
  %182 = add i64 %181, %180
  %183 = getelementptr half, ptr addrspace(7) %6, i64 %182
  %184 = load <8 x half>, ptr addrspace(7) %183, align 2
  %185 = mul i64 %87, 16384
  %186 = add i64 %185, %180
  %187 = getelementptr half, ptr addrspace(7) %7, i64 %186
  %188 = load <8 x half>, ptr addrspace(7) %187, align 2
  %189 = add i32 %64, %178
  %190 = zext i32 %189 to i64
  %191 = mul i64 %93, 16384
  %192 = add i64 %191, %190
  %193 = getelementptr half, ptr addrspace(7) %7, i64 %192
  %194 = load <8 x half>, ptr addrspace(7) %193, align 2
  %195 = add i32 %66, %178
  %196 = zext i32 %195 to i64
  %197 = mul i64 %99, 16384
  %198 = add i64 %197, %196
  %199 = getelementptr half, ptr addrspace(7) %7, i64 %198
  %200 = load <8 x half>, ptr addrspace(7) %199, align 2
  %201 = add i32 %68, %178
  %202 = zext i32 %201 to i64
  %203 = mul i64 %105, 16384
  %204 = add i64 %203, %202
  %205 = getelementptr half, ptr addrspace(7) %7, i64 %204
  %206 = load <8 x half>, ptr addrspace(7) %205, align 2
  %207 = add i32 %70, %178
  %208 = zext i32 %207 to i64
  %209 = mul i64 %111, 16384
  %210 = add i64 %209, %208
  %211 = getelementptr half, ptr addrspace(7) %7, i64 %210
  %212 = load <8 x half>, ptr addrspace(7) %211, align 2
  %213 = add i32 %72, %178
  %214 = zext i32 %213 to i64
  %215 = mul i64 %117, 16384
  %216 = add i64 %215, %214
  %217 = getelementptr half, ptr addrspace(7) %7, i64 %216
  %218 = load <8 x half>, ptr addrspace(7) %217, align 2
  %219 = add i32 %74, %178
  %220 = zext i32 %219 to i64
  %221 = mul i64 %123, 16384
  %222 = add i64 %221, %220
  %223 = getelementptr half, ptr addrspace(7) %7, i64 %222
  %224 = load <8 x half>, ptr addrspace(7) %223, align 2
  %225 = add i32 %76, %178
  %226 = zext i32 %225 to i64
  %227 = mul i64 %129, 16384
  %228 = add i64 %227, %226
  %229 = getelementptr half, ptr addrspace(7) %7, i64 %228
  %230 = load <8 x half>, ptr addrspace(7) %229, align 2
  fence syncscope("workgroup") release, !mmra !3
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %231 = mul i64 %17, 132
  %232 = add i64 %231, %22
  %233 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %232
  %234 = load <8 x half>, ptr addrspace(3) %233, align 2
  %235 = mul i64 %17, 132
  %236 = add i64 %235, %162
  %237 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %236
  %238 = load <8 x half>, ptr addrspace(3) %237, align 2
  %239 = mul i64 %166, 132
  %240 = add i64 %239, %23
  %241 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %240
  %242 = load <16 x half>, ptr addrspace(3) %241, align 2
  %243 = mul i64 %166, 132
  %244 = add i64 %243, %168
  %245 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %244
  %246 = load <16 x half>, ptr addrspace(3) %245, align 2
  %247 = mul i64 %170, 132
  %248 = add i64 %247, %23
  %249 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %248
  %250 = load <16 x half>, ptr addrspace(3) %249, align 2
  %251 = mul i64 %170, 132
  %252 = add i64 %251, %168
  %253 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %252
  %254 = load <16 x half>, ptr addrspace(3) %253, align 2
  %255 = shufflevector <8 x half> %234, <8 x half> %234, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %256 = shufflevector <16 x half> %242, <16 x half> %242, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %257 = bitcast <4 x i8> %61 to i32
  %258 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %255, <8 x half> %256, <4 x float> %173, i32 %257, i32 0, i32 0)
  %259 = shufflevector <8 x half> %234, <8 x half> %234, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %260 = shufflevector <16 x half> %242, <16 x half> %242, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %261 = bitcast <4 x i8> %61 to i32
  %262 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %259, <8 x half> %260, <4 x float> %258, i32 %261, i32 0, i32 0)
  %263 = shufflevector <16 x half> %250, <16 x half> %250, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %264 = bitcast <4 x i8> %61 to i32
  %265 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %255, <8 x half> %263, <4 x float> %174, i32 %264, i32 0, i32 0)
  %266 = shufflevector <16 x half> %250, <16 x half> %250, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %267 = bitcast <4 x i8> %61 to i32
  %268 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %259, <8 x half> %266, <4 x float> %265, i32 %267, i32 0, i32 0)
  %269 = shufflevector <8 x half> %238, <8 x half> %238, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %270 = shufflevector <16 x half> %246, <16 x half> %246, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %271 = bitcast <4 x i8> %61 to i32
  %272 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %269, <8 x half> %270, <4 x float> %262, i32 %271, i32 0, i32 0)
  %273 = shufflevector <8 x half> %238, <8 x half> %238, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %274 = shufflevector <16 x half> %246, <16 x half> %246, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %275 = bitcast <4 x i8> %61 to i32
  %276 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %273, <8 x half> %274, <4 x float> %272, i32 %275, i32 0, i32 0)
  %277 = shufflevector <16 x half> %254, <16 x half> %254, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %278 = bitcast <4 x i8> %61 to i32
  %279 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %269, <8 x half> %277, <4 x float> %268, i32 %278, i32 0, i32 0)
  %280 = shufflevector <16 x half> %254, <16 x half> %254, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %281 = bitcast <4 x i8> %61 to i32
  %282 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %273, <8 x half> %280, <4 x float> %279, i32 %281, i32 0, i32 0)
  fence syncscope("workgroup") release, !mmra !3
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  call void @llvm.amdgcn.sched.barrier(i32 0)
  %283 = mul i64 %25, 132
  %284 = add i64 %283, %63
  %285 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %284
  store <8 x half> %184, ptr addrspace(3) %285, align 2
  %286 = mul i64 %25, 132
  %287 = add i64 %286, %63
  %288 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %287
  store <8 x half> %188, ptr addrspace(3) %288, align 2
  %289 = mul i64 %29, 132
  %290 = add i64 %289, %65
  %291 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %290
  store <8 x half> %194, ptr addrspace(3) %291, align 2
  %292 = mul i64 %33, 132
  %293 = add i64 %292, %67
  %294 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %293
  store <8 x half> %200, ptr addrspace(3) %294, align 2
  %295 = mul i64 %37, 132
  %296 = add i64 %295, %69
  %297 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %296
  store <8 x half> %206, ptr addrspace(3) %297, align 2
  %298 = mul i64 %41, 132
  %299 = add i64 %298, %71
  %300 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %299
  store <8 x half> %212, ptr addrspace(3) %300, align 2
  %301 = mul i64 %45, 132
  %302 = add i64 %301, %73
  %303 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %302
  store <8 x half> %218, ptr addrspace(3) %303, align 2
  %304 = mul i64 %49, 132
  %305 = add i64 %304, %75
  %306 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %305
  store <8 x half> %224, ptr addrspace(3) %306, align 2
  %307 = mul i64 %53, 132
  %308 = add i64 %307, %77
  %309 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %308
  store <8 x half> %230, ptr addrspace(3) %309, align 2
  br label %171

310:                                              ; preds = %171
  fence syncscope("workgroup") release, !mmra !3
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %311 = mul i64 %17, 132
  %312 = add i64 %311, %22
  %313 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %312
  %314 = load <8 x half>, ptr addrspace(3) %313, align 2
  %315 = mul i64 %17, 132
  %316 = add i64 %315, %162
  %317 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %316
  %318 = load <8 x half>, ptr addrspace(3) %317, align 2
  %319 = mul i64 %166, 132
  %320 = add i64 %319, %23
  %321 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %320
  %322 = load <16 x half>, ptr addrspace(3) %321, align 2
  %323 = mul i64 %166, 132
  %324 = add i64 %323, %168
  %325 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %324
  %326 = load <16 x half>, ptr addrspace(3) %325, align 2
  %327 = mul i64 %170, 132
  %328 = add i64 %327, %23
  %329 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %328
  %330 = load <16 x half>, ptr addrspace(3) %329, align 2
  %331 = mul i64 %170, 132
  %332 = add i64 %331, %168
  %333 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %332
  %334 = load <16 x half>, ptr addrspace(3) %333, align 2
  %335 = shufflevector <8 x half> %314, <8 x half> %314, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %336 = shufflevector <16 x half> %322, <16 x half> %322, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %337 = bitcast <4 x i8> %61 to i32
  %338 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %335, <8 x half> %336, <4 x float> %173, i32 %337, i32 0, i32 0)
  %339 = shufflevector <8 x half> %314, <8 x half> %314, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %340 = shufflevector <16 x half> %322, <16 x half> %322, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %341 = bitcast <4 x i8> %61 to i32
  %342 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %339, <8 x half> %340, <4 x float> %338, i32 %341, i32 0, i32 0)
  %343 = shufflevector <16 x half> %330, <16 x half> %330, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %344 = bitcast <4 x i8> %61 to i32
  %345 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %335, <8 x half> %343, <4 x float> %174, i32 %344, i32 0, i32 0)
  %346 = shufflevector <16 x half> %330, <16 x half> %330, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %347 = bitcast <4 x i8> %61 to i32
  %348 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %339, <8 x half> %346, <4 x float> %345, i32 %347, i32 0, i32 0)
  %349 = shufflevector <8 x half> %318, <8 x half> %318, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %350 = shufflevector <16 x half> %326, <16 x half> %326, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %351 = bitcast <4 x i8> %61 to i32
  %352 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %349, <8 x half> %350, <4 x float> %342, i32 %351, i32 0, i32 0)
  %353 = shufflevector <8 x half> %318, <8 x half> %318, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %354 = shufflevector <16 x half> %326, <16 x half> %326, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %355 = bitcast <4 x i8> %61 to i32
  %356 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %353, <8 x half> %354, <4 x float> %352, i32 %355, i32 0, i32 0)
  %357 = shufflevector <16 x half> %334, <16 x half> %334, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %358 = bitcast <4 x i8> %61 to i32
  %359 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %349, <8 x half> %357, <4 x float> %348, i32 %358, i32 0, i32 0)
  %360 = shufflevector <16 x half> %334, <16 x half> %334, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %361 = bitcast <4 x i8> %61 to i32
  %362 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %353, <8 x half> %360, <4 x float> %359, i32 %361, i32 0, i32 0)
  %363 = shufflevector <4 x float> %356, <4 x float> %356, <2 x i32> <i32 0, i32 2>
  %364 = shufflevector <4 x float> %356, <4 x float> %356, <2 x i32> <i32 1, i32 3>
  %365 = fadd <2 x float> %363, %364
  %366 = extractelement <2 x float> %365, i64 0
  %367 = insertelement <1 x float> poison, float %366, i64 0
  %368 = extractelement <2 x float> %365, i64 1
  %369 = insertelement <1 x float> poison, float %368, i64 0
  %370 = shufflevector <4 x float> %362, <4 x float> %362, <2 x i32> <i32 0, i32 2>
  %371 = shufflevector <4 x float> %362, <4 x float> %362, <2 x i32> <i32 1, i32 3>
  %372 = fadd <2 x float> %370, %371
  %373 = extractelement <2 x float> %372, i64 0
  %374 = insertelement <1 x float> poison, float %373, i64 0
  %375 = extractelement <2 x float> %372, i64 1
  %376 = insertelement <1 x float> poison, float %375, i64 0
  %377 = mul nsw i32 %84, 4
  %378 = add i32 %163, %377
  %379 = mul nsw i32 %378, 16
  %380 = add nsw i32 %379, %13
  %381 = zext i32 %380 to i64
  %382 = mul i64 %15, 13312
  %383 = add i64 %382, %381
  %384 = getelementptr float, ptr addrspace(7) %8, i64 %383
  store <1 x float> %367, ptr addrspace(7) %384, align 4
  %385 = add nsw i32 %380, 16
  %386 = zext i32 %385 to i64
  %387 = mul i64 %15, 13312
  %388 = add i64 %387, %386
  %389 = getelementptr float, ptr addrspace(7) %8, i64 %388
  store <1 x float> %374, ptr addrspace(7) %389, align 4
  %390 = add nsw i32 %14, 1
  %391 = zext i32 %390 to i64
  %392 = mul i64 %391, 13312
  %393 = add i64 %392, %381
  %394 = getelementptr float, ptr addrspace(7) %8, i64 %393
  store <1 x float> %369, ptr addrspace(7) %394, align 4
  %395 = mul i64 %391, 13312
  %396 = add i64 %395, %386
  %397 = getelementptr float, ptr addrspace(7) %8, i64 %396
  store <1 x float> %376, ptr addrspace(7) %397, align 4
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
declare <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half>, <8 x half>, <4 x float>, i32, i32 immarg, i32 immarg) #6

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
