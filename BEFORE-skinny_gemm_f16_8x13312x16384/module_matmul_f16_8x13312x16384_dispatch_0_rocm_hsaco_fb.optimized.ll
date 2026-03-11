; To reproduce the .optimized.ll from the .linked.ll, run:
; opt -S -mtriple=amdgcn-amd-amdhsa -mcpu=gfx942 --passes='verify,memprof-remove-attributes,annotation2metadata,forceattrs,inferattrs,coro-early,function<eager-inv>(ee-instrument<>,lower-expect,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;no-switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,sroa<modify-cfg>,early-cse<>),openmp-opt,amdgpu-printf-runtime-binding,ipsccp,called-value-propagation,globalopt,function<eager-inv>(mem2reg,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>),always-inline,require<globals-aa>,function(invalidate<aa>),require<profile-summary>,cgscc(devirt<4>(inline,function-attrs<skip-non-recursive-function-attrs>,openmp-opt-cgscc,function(amdgpu-promote-kernel-arguments,infer-address-spaces,amdgpu-lower-kernel-attributes,amdgpu-promote-alloca-to-vector),function<eager-inv;no-rerun>(sroa<modify-cfg>,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jump-threading,correlated-propagation,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,aggressive-instcombine,libcalls-shrinkwrap,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassociate,constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,licm<no-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,licm<allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-deletion,loop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split-footer-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,jump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init,loop-mssa(licm<allowspeculation>),coro-elide,infer-address-spaces,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;no-switch-to-lookup;keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine),function-attrs,function(require<should-not-run-function-passes>),coro-split,coro-annotation-elide)),deadargelim,coro-cleanup,globalopt,globaldce,elim-avail-extern,rpo-function-attrs,recompute-globalsaa,function<eager-inv>(drop-unnecessary-assumes,float2int,lower-constant-intrinsics,loop(loop-rotate<header-duplication;no-prepare-for-lto>,loop-deletion),loop-distribute,inject-tli-mappings,loop-vectorize<no-interleave-forced-only;no-vectorize-forced-only;>,drop-unnecessary-assumes,infer-alignment,loop-load-elim,instcombine<max-iterations=1;no-verify-fixpoint>,simplifycfg<bonus-inst-threshold=1;forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;switch-to-lookup;no-keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,slp-vectorizer,vector-combine,instcombine<max-iterations=1;no-verify-fixpoint>,loop-unroll<O2>,transform-warning,sroa<preserve-cfg>,infer-alignment,instcombine<max-iterations=1;no-verify-fixpoint>,loop-mssa(licm<allowspeculation>),alignment-from-assumptions,infer-address-spaces,loop-sink,instsimplify,div-rem-pairs,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;speculate-unpredictables>),alloc-token,amdgpu-attributor,globaldce,constmerge,cg-profile,rel-lookup-table-converter,function(annotation-remarks),verify' <.linked.ll>
; The flag '-S' is to emit LLVMIR.
; The behavior of some passes depends on '-mtriple' and '-mcpu'.

; ModuleID = 'matmul_f16_8x13312x16384_dispatch_0'
source_filename = "matmul_f16_8x13312x16384_dispatch_0"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"

@__shared_memory___0 = private unnamed_addr addrspace(3) global [64 x [132 x half]] undef, align 16
@__shared_memory__ = private unnamed_addr addrspace(3) global [8 x [132 x half]] undef, align 16

; Function Attrs: alwaysinline nofree norecurse nounwind
define amdgpu_kernel void @matmul_f16_8x13312x16384_dispatch_0_matmul_like_8x13312x16384_f16xf16xf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 captures(none) %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 captures(none) %1, ptr addrspace(1) inreg noalias noundef nonnull writeonly align 16 captures(none) %2) local_unnamed_addr #0 !reqd_work_group_size !2 {
  %4 = tail call range(i32 0, 128) i32 @llvm.amdgcn.workitem.id.x()
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %5 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %0, i16 0, i64 262144, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %6 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %1, i16 0, i64 436207616, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  %7 = lshr i32 %4, 4
  %8 = and i32 %7, 3
  %9 = and i32 %4, 15
  %10 = lshr i32 %9, 1
  %11 = shl nuw nsw i32 %8, 4
  %12 = shl nuw nsw i32 %4, 3
  %13 = and i32 %12, 8
  %14 = or disjoint i32 %11, %13
  %15 = or disjoint i32 %7, 8
  %16 = or disjoint i32 %7, 16
  %17 = or disjoint i32 %7, 24
  %18 = or disjoint i32 %7, 32
  %19 = or disjoint i32 %7, 40
  %20 = or disjoint i32 %7, 48
  %21 = or disjoint i32 %7, 56
  %22 = tail call noundef range(i32 0, 32) i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %23 = tail call noundef range(i32 0, 64) i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %22)
  %24 = and i32 %23, 1
  %.not = icmp eq i32 %24, 0
  %25 = select i1 %.not, <4 x i8> <i8 68, i8 0, i8 0, i8 0>, <4 x i8> <i8 -18, i8 0, i8 0, i8 0>
  %26 = and i32 %12, 120
  %27 = tail call range(i32 0, 208) i32 @llvm.amdgcn.workgroup.id.x()
  %28 = shl nuw nsw i32 %7, 14
  %29 = getelementptr half, ptr addrspace(7) %5, i32 %26
  %30 = getelementptr half, ptr addrspace(7) %29, i32 %28
  %31 = load <8 x half>, ptr addrspace(7) %30, align 2
  %32 = shl nuw nsw i32 %27, 6
  %33 = or disjoint i32 %7, %32
  %.idx26 = shl nuw nsw i32 %33, 15
  %34 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx26
  %35 = getelementptr half, ptr addrspace(7) %34, i32 %26
  %36 = load <8 x half>, ptr addrspace(7) %35, align 2
  %37 = or disjoint i32 %15, %32
  %.idx27 = shl nuw nsw i32 %37, 15
  %38 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx27
  %39 = getelementptr half, ptr addrspace(7) %38, i32 %26
  %40 = load <8 x half>, ptr addrspace(7) %39, align 2
  %41 = or disjoint i32 %16, %32
  %.idx28 = shl nuw nsw i32 %41, 15
  %42 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx28
  %43 = getelementptr half, ptr addrspace(7) %42, i32 %26
  %44 = load <8 x half>, ptr addrspace(7) %43, align 2
  %45 = or disjoint i32 %17, %32
  %.idx29 = shl nuw nsw i32 %45, 15
  %46 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx29
  %47 = getelementptr half, ptr addrspace(7) %46, i32 %26
  %48 = load <8 x half>, ptr addrspace(7) %47, align 2
  %49 = or disjoint i32 %18, %32
  %.idx30 = shl nuw nsw i32 %49, 15
  %50 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx30
  %51 = getelementptr half, ptr addrspace(7) %50, i32 %26
  %52 = load <8 x half>, ptr addrspace(7) %51, align 2
  %53 = or disjoint i32 %19, %32
  %.idx31 = shl nuw nsw i32 %53, 15
  %54 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx31
  %55 = getelementptr half, ptr addrspace(7) %54, i32 %26
  %56 = load <8 x half>, ptr addrspace(7) %55, align 2
  %57 = or disjoint i32 %20, %32
  %.idx32 = shl nuw nsw i32 %57, 15
  %58 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx32
  %59 = getelementptr half, ptr addrspace(7) %58, i32 %26
  %60 = load <8 x half>, ptr addrspace(7) %59, align 2
  %61 = or disjoint i32 %21, %32
  %.idx33 = shl nuw nsw i32 %61, 15
  %62 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx33
  %63 = getelementptr half, ptr addrspace(7) %62, i32 %26
  %64 = load <8 x half>, ptr addrspace(7) %63, align 2
  %narrow34 = mul nuw nsw i32 %7, 132
  %narrow35 = add nuw nsw i32 %narrow34, %26
  %65 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %narrow35
  store <8 x half> %31, ptr addrspace(3) %65, align 8
  %66 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %narrow35
  store <8 x half> %36, ptr addrspace(3) %66, align 8
  %.idx = mul nuw nsw i32 %15, 264
  %67 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %.idx
  %68 = getelementptr half, ptr addrspace(3) %67, i32 %26
  store <8 x half> %40, ptr addrspace(3) %68, align 8
  %.idx3 = mul nuw nsw i32 %16, 264
  %69 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %.idx3
  %70 = getelementptr half, ptr addrspace(3) %69, i32 %26
  store <8 x half> %44, ptr addrspace(3) %70, align 8
  %.idx5 = mul nuw nsw i32 %17, 264
  %71 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %.idx5
  %72 = getelementptr half, ptr addrspace(3) %71, i32 %26
  store <8 x half> %48, ptr addrspace(3) %72, align 8
  %.idx7 = mul nuw nsw i32 %18, 264
  %73 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %.idx7
  %74 = getelementptr half, ptr addrspace(3) %73, i32 %26
  store <8 x half> %52, ptr addrspace(3) %74, align 8
  %.idx9 = mul nuw nsw i32 %19, 264
  %75 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %.idx9
  %76 = getelementptr half, ptr addrspace(3) %75, i32 %26
  store <8 x half> %56, ptr addrspace(3) %76, align 8
  %.idx11 = mul nuw nsw i32 %20, 264
  %77 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %.idx11
  %78 = getelementptr half, ptr addrspace(3) %77, i32 %26
  store <8 x half> %60, ptr addrspace(3) %78, align 8
  %.idx13 = mul nuw nsw i32 %21, 264
  %79 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %.idx13
  %80 = getelementptr half, ptr addrspace(3) %79, i32 %26
  store <8 x half> %64, ptr addrspace(3) %80, align 8
  %81 = lshr i32 %4, 1
  %82 = and i32 %81, 32
  %83 = or disjoint i32 %82, %9
  %invariant.gep = getelementptr half, ptr addrspace(7) %5, i32 %28
  %narrow36 = mul nuw nsw i32 %10, 132
  %84 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %14
  %85 = getelementptr half, ptr addrspace(3) %84, i32 %narrow36
  %86 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %14
  %87 = getelementptr i8, ptr addrspace(3) %86, i32 128
  %88 = getelementptr half, ptr addrspace(3) %87, i32 %narrow36
  %narrow37 = mul nuw nsw i32 %83, 132
  %89 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %11
  %90 = getelementptr half, ptr addrspace(3) %89, i32 %narrow37
  %91 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %11
  %92 = getelementptr i8, ptr addrspace(3) %91, i32 128
  %93 = getelementptr half, ptr addrspace(3) %92, i32 %narrow37
  %94 = mul nuw nsw i32 %83, 132
  %narrow38 = add nuw nsw i32 %94, 2112
  %95 = getelementptr half, ptr addrspace(3) %89, i32 %narrow38
  %96 = getelementptr half, ptr addrspace(3) %92, i32 %narrow38
  %97 = bitcast <4 x i8> %25 to i32
  br label %98

98:                                               ; preds = %3, %98
  %99 = phi [1 x [2 x [2 x <1 x float>]]] [ zeroinitializer, %3 ], [ %179, %98 ]
  %100 = phi i32 [ 0, %3 ], [ %101, %98 ]
  %101 = add nuw nsw i32 %100, 2
  %102 = shl nuw nsw i32 %101, 6
  %103 = or disjoint i32 %102, %26
  %gep = getelementptr half, ptr addrspace(7) %invariant.gep, i32 %103
  %104 = load <8 x half>, ptr addrspace(7) %gep, align 2
  %105 = getelementptr half, ptr addrspace(7) %34, i32 %103
  %106 = load <8 x half>, ptr addrspace(7) %105, align 2
  %107 = getelementptr half, ptr addrspace(7) %39, i32 %102
  %108 = load <8 x half>, ptr addrspace(7) %107, align 2
  %109 = getelementptr half, ptr addrspace(7) %43, i32 %102
  %110 = load <8 x half>, ptr addrspace(7) %109, align 2
  %111 = getelementptr half, ptr addrspace(7) %47, i32 %102
  %112 = load <8 x half>, ptr addrspace(7) %111, align 2
  %113 = getelementptr half, ptr addrspace(7) %51, i32 %102
  %114 = load <8 x half>, ptr addrspace(7) %113, align 2
  %115 = getelementptr half, ptr addrspace(7) %55, i32 %102
  %116 = load <8 x half>, ptr addrspace(7) %115, align 2
  %117 = getelementptr half, ptr addrspace(7) %59, i32 %102
  %118 = load <8 x half>, ptr addrspace(7) %117, align 2
  %119 = getelementptr half, ptr addrspace(7) %63, i32 %102
  %120 = load <8 x half>, ptr addrspace(7) %119, align 2
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %121 = load <8 x half>, ptr addrspace(3) %85, align 8
  %122 = load <8 x half>, ptr addrspace(3) %88, align 8
  %123 = load <16 x half>, ptr addrspace(3) %90, align 8
  %124 = load <16 x half>, ptr addrspace(3) %93, align 8
  %125 = load <16 x half>, ptr addrspace(3) %95, align 8
  %126 = load <16 x half>, ptr addrspace(3) %96, align 8
  %127 = extractvalue [1 x [2 x [2 x <1 x float>]]] %99, 0, 0, 0
  %128 = extractvalue [1 x [2 x [2 x <1 x float>]]] %99, 0, 0, 1
  %129 = shufflevector <1 x float> %127, <1 x float> %128, <2 x i32> <i32 0, i32 1>
  %130 = shufflevector <2 x float> %129, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %131 = shufflevector <8 x half> %121, <8 x half> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %132 = shufflevector <16 x half> %123, <16 x half> poison, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %133 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %131, <8 x half> %132, <4 x float> %130, i32 %97, i32 0, i32 0)
  %134 = shufflevector <8 x half> %121, <8 x half> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %135 = shufflevector <16 x half> %123, <16 x half> poison, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %136 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %134, <8 x half> %135, <4 x float> %133, i32 %97, i32 0, i32 0)
  %137 = shufflevector <4 x float> %136, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %138 = shufflevector <4 x float> %136, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %139 = fadd <2 x float> %137, %138
  %140 = extractvalue [1 x [2 x [2 x <1 x float>]]] %99, 0, 1, 0
  %141 = extractvalue [1 x [2 x [2 x <1 x float>]]] %99, 0, 1, 1
  %142 = shufflevector <1 x float> %140, <1 x float> %141, <2 x i32> <i32 0, i32 1>
  %143 = shufflevector <2 x float> %142, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %144 = shufflevector <16 x half> %125, <16 x half> poison, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %145 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %131, <8 x half> %144, <4 x float> %143, i32 %97, i32 0, i32 0)
  %146 = shufflevector <16 x half> %125, <16 x half> poison, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %147 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %134, <8 x half> %146, <4 x float> %145, i32 %97, i32 0, i32 0)
  %148 = shufflevector <4 x float> %147, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %149 = shufflevector <4 x float> %147, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %150 = fadd <2 x float> %148, %149
  %151 = shufflevector <2 x float> %139, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %152 = shufflevector <8 x half> %122, <8 x half> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %153 = shufflevector <16 x half> %124, <16 x half> poison, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %154 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %152, <8 x half> %153, <4 x float> %151, i32 %97, i32 0, i32 0)
  %155 = shufflevector <8 x half> %122, <8 x half> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %156 = shufflevector <16 x half> %124, <16 x half> poison, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %157 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %155, <8 x half> %156, <4 x float> %154, i32 %97, i32 0, i32 0)
  %158 = shufflevector <4 x float> %157, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %159 = shufflevector <4 x float> %157, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %160 = fadd <2 x float> %158, %159
  %161 = shufflevector <2 x float> %150, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %162 = shufflevector <16 x half> %126, <16 x half> poison, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %163 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %152, <8 x half> %162, <4 x float> %161, i32 %97, i32 0, i32 0)
  %164 = shufflevector <16 x half> %126, <16 x half> poison, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %165 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %155, <8 x half> %164, <4 x float> %163, i32 %97, i32 0, i32 0)
  %166 = shufflevector <4 x float> %165, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %167 = shufflevector <4 x float> %165, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %168 = fadd <2 x float> %166, %167
  %169 = shufflevector <2 x float> %160, <2 x float> poison, <1 x i32> zeroinitializer
  %170 = insertvalue [2 x <1 x float>] poison, <1 x float> %169, 0
  %171 = shufflevector <2 x float> %160, <2 x float> poison, <1 x i32> <i32 1>
  %172 = insertvalue [2 x <1 x float>] %170, <1 x float> %171, 1
  %173 = insertvalue [2 x [2 x <1 x float>]] zeroinitializer, [2 x <1 x float>] %172, 0
  %174 = shufflevector <2 x float> %168, <2 x float> poison, <1 x i32> zeroinitializer
  %175 = insertvalue [2 x <1 x float>] poison, <1 x float> %174, 0
  %176 = shufflevector <2 x float> %168, <2 x float> poison, <1 x i32> <i32 1>
  %177 = insertvalue [2 x <1 x float>] %175, <1 x float> %176, 1
  %178 = insertvalue [2 x [2 x <1 x float>]] %173, [2 x <1 x float>] %177, 1
  %179 = insertvalue [1 x [2 x [2 x <1 x float>]]] poison, [2 x [2 x <1 x float>]] %178, 0
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  tail call void @llvm.amdgcn.sched.barrier(i32 0)
  store <8 x half> %104, ptr addrspace(3) %65, align 8
  store <8 x half> %106, ptr addrspace(3) %66, align 8
  store <8 x half> %108, ptr addrspace(3) %68, align 8
  store <8 x half> %110, ptr addrspace(3) %70, align 8
  store <8 x half> %112, ptr addrspace(3) %72, align 8
  store <8 x half> %114, ptr addrspace(3) %74, align 8
  store <8 x half> %116, ptr addrspace(3) %76, align 8
  store <8 x half> %118, ptr addrspace(3) %78, align 8
  store <8 x half> %120, ptr addrspace(3) %80, align 8
  %180 = icmp samesign ult i32 %100, 252
  br i1 %180, label %98, label %181

181:                                              ; preds = %98
  %182 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %2, i16 0, i64 425984, i32 159744)
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %183 = load <8 x half>, ptr addrspace(3) %85, align 8
  %184 = load <8 x half>, ptr addrspace(3) %88, align 8
  %185 = load <16 x half>, ptr addrspace(3) %90, align 8
  %186 = load <16 x half>, ptr addrspace(3) %93, align 8
  %187 = load <16 x half>, ptr addrspace(3) %95, align 8
  %188 = load <16 x half>, ptr addrspace(3) %96, align 8
  %189 = shufflevector <2 x float> %160, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %190 = shufflevector <8 x half> %183, <8 x half> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %191 = shufflevector <16 x half> %185, <16 x half> poison, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %192 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %190, <8 x half> %191, <4 x float> %189, i32 %97, i32 0, i32 0)
  %193 = shufflevector <8 x half> %183, <8 x half> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %194 = shufflevector <16 x half> %185, <16 x half> poison, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %195 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %193, <8 x half> %194, <4 x float> %192, i32 %97, i32 0, i32 0)
  %196 = shufflevector <4 x float> %195, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %197 = shufflevector <4 x float> %195, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %198 = fadd <2 x float> %196, %197
  %199 = shufflevector <2 x float> %168, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %200 = shufflevector <16 x half> %187, <16 x half> poison, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %201 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %190, <8 x half> %200, <4 x float> %199, i32 %97, i32 0, i32 0)
  %202 = shufflevector <16 x half> %187, <16 x half> poison, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %203 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %193, <8 x half> %202, <4 x float> %201, i32 %97, i32 0, i32 0)
  %204 = shufflevector <4 x float> %203, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %205 = shufflevector <4 x float> %203, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %206 = fadd <2 x float> %204, %205
  %207 = shufflevector <2 x float> %198, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %208 = shufflevector <8 x half> %184, <8 x half> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %209 = shufflevector <16 x half> %186, <16 x half> poison, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %210 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %208, <8 x half> %209, <4 x float> %207, i32 %97, i32 0, i32 0)
  %211 = shufflevector <8 x half> %184, <8 x half> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %212 = shufflevector <16 x half> %186, <16 x half> poison, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %213 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %211, <8 x half> %212, <4 x float> %210, i32 %97, i32 0, i32 0)
  %214 = shufflevector <4 x float> %213, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %215 = shufflevector <4 x float> %213, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %216 = fadd <2 x float> %214, %215
  %217 = shufflevector <2 x float> %206, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %218 = shufflevector <16 x half> %188, <16 x half> poison, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %219 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %208, <8 x half> %218, <4 x float> %217, i32 %97, i32 0, i32 0)
  %220 = shufflevector <16 x half> %188, <16 x half> poison, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %221 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %211, <8 x half> %220, <4 x float> %219, i32 %97, i32 0, i32 0)
  %222 = shufflevector <4 x float> %221, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %223 = shufflevector <4 x float> %221, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %224 = fadd <2 x float> %222, %223
  %225 = shufflevector <2 x float> %216, <2 x float> poison, <1 x i32> zeroinitializer
  %226 = shufflevector <2 x float> %216, <2 x float> poison, <1 x i32> <i32 1>
  %227 = shufflevector <2 x float> %224, <2 x float> poison, <1 x i32> zeroinitializer
  %228 = shufflevector <2 x float> %224, <2 x float> poison, <1 x i32> <i32 1>
  %229 = or disjoint i32 %83, %32
  %.idx40 = mul nuw nsw i32 %8, 106496
  %230 = getelementptr i8, ptr addrspace(7) %182, i32 %.idx40
  %231 = getelementptr float, ptr addrspace(7) %230, i32 %229
  store <1 x float> %225, ptr addrspace(7) %231, align 4
  %232 = or disjoint i32 %229, 16
  %233 = getelementptr float, ptr addrspace(7) %230, i32 %232
  store <1 x float> %227, ptr addrspace(7) %233, align 4
  %234 = getelementptr i8, ptr addrspace(7) %230, i32 53248
  %235 = getelementptr float, ptr addrspace(7) %234, i32 %229
  store <1 x float> %226, ptr addrspace(7) %235, align 4
  %236 = getelementptr float, ptr addrspace(7) %234, i32 %232
  store <1 x float> %228, ptr addrspace(7) %236, align 4
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  ret void
}

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

; Function Attrs: alwaysinline mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) readnone, i16, i64, i32) #3

; Function Attrs: alwaysinline mustprogress nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #4

; Function Attrs: alwaysinline mustprogress nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #4

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: alwaysinline convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #5

; Function Attrs: alwaysinline convergent mustprogress nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half>, <8 x half>, <4 x float>, i32, i32 immarg, i32 immarg) #6

; Function Attrs: alwaysinline convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.sched.barrier(i32 immarg) #5

attributes #0 = { alwaysinline nofree norecurse nounwind "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="128,128" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "uniform-work-group-size"="true" }
attributes #1 = { alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #3 = { alwaysinline mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { alwaysinline mustprogress nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none) }
attributes #5 = { alwaysinline convergent mustprogress nocallback nofree nounwind willreturn }
attributes #6 = { alwaysinline convergent mustprogress nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"amdhsa_code_object_version", i32 500}
!2 = !{i32 128, i32 1, i32 1}
!3 = !{!"amdgpu-synchronize-as", !"local"}
