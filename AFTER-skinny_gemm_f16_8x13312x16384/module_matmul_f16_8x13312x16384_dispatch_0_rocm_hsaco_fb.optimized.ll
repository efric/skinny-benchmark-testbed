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
  %99 = phi <4 x float> [ zeroinitializer, %3 ], [ %147, %98 ]
  %100 = phi <4 x float> [ zeroinitializer, %3 ], [ %143, %98 ]
  %101 = phi i32 [ 0, %3 ], [ %102, %98 ]
  %102 = add nuw nsw i32 %101, 2
  %103 = shl nuw nsw i32 %102, 6
  %104 = or disjoint i32 %103, %26
  %gep = getelementptr half, ptr addrspace(7) %invariant.gep, i32 %104
  %105 = load <8 x half>, ptr addrspace(7) %gep, align 2
  %106 = getelementptr half, ptr addrspace(7) %34, i32 %104
  %107 = load <8 x half>, ptr addrspace(7) %106, align 2
  %108 = getelementptr half, ptr addrspace(7) %39, i32 %103
  %109 = load <8 x half>, ptr addrspace(7) %108, align 2
  %110 = getelementptr half, ptr addrspace(7) %43, i32 %103
  %111 = load <8 x half>, ptr addrspace(7) %110, align 2
  %112 = getelementptr half, ptr addrspace(7) %47, i32 %103
  %113 = load <8 x half>, ptr addrspace(7) %112, align 2
  %114 = getelementptr half, ptr addrspace(7) %51, i32 %103
  %115 = load <8 x half>, ptr addrspace(7) %114, align 2
  %116 = getelementptr half, ptr addrspace(7) %55, i32 %103
  %117 = load <8 x half>, ptr addrspace(7) %116, align 2
  %118 = getelementptr half, ptr addrspace(7) %59, i32 %103
  %119 = load <8 x half>, ptr addrspace(7) %118, align 2
  %120 = getelementptr half, ptr addrspace(7) %63, i32 %103
  %121 = load <8 x half>, ptr addrspace(7) %120, align 2
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %122 = load <8 x half>, ptr addrspace(3) %85, align 8
  %123 = load <8 x half>, ptr addrspace(3) %88, align 8
  %124 = load <16 x half>, ptr addrspace(3) %90, align 8
  %125 = load <16 x half>, ptr addrspace(3) %93, align 8
  %126 = load <16 x half>, ptr addrspace(3) %95, align 8
  %127 = load <16 x half>, ptr addrspace(3) %96, align 8
  %128 = shufflevector <8 x half> %122, <8 x half> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %129 = shufflevector <16 x half> %124, <16 x half> poison, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %130 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %128, <8 x half> %129, <4 x float> %100, i32 %97, i32 0, i32 0)
  %131 = shufflevector <8 x half> %122, <8 x half> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %132 = shufflevector <16 x half> %124, <16 x half> poison, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %133 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %131, <8 x half> %132, <4 x float> %130, i32 %97, i32 0, i32 0)
  %134 = shufflevector <16 x half> %126, <16 x half> poison, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %135 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %128, <8 x half> %134, <4 x float> %99, i32 %97, i32 0, i32 0)
  %136 = shufflevector <16 x half> %126, <16 x half> poison, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %137 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %131, <8 x half> %136, <4 x float> %135, i32 %97, i32 0, i32 0)
  %138 = shufflevector <8 x half> %123, <8 x half> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %139 = shufflevector <16 x half> %125, <16 x half> poison, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %140 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %138, <8 x half> %139, <4 x float> %133, i32 %97, i32 0, i32 0)
  %141 = shufflevector <8 x half> %123, <8 x half> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %142 = shufflevector <16 x half> %125, <16 x half> poison, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %143 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %141, <8 x half> %142, <4 x float> %140, i32 %97, i32 0, i32 0)
  %144 = shufflevector <16 x half> %127, <16 x half> poison, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %145 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %138, <8 x half> %144, <4 x float> %137, i32 %97, i32 0, i32 0)
  %146 = shufflevector <16 x half> %127, <16 x half> poison, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %147 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %141, <8 x half> %146, <4 x float> %145, i32 %97, i32 0, i32 0)
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  tail call void @llvm.amdgcn.sched.barrier(i32 0)
  store <8 x half> %105, ptr addrspace(3) %65, align 8
  store <8 x half> %107, ptr addrspace(3) %66, align 8
  store <8 x half> %109, ptr addrspace(3) %68, align 8
  store <8 x half> %111, ptr addrspace(3) %70, align 8
  store <8 x half> %113, ptr addrspace(3) %72, align 8
  store <8 x half> %115, ptr addrspace(3) %74, align 8
  store <8 x half> %117, ptr addrspace(3) %76, align 8
  store <8 x half> %119, ptr addrspace(3) %78, align 8
  store <8 x half> %121, ptr addrspace(3) %80, align 8
  %148 = icmp samesign ult i32 %101, 252
  br i1 %148, label %98, label %149

149:                                              ; preds = %98
  %150 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %2, i16 0, i64 425984, i32 159744)
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %151 = load <8 x half>, ptr addrspace(3) %85, align 8
  %152 = load <8 x half>, ptr addrspace(3) %88, align 8
  %153 = load <16 x half>, ptr addrspace(3) %90, align 8
  %154 = load <16 x half>, ptr addrspace(3) %93, align 8
  %155 = load <16 x half>, ptr addrspace(3) %95, align 8
  %156 = load <16 x half>, ptr addrspace(3) %96, align 8
  %157 = shufflevector <8 x half> %151, <8 x half> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %158 = shufflevector <16 x half> %153, <16 x half> poison, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %159 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %157, <8 x half> %158, <4 x float> %143, i32 %97, i32 0, i32 0)
  %160 = shufflevector <8 x half> %151, <8 x half> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %161 = shufflevector <16 x half> %153, <16 x half> poison, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %162 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %160, <8 x half> %161, <4 x float> %159, i32 %97, i32 0, i32 0)
  %163 = shufflevector <16 x half> %155, <16 x half> poison, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %164 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %157, <8 x half> %163, <4 x float> %147, i32 %97, i32 0, i32 0)
  %165 = shufflevector <16 x half> %155, <16 x half> poison, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %166 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %160, <8 x half> %165, <4 x float> %164, i32 %97, i32 0, i32 0)
  %167 = shufflevector <8 x half> %152, <8 x half> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %168 = shufflevector <16 x half> %154, <16 x half> poison, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %169 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %167, <8 x half> %168, <4 x float> %162, i32 %97, i32 0, i32 0)
  %170 = shufflevector <8 x half> %152, <8 x half> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %171 = shufflevector <16 x half> %154, <16 x half> poison, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %172 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %170, <8 x half> %171, <4 x float> %169, i32 %97, i32 0, i32 0)
  %173 = shufflevector <16 x half> %156, <16 x half> poison, <8 x i32> <i32 0, i32 1, i32 8, i32 9, i32 2, i32 3, i32 10, i32 11>
  %174 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %167, <8 x half> %173, <4 x float> %166, i32 %97, i32 0, i32 0)
  %175 = shufflevector <16 x half> %156, <16 x half> poison, <8 x i32> <i32 4, i32 5, i32 12, i32 13, i32 6, i32 7, i32 14, i32 15>
  %176 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x32.f16(<4 x half> %170, <8 x half> %175, <4 x float> %174, i32 %97, i32 0, i32 0)
  %177 = shufflevector <4 x float> %172, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %178 = shufflevector <4 x float> %172, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %179 = fadd <2 x float> %177, %178
  %180 = shufflevector <2 x float> %179, <2 x float> poison, <1 x i32> zeroinitializer
  %181 = shufflevector <2 x float> %179, <2 x float> poison, <1 x i32> <i32 1>
  %182 = shufflevector <4 x float> %176, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %183 = shufflevector <4 x float> %176, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %184 = fadd <2 x float> %182, %183
  %185 = shufflevector <2 x float> %184, <2 x float> poison, <1 x i32> zeroinitializer
  %186 = shufflevector <2 x float> %184, <2 x float> poison, <1 x i32> <i32 1>
  %187 = or disjoint i32 %83, %32
  %.idx41 = mul nuw nsw i32 %8, 106496
  %188 = getelementptr i8, ptr addrspace(7) %150, i32 %.idx41
  %189 = getelementptr float, ptr addrspace(7) %188, i32 %187
  store <1 x float> %180, ptr addrspace(7) %189, align 4
  %190 = or disjoint i32 %187, 16
  %191 = getelementptr float, ptr addrspace(7) %188, i32 %190
  store <1 x float> %185, ptr addrspace(7) %191, align 4
  %192 = getelementptr i8, ptr addrspace(7) %188, i32 53248
  %193 = getelementptr float, ptr addrspace(7) %192, i32 %187
  store <1 x float> %181, ptr addrspace(7) %193, align 4
  %194 = getelementptr float, ptr addrspace(7) %192, i32 %190
  store <1 x float> %186, ptr addrspace(7) %194, align 4
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
