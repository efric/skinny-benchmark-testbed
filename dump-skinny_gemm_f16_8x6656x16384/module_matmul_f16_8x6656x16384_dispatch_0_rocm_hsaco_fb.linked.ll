; ModuleID = 'matmul_f16_8x6656x16384_dispatch_0'
source_filename = "matmul_f16_8x6656x16384_dispatch_0"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"

@__shared_memory___0 = private addrspace(3) global [64 x [132 x half]] undef, align 16
@__shared_memory__ = private addrspace(3) global [8 x [132 x half]] undef, align 16

; Function Attrs: alwaysinline
define amdgpu_kernel void @matmul_f16_8x6656x16384_dispatch_0_matmul_like_8x6656x16384_f16xf16xf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %1, ptr addrspace(1) inreg noalias noundef nonnull align 16 %2) #0 !reqd_work_group_size !2 {
  %4 = call range(i32 0, 128) i32 @llvm.amdgcn.workitem.id.x()
  %5 = sext i32 %4 to i64
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %6 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %0, i16 0, i64 262144, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %7 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %1, i16 0, i64 218103808, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  %8 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %2, i16 0, i64 212992, i32 159744)
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
  %78 = call range(i32 0, 104) i32 @llvm.amdgcn.workgroup.id.x()
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

171:                                              ; preds = %175, %3
  %172 = phi i32 [ %176, %175 ], [ 0, %3 ]
  %173 = phi [1 x [2 x [2 x <1 x float>]]] [ %324, %175 ], [ zeroinitializer, %3 ]
  %174 = icmp slt i32 %172, 254
  br i1 %174, label %175, label %352

175:                                              ; preds = %171
  %176 = add i32 %172, 2
  %177 = mul nsw i32 %176, 64
  %178 = add i32 %62, %177
  %179 = zext i32 %178 to i64
  %180 = mul i64 %25, 16384
  %181 = add i64 %180, %179
  %182 = getelementptr half, ptr addrspace(7) %6, i64 %181
  %183 = load <8 x half>, ptr addrspace(7) %182, align 2
  %184 = mul i64 %87, 16384
  %185 = add i64 %184, %179
  %186 = getelementptr half, ptr addrspace(7) %7, i64 %185
  %187 = load <8 x half>, ptr addrspace(7) %186, align 2
  %188 = add i32 %64, %177
  %189 = zext i32 %188 to i64
  %190 = mul i64 %93, 16384
  %191 = add i64 %190, %189
  %192 = getelementptr half, ptr addrspace(7) %7, i64 %191
  %193 = load <8 x half>, ptr addrspace(7) %192, align 2
  %194 = add i32 %66, %177
  %195 = zext i32 %194 to i64
  %196 = mul i64 %99, 16384
  %197 = add i64 %196, %195
  %198 = getelementptr half, ptr addrspace(7) %7, i64 %197
  %199 = load <8 x half>, ptr addrspace(7) %198, align 2
  %200 = add i32 %68, %177
  %201 = zext i32 %200 to i64
  %202 = mul i64 %105, 16384
  %203 = add i64 %202, %201
  %204 = getelementptr half, ptr addrspace(7) %7, i64 %203
  %205 = load <8 x half>, ptr addrspace(7) %204, align 2
  %206 = add i32 %70, %177
  %207 = zext i32 %206 to i64
  %208 = mul i64 %111, 16384
  %209 = add i64 %208, %207
  %210 = getelementptr half, ptr addrspace(7) %7, i64 %209
  %211 = load <8 x half>, ptr addrspace(7) %210, align 2
  %212 = add i32 %72, %177
  %213 = zext i32 %212 to i64
  %214 = mul i64 %117, 16384
  %215 = add i64 %214, %213
  %216 = getelementptr half, ptr addrspace(7) %7, i64 %215
  %217 = load <8 x half>, ptr addrspace(7) %216, align 2
  %218 = add i32 %74, %177
  %219 = zext i32 %218 to i64
  %220 = mul i64 %123, 16384
  %221 = add i64 %220, %219
  %222 = getelementptr half, ptr addrspace(7) %7, i64 %221
  %223 = load <8 x half>, ptr addrspace(7) %222, align 2
  %224 = add i32 %76, %177
  %225 = zext i32 %224 to i64
  %226 = mul i64 %129, 16384
  %227 = add i64 %226, %225
  %228 = getelementptr half, ptr addrspace(7) %7, i64 %227
  %229 = load <8 x half>, ptr addrspace(7) %228, align 2
  fence syncscope("workgroup") release, !mmra !3
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %230 = mul i64 %17, 132
  %231 = add i64 %230, %22
  %232 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %231
  %233 = load <8 x half>, ptr addrspace(3) %232, align 2
  %234 = mul i64 %17, 132
  %235 = add i64 %234, %162
  %236 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %235
  %237 = load <8 x half>, ptr addrspace(3) %236, align 2
  %238 = mul i64 %166, 132
  %239 = add i64 %238, %23
  %240 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %239
  %241 = load <16 x half>, ptr addrspace(3) %240, align 2
  %242 = mul i64 %166, 132
  %243 = add i64 %242, %168
  %244 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %243
  %245 = load <16 x half>, ptr addrspace(3) %244, align 2
  %246 = mul i64 %170, 132
  %247 = add i64 %246, %23
  %248 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %247
  %249 = load <16 x half>, ptr addrspace(3) %248, align 2
  %250 = mul i64 %170, 132
  %251 = add i64 %250, %168
  %252 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %251
  %253 = load <16 x half>, ptr addrspace(3) %252, align 2
  %254 = extractvalue [1 x [2 x [2 x <1 x float>]]] %173, 0, 0, 0
  %255 = extractelement <1 x float> %254, i64 0
  %256 = insertelement <2 x float> poison, float %255, i64 0
  %257 = extractvalue [1 x [2 x [2 x <1 x float>]]] %173, 0, 0, 1
  %258 = extractelement <1 x float> %257, i64 0
  %259 = insertelement <2 x float> %256, float %258, i64 1
  %260 = shufflevector <2 x float> %259, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %261 = shufflevector <8 x half> %233, <8 x half> %233, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %262 = shufflevector <16 x half> %241, <16 x half> %241, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %263 = bitcast <4 x i8> %61 to i32
  %264 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %261, <8 x half> %262, <4 x float> %260, i32 %263, i32 0, i32 0)
  %265 = shufflevector <8 x half> %233, <8 x half> %233, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %266 = shufflevector <16 x half> %241, <16 x half> %241, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %267 = bitcast <4 x i8> %61 to i32
  %268 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %265, <8 x half> %266, <4 x float> %264, i32 %267, i32 0, i32 0)
  %269 = shufflevector <4 x float> %268, <4 x float> %268, <2 x i32> <i32 0, i32 2>
  %270 = shufflevector <4 x float> %268, <4 x float> %268, <2 x i32> <i32 1, i32 3>
  %271 = fadd <2 x float> %269, %270
  %272 = extractvalue [1 x [2 x [2 x <1 x float>]]] %173, 0, 1, 0
  %273 = extractelement <1 x float> %272, i64 0
  %274 = insertelement <2 x float> poison, float %273, i64 0
  %275 = extractvalue [1 x [2 x [2 x <1 x float>]]] %173, 0, 1, 1
  %276 = extractelement <1 x float> %275, i64 0
  %277 = insertelement <2 x float> %274, float %276, i64 1
  %278 = shufflevector <2 x float> %277, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %279 = shufflevector <16 x half> %249, <16 x half> %249, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %280 = bitcast <4 x i8> %61 to i32
  %281 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %261, <8 x half> %279, <4 x float> %278, i32 %280, i32 0, i32 0)
  %282 = shufflevector <16 x half> %249, <16 x half> %249, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %283 = bitcast <4 x i8> %61 to i32
  %284 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %265, <8 x half> %282, <4 x float> %281, i32 %283, i32 0, i32 0)
  %285 = shufflevector <4 x float> %284, <4 x float> %284, <2 x i32> <i32 0, i32 2>
  %286 = shufflevector <4 x float> %284, <4 x float> %284, <2 x i32> <i32 1, i32 3>
  %287 = fadd <2 x float> %285, %286
  %288 = shufflevector <2 x float> %271, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %289 = shufflevector <8 x half> %237, <8 x half> %237, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %290 = shufflevector <16 x half> %245, <16 x half> %245, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %291 = bitcast <4 x i8> %61 to i32
  %292 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %289, <8 x half> %290, <4 x float> %288, i32 %291, i32 0, i32 0)
  %293 = shufflevector <8 x half> %237, <8 x half> %237, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %294 = shufflevector <16 x half> %245, <16 x half> %245, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %295 = bitcast <4 x i8> %61 to i32
  %296 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %293, <8 x half> %294, <4 x float> %292, i32 %295, i32 0, i32 0)
  %297 = shufflevector <4 x float> %296, <4 x float> %296, <2 x i32> <i32 0, i32 2>
  %298 = shufflevector <4 x float> %296, <4 x float> %296, <2 x i32> <i32 1, i32 3>
  %299 = fadd <2 x float> %297, %298
  %300 = shufflevector <2 x float> %287, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %301 = shufflevector <16 x half> %253, <16 x half> %253, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %302 = bitcast <4 x i8> %61 to i32
  %303 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %289, <8 x half> %301, <4 x float> %300, i32 %302, i32 0, i32 0)
  %304 = shufflevector <16 x half> %253, <16 x half> %253, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %305 = bitcast <4 x i8> %61 to i32
  %306 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %293, <8 x half> %304, <4 x float> %303, i32 %305, i32 0, i32 0)
  %307 = shufflevector <4 x float> %306, <4 x float> %306, <2 x i32> <i32 0, i32 2>
  %308 = shufflevector <4 x float> %306, <4 x float> %306, <2 x i32> <i32 1, i32 3>
  %309 = fadd <2 x float> %307, %308
  %310 = extractelement <2 x float> %299, i64 0
  %311 = insertelement <1 x float> poison, float %310, i64 0
  %312 = insertvalue [2 x <1 x float>] poison, <1 x float> %311, 0
  %313 = extractelement <2 x float> %299, i64 1
  %314 = insertelement <1 x float> poison, float %313, i64 0
  %315 = insertvalue [2 x <1 x float>] %312, <1 x float> %314, 1
  %316 = insertvalue [2 x [2 x <1 x float>]] zeroinitializer, [2 x <1 x float>] %315, 0
  %317 = extractelement <2 x float> %309, i64 0
  %318 = insertelement <1 x float> poison, float %317, i64 0
  %319 = insertvalue [2 x <1 x float>] poison, <1 x float> %318, 0
  %320 = extractelement <2 x float> %309, i64 1
  %321 = insertelement <1 x float> poison, float %320, i64 0
  %322 = insertvalue [2 x <1 x float>] %319, <1 x float> %321, 1
  %323 = insertvalue [2 x [2 x <1 x float>]] %316, [2 x <1 x float>] %322, 1
  %324 = insertvalue [1 x [2 x [2 x <1 x float>]]] poison, [2 x [2 x <1 x float>]] %323, 0
  fence syncscope("workgroup") release, !mmra !3
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  call void @llvm.amdgcn.sched.barrier(i32 0)
  %325 = mul i64 %25, 132
  %326 = add i64 %325, %63
  %327 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %326
  store <8 x half> %183, ptr addrspace(3) %327, align 2
  %328 = mul i64 %25, 132
  %329 = add i64 %328, %63
  %330 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %329
  store <8 x half> %187, ptr addrspace(3) %330, align 2
  %331 = mul i64 %29, 132
  %332 = add i64 %331, %65
  %333 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %332
  store <8 x half> %193, ptr addrspace(3) %333, align 2
  %334 = mul i64 %33, 132
  %335 = add i64 %334, %67
  %336 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %335
  store <8 x half> %199, ptr addrspace(3) %336, align 2
  %337 = mul i64 %37, 132
  %338 = add i64 %337, %69
  %339 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %338
  store <8 x half> %205, ptr addrspace(3) %339, align 2
  %340 = mul i64 %41, 132
  %341 = add i64 %340, %71
  %342 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %341
  store <8 x half> %211, ptr addrspace(3) %342, align 2
  %343 = mul i64 %45, 132
  %344 = add i64 %343, %73
  %345 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %344
  store <8 x half> %217, ptr addrspace(3) %345, align 2
  %346 = mul i64 %49, 132
  %347 = add i64 %346, %75
  %348 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %347
  store <8 x half> %223, ptr addrspace(3) %348, align 2
  %349 = mul i64 %53, 132
  %350 = add i64 %349, %77
  %351 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %350
  store <8 x half> %229, ptr addrspace(3) %351, align 2
  br label %171

352:                                              ; preds = %171
  fence syncscope("workgroup") release, !mmra !3
  call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %353 = mul i64 %17, 132
  %354 = add i64 %353, %22
  %355 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %354
  %356 = load <8 x half>, ptr addrspace(3) %355, align 2
  %357 = mul i64 %17, 132
  %358 = add i64 %357, %162
  %359 = getelementptr half, ptr addrspace(3) @__shared_memory__, i64 %358
  %360 = load <8 x half>, ptr addrspace(3) %359, align 2
  %361 = mul i64 %166, 132
  %362 = add i64 %361, %23
  %363 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %362
  %364 = load <16 x half>, ptr addrspace(3) %363, align 2
  %365 = mul i64 %166, 132
  %366 = add i64 %365, %168
  %367 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %366
  %368 = load <16 x half>, ptr addrspace(3) %367, align 2
  %369 = mul i64 %170, 132
  %370 = add i64 %369, %23
  %371 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %370
  %372 = load <16 x half>, ptr addrspace(3) %371, align 2
  %373 = mul i64 %170, 132
  %374 = add i64 %373, %168
  %375 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i64 %374
  %376 = load <16 x half>, ptr addrspace(3) %375, align 2
  %377 = extractvalue [1 x [2 x [2 x <1 x float>]]] %173, 0, 0, 0
  %378 = extractelement <1 x float> %377, i64 0
  %379 = insertelement <2 x float> poison, float %378, i64 0
  %380 = extractvalue [1 x [2 x [2 x <1 x float>]]] %173, 0, 0, 1
  %381 = extractelement <1 x float> %380, i64 0
  %382 = insertelement <2 x float> %379, float %381, i64 1
  %383 = shufflevector <2 x float> %382, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %384 = shufflevector <8 x half> %356, <8 x half> %356, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %385 = shufflevector <16 x half> %364, <16 x half> %364, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %386 = bitcast <4 x i8> %61 to i32
  %387 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %384, <8 x half> %385, <4 x float> %383, i32 %386, i32 0, i32 0)
  %388 = shufflevector <8 x half> %356, <8 x half> %356, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %389 = shufflevector <16 x half> %364, <16 x half> %364, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %390 = bitcast <4 x i8> %61 to i32
  %391 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %388, <8 x half> %389, <4 x float> %387, i32 %390, i32 0, i32 0)
  %392 = shufflevector <4 x float> %391, <4 x float> %391, <2 x i32> <i32 0, i32 2>
  %393 = shufflevector <4 x float> %391, <4 x float> %391, <2 x i32> <i32 1, i32 3>
  %394 = fadd <2 x float> %392, %393
  %395 = extractvalue [1 x [2 x [2 x <1 x float>]]] %173, 0, 1, 0
  %396 = extractelement <1 x float> %395, i64 0
  %397 = insertelement <2 x float> poison, float %396, i64 0
  %398 = extractvalue [1 x [2 x [2 x <1 x float>]]] %173, 0, 1, 1
  %399 = extractelement <1 x float> %398, i64 0
  %400 = insertelement <2 x float> %397, float %399, i64 1
  %401 = shufflevector <2 x float> %400, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %402 = shufflevector <16 x half> %372, <16 x half> %372, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %403 = bitcast <4 x i8> %61 to i32
  %404 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %384, <8 x half> %402, <4 x float> %401, i32 %403, i32 0, i32 0)
  %405 = shufflevector <16 x half> %372, <16 x half> %372, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %406 = bitcast <4 x i8> %61 to i32
  %407 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %388, <8 x half> %405, <4 x float> %404, i32 %406, i32 0, i32 0)
  %408 = shufflevector <4 x float> %407, <4 x float> %407, <2 x i32> <i32 0, i32 2>
  %409 = shufflevector <4 x float> %407, <4 x float> %407, <2 x i32> <i32 1, i32 3>
  %410 = fadd <2 x float> %408, %409
  %411 = shufflevector <2 x float> %394, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %412 = shufflevector <8 x half> %360, <8 x half> %360, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %413 = shufflevector <16 x half> %368, <16 x half> %368, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %414 = bitcast <4 x i8> %61 to i32
  %415 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %412, <8 x half> %413, <4 x float> %411, i32 %414, i32 0, i32 0)
  %416 = shufflevector <8 x half> %360, <8 x half> %360, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %417 = shufflevector <16 x half> %368, <16 x half> %368, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %418 = bitcast <4 x i8> %61 to i32
  %419 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %416, <8 x half> %417, <4 x float> %415, i32 %418, i32 0, i32 0)
  %420 = shufflevector <4 x float> %419, <4 x float> %419, <2 x i32> <i32 0, i32 2>
  %421 = shufflevector <4 x float> %419, <4 x float> %419, <2 x i32> <i32 1, i32 3>
  %422 = fadd <2 x float> %420, %421
  %423 = shufflevector <2 x float> %410, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %424 = shufflevector <16 x half> %376, <16 x half> %376, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %425 = bitcast <4 x i8> %61 to i32
  %426 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %412, <8 x half> %424, <4 x float> %423, i32 %425, i32 0, i32 0)
  %427 = shufflevector <16 x half> %376, <16 x half> %376, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %428 = bitcast <4 x i8> %61 to i32
  %429 = call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %416, <8 x half> %427, <4 x float> %426, i32 %428, i32 0, i32 0)
  %430 = shufflevector <4 x float> %429, <4 x float> %429, <2 x i32> <i32 0, i32 2>
  %431 = shufflevector <4 x float> %429, <4 x float> %429, <2 x i32> <i32 1, i32 3>
  %432 = fadd <2 x float> %430, %431
  %433 = extractelement <2 x float> %422, i64 0
  %434 = insertelement <1 x float> poison, float %433, i64 0
  %435 = extractelement <2 x float> %422, i64 1
  %436 = insertelement <1 x float> poison, float %435, i64 0
  %437 = extractelement <2 x float> %432, i64 0
  %438 = insertelement <1 x float> poison, float %437, i64 0
  %439 = extractelement <2 x float> %432, i64 1
  %440 = insertelement <1 x float> poison, float %439, i64 0
  %441 = mul nsw i32 %84, 4
  %442 = add i32 %163, %441
  %443 = mul nsw i32 %442, 16
  %444 = add nsw i32 %443, %13
  %445 = zext i32 %444 to i64
  %446 = mul i64 %15, 6656
  %447 = add i64 %446, %445
  %448 = getelementptr float, ptr addrspace(7) %8, i64 %447
  store <1 x float> %434, ptr addrspace(7) %448, align 4
  %449 = add nsw i32 %444, 16
  %450 = zext i32 %449 to i64
  %451 = mul i64 %15, 6656
  %452 = add i64 %451, %450
  %453 = getelementptr float, ptr addrspace(7) %8, i64 %452
  store <1 x float> %438, ptr addrspace(7) %453, align 4
  %454 = add nsw i32 %14, 1
  %455 = zext i32 %454 to i64
  %456 = mul i64 %455, 6656
  %457 = add i64 %456, %445
  %458 = getelementptr float, ptr addrspace(7) %8, i64 %457
  store <1 x float> %436, ptr addrspace(7) %458, align 4
  %459 = mul i64 %455, 6656
  %460 = add i64 %459, %450
  %461 = getelementptr float, ptr addrspace(7) %8, i64 %460
  store <1 x float> %440, ptr addrspace(7) %461, align 4
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
