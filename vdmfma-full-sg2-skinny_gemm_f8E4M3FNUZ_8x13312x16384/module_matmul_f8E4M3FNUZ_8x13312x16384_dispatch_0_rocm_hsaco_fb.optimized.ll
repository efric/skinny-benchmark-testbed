; To reproduce the .optimized.ll from the .linked.ll, run:
; opt -S -mtriple=amdgcn-amd-amdhsa -mcpu=gfx942 --passes='verify,memprof-remove-attributes,annotation2metadata,forceattrs,inferattrs,coro-early,function<eager-inv>(ee-instrument<>,lower-expect,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;no-switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,sroa<modify-cfg>,early-cse<>),openmp-opt,amdgpu-printf-runtime-binding,ipsccp,called-value-propagation,globalopt,function<eager-inv>(mem2reg,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>),always-inline,require<globals-aa>,function(invalidate<aa>),require<profile-summary>,cgscc(devirt<4>(inline,function-attrs<skip-non-recursive-function-attrs>,openmp-opt-cgscc,function(amdgpu-promote-kernel-arguments,infer-address-spaces,amdgpu-lower-kernel-attributes,amdgpu-promote-alloca-to-vector),function<eager-inv;no-rerun>(sroa<modify-cfg>,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jump-threading,correlated-propagation,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,aggressive-instcombine,libcalls-shrinkwrap,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassociate,constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,licm<no-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,licm<allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-deletion,loop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split-footer-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,jump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init,loop-mssa(licm<allowspeculation>),coro-elide,infer-address-spaces,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;no-switch-to-lookup;keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine),function-attrs,function(require<should-not-run-function-passes>),coro-split,coro-annotation-elide)),deadargelim,coro-cleanup,globalopt,globaldce,elim-avail-extern,rpo-function-attrs,recompute-globalsaa,function<eager-inv>(drop-unnecessary-assumes,float2int,lower-constant-intrinsics,loop(loop-rotate<header-duplication;no-prepare-for-lto>,loop-deletion),loop-distribute,inject-tli-mappings,loop-vectorize<no-interleave-forced-only;no-vectorize-forced-only;>,drop-unnecessary-assumes,infer-alignment,loop-load-elim,instcombine<max-iterations=1;no-verify-fixpoint>,simplifycfg<bonus-inst-threshold=1;forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;switch-to-lookup;no-keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,slp-vectorizer,vector-combine,instcombine<max-iterations=1;no-verify-fixpoint>,loop-unroll<O2>,transform-warning,sroa<preserve-cfg>,infer-alignment,instcombine<max-iterations=1;no-verify-fixpoint>,loop-mssa(licm<allowspeculation>),alignment-from-assumptions,infer-address-spaces,loop-sink,instsimplify,div-rem-pairs,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;speculate-unpredictables>),alloc-token,amdgpu-attributor,globaldce,constmerge,cg-profile,rel-lookup-table-converter,function(annotation-remarks),verify' <.linked.ll>
; The flag '-S' is to emit LLVMIR.
; The behavior of some passes depends on '-mtriple' and '-mcpu'.

; ModuleID = 'matmul_f8E4M3FNUZ_8x13312x16384_dispatch_0'
source_filename = "matmul_f8E4M3FNUZ_8x13312x16384_dispatch_0"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"

@__shared_memory___0 = private unnamed_addr addrspace(3) global [64 x [264 x i8]] undef, align 16
@__shared_memory__ = private unnamed_addr addrspace(3) global [8 x [264 x i8]] undef, align 16

; Function Attrs: alwaysinline nofree norecurse nounwind
define amdgpu_kernel void @matmul_f8E4M3FNUZ_8x13312x16384_dispatch_0_matmul_like_8x13312x16384_f8E4M3FNUZxf8E4M3FNUZxf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 captures(none) %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 captures(none) %1, ptr addrspace(1) inreg noalias noundef nonnull writeonly align 16 captures(none) %2) local_unnamed_addr #0 !reqd_work_group_size !2 {
  %4 = tail call range(i32 0, 128) i32 @llvm.amdgcn.workitem.id.x()
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %5 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %0, i16 0, i64 131072, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %6 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %1, i16 0, i64 218103808, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  %7 = lshr i32 %4, 4
  %8 = and i32 %7, 3
  %9 = and i32 %4, 15
  %10 = lshr i32 %9, 1
  %11 = shl nuw nsw i32 %8, 5
  %12 = shl nuw nsw i32 %4, 4
  %13 = and i32 %12, 16
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
  %25 = select i1 %.not, <2 x i16> <i16 17476, i16 0>, <2 x i16> <i16 -4370, i16 0>
  %26 = and i32 %12, 240
  %27 = tail call range(i32 0, 208) i32 @llvm.amdgcn.workgroup.id.x()
  %28 = shl nuw nsw i32 %7, 14
  %29 = getelementptr i8, ptr addrspace(7) %5, i32 %26
  %30 = getelementptr i8, ptr addrspace(7) %29, i32 %28
  %31 = load <16 x i8>, ptr addrspace(7) %30, align 1
  %32 = shl nuw nsw i32 %27, 6
  %33 = or disjoint i32 %7, %32
  %34 = shl nuw nsw i32 %33, 14
  %35 = getelementptr i8, ptr addrspace(7) %6, i32 %34
  %36 = getelementptr i8, ptr addrspace(7) %35, i32 %26
  %37 = load <16 x i8>, ptr addrspace(7) %36, align 1
  %38 = or disjoint i32 %15, %32
  %39 = shl nuw nsw i32 %38, 14
  %40 = getelementptr i8, ptr addrspace(7) %6, i32 %39
  %41 = getelementptr i8, ptr addrspace(7) %40, i32 %26
  %42 = load <16 x i8>, ptr addrspace(7) %41, align 1
  %43 = or disjoint i32 %16, %32
  %44 = shl nuw nsw i32 %43, 14
  %45 = getelementptr i8, ptr addrspace(7) %6, i32 %44
  %46 = getelementptr i8, ptr addrspace(7) %45, i32 %26
  %47 = load <16 x i8>, ptr addrspace(7) %46, align 1
  %48 = or disjoint i32 %17, %32
  %49 = shl nuw nsw i32 %48, 14
  %50 = getelementptr i8, ptr addrspace(7) %6, i32 %49
  %51 = getelementptr i8, ptr addrspace(7) %50, i32 %26
  %52 = load <16 x i8>, ptr addrspace(7) %51, align 1
  %53 = or disjoint i32 %18, %32
  %54 = shl nuw nsw i32 %53, 14
  %55 = getelementptr i8, ptr addrspace(7) %6, i32 %54
  %56 = getelementptr i8, ptr addrspace(7) %55, i32 %26
  %57 = load <16 x i8>, ptr addrspace(7) %56, align 1
  %58 = or disjoint i32 %19, %32
  %59 = shl nuw nsw i32 %58, 14
  %60 = getelementptr i8, ptr addrspace(7) %6, i32 %59
  %61 = getelementptr i8, ptr addrspace(7) %60, i32 %26
  %62 = load <16 x i8>, ptr addrspace(7) %61, align 1
  %63 = or disjoint i32 %20, %32
  %64 = shl nuw nsw i32 %63, 14
  %65 = getelementptr i8, ptr addrspace(7) %6, i32 %64
  %66 = getelementptr i8, ptr addrspace(7) %65, i32 %26
  %67 = load <16 x i8>, ptr addrspace(7) %66, align 1
  %68 = or disjoint i32 %21, %32
  %69 = shl nuw nsw i32 %68, 14
  %70 = getelementptr i8, ptr addrspace(7) %6, i32 %69
  %71 = getelementptr i8, ptr addrspace(7) %70, i32 %26
  %72 = load <16 x i8>, ptr addrspace(7) %71, align 1
  %narrow27 = mul nuw nsw i32 %7, 264
  %narrow28 = add nuw nsw i32 %narrow27, %26
  %73 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %narrow28
  store <16 x i8> %31, ptr addrspace(3) %73, align 8
  %74 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow28
  store <16 x i8> %37, ptr addrspace(3) %74, align 8
  %narrow = mul nuw nsw i32 %15, 264
  %75 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow
  %76 = getelementptr i8, ptr addrspace(3) %75, i32 %26
  store <16 x i8> %42, ptr addrspace(3) %76, align 8
  %narrow2 = mul nuw nsw i32 %16, 264
  %77 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow2
  %78 = getelementptr i8, ptr addrspace(3) %77, i32 %26
  store <16 x i8> %47, ptr addrspace(3) %78, align 8
  %narrow4 = mul nuw nsw i32 %17, 264
  %79 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow4
  %80 = getelementptr i8, ptr addrspace(3) %79, i32 %26
  store <16 x i8> %52, ptr addrspace(3) %80, align 8
  %narrow6 = mul nuw nsw i32 %18, 264
  %81 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow6
  %82 = getelementptr i8, ptr addrspace(3) %81, i32 %26
  store <16 x i8> %57, ptr addrspace(3) %82, align 8
  %narrow8 = mul nuw nsw i32 %19, 264
  %83 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow8
  %84 = getelementptr i8, ptr addrspace(3) %83, i32 %26
  store <16 x i8> %62, ptr addrspace(3) %84, align 8
  %narrow10 = mul nuw nsw i32 %20, 264
  %85 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow10
  %86 = getelementptr i8, ptr addrspace(3) %85, i32 %26
  store <16 x i8> %67, ptr addrspace(3) %86, align 8
  %narrow12 = mul nuw nsw i32 %21, 264
  %87 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow12
  %88 = getelementptr i8, ptr addrspace(3) %87, i32 %26
  store <16 x i8> %72, ptr addrspace(3) %88, align 8
  %89 = lshr i32 %4, 1
  %90 = and i32 %89, 32
  %91 = or disjoint i32 %90, %9
  %invariant.gep = getelementptr i8, ptr addrspace(7) %5, i32 %28
  %narrow29 = mul nuw nsw i32 %10, 264
  %92 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %14
  %93 = getelementptr i8, ptr addrspace(3) %92, i32 %narrow29
  %94 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %14
  %95 = getelementptr i8, ptr addrspace(3) %94, i32 128
  %96 = getelementptr i8, ptr addrspace(3) %95, i32 %narrow29
  %narrow30 = mul nuw nsw i32 %91, 264
  %97 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %11
  %98 = getelementptr i8, ptr addrspace(3) %97, i32 %narrow30
  %99 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %11
  %100 = getelementptr i8, ptr addrspace(3) %99, i32 128
  %101 = getelementptr i8, ptr addrspace(3) %100, i32 %narrow30
  %102 = mul nuw nsw i32 %91, 264
  %narrow31 = add nuw nsw i32 %102, 4224
  %103 = getelementptr i8, ptr addrspace(3) %97, i32 %narrow31
  %104 = getelementptr i8, ptr addrspace(3) %100, i32 %narrow31
  %105 = bitcast <2 x i16> %25 to i32
  br label %106

106:                                              ; preds = %3, %106
  %107 = phi <4 x float> [ zeroinitializer, %3 ], [ %167, %106 ]
  %108 = phi <4 x float> [ zeroinitializer, %3 ], [ %161, %106 ]
  %109 = phi i32 [ 0, %3 ], [ %110, %106 ]
  %110 = add nuw nsw i32 %109, 2
  %111 = shl nuw nsw i32 %110, 7
  %112 = or disjoint i32 %111, %26
  %gep = getelementptr i8, ptr addrspace(7) %invariant.gep, i32 %112
  %113 = load <16 x i8>, ptr addrspace(7) %gep, align 1
  %114 = getelementptr i8, ptr addrspace(7) %35, i32 %112
  %115 = load <16 x i8>, ptr addrspace(7) %114, align 1
  %116 = getelementptr i8, ptr addrspace(7) %41, i32 %111
  %117 = load <16 x i8>, ptr addrspace(7) %116, align 1
  %118 = getelementptr i8, ptr addrspace(7) %46, i32 %111
  %119 = load <16 x i8>, ptr addrspace(7) %118, align 1
  %120 = getelementptr i8, ptr addrspace(7) %51, i32 %111
  %121 = load <16 x i8>, ptr addrspace(7) %120, align 1
  %122 = getelementptr i8, ptr addrspace(7) %56, i32 %111
  %123 = load <16 x i8>, ptr addrspace(7) %122, align 1
  %124 = getelementptr i8, ptr addrspace(7) %61, i32 %111
  %125 = load <16 x i8>, ptr addrspace(7) %124, align 1
  %126 = getelementptr i8, ptr addrspace(7) %66, i32 %111
  %127 = load <16 x i8>, ptr addrspace(7) %126, align 1
  %128 = getelementptr i8, ptr addrspace(7) %71, i32 %111
  %129 = load <16 x i8>, ptr addrspace(7) %128, align 1
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %130 = load <16 x i8>, ptr addrspace(3) %93, align 8
  %131 = load <16 x i8>, ptr addrspace(3) %96, align 8
  %132 = load <32 x i8>, ptr addrspace(3) %98, align 8
  %133 = load <32 x i8>, ptr addrspace(3) %101, align 8
  %134 = load <32 x i8>, ptr addrspace(3) %103, align 8
  %135 = load <32 x i8>, ptr addrspace(3) %104, align 8
  %136 = shufflevector <16 x i8> %130, <16 x i8> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %137 = shufflevector <32 x i8> %132, <32 x i8> poison, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %138 = bitcast <8 x i8> %136 to <2 x i32>
  %139 = bitcast <16 x i8> %137 to <4 x i32>
  %140 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %138, <4 x i32> %139, <4 x float> %108, i32 %105, i32 0, i32 0)
  %141 = shufflevector <16 x i8> %130, <16 x i8> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %142 = shufflevector <32 x i8> %132, <32 x i8> poison, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %143 = bitcast <8 x i8> %141 to <2 x i32>
  %144 = bitcast <16 x i8> %142 to <4 x i32>
  %145 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %143, <4 x i32> %144, <4 x float> %140, i32 %105, i32 0, i32 0)
  %146 = shufflevector <32 x i8> %134, <32 x i8> poison, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %147 = bitcast <16 x i8> %146 to <4 x i32>
  %148 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %138, <4 x i32> %147, <4 x float> %107, i32 %105, i32 0, i32 0)
  %149 = shufflevector <32 x i8> %134, <32 x i8> poison, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %150 = bitcast <16 x i8> %149 to <4 x i32>
  %151 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %143, <4 x i32> %150, <4 x float> %148, i32 %105, i32 0, i32 0)
  %152 = shufflevector <16 x i8> %131, <16 x i8> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %153 = shufflevector <32 x i8> %133, <32 x i8> poison, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %154 = bitcast <8 x i8> %152 to <2 x i32>
  %155 = bitcast <16 x i8> %153 to <4 x i32>
  %156 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %154, <4 x i32> %155, <4 x float> %145, i32 %105, i32 0, i32 0)
  %157 = shufflevector <16 x i8> %131, <16 x i8> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %158 = shufflevector <32 x i8> %133, <32 x i8> poison, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %159 = bitcast <8 x i8> %157 to <2 x i32>
  %160 = bitcast <16 x i8> %158 to <4 x i32>
  %161 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %159, <4 x i32> %160, <4 x float> %156, i32 %105, i32 0, i32 0)
  %162 = shufflevector <32 x i8> %135, <32 x i8> poison, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %163 = bitcast <16 x i8> %162 to <4 x i32>
  %164 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %154, <4 x i32> %163, <4 x float> %151, i32 %105, i32 0, i32 0)
  %165 = shufflevector <32 x i8> %135, <32 x i8> poison, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %166 = bitcast <16 x i8> %165 to <4 x i32>
  %167 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %159, <4 x i32> %166, <4 x float> %164, i32 %105, i32 0, i32 0)
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  tail call void @llvm.amdgcn.sched.barrier(i32 0)
  store <16 x i8> %113, ptr addrspace(3) %73, align 8
  store <16 x i8> %115, ptr addrspace(3) %74, align 8
  store <16 x i8> %117, ptr addrspace(3) %76, align 8
  store <16 x i8> %119, ptr addrspace(3) %78, align 8
  store <16 x i8> %121, ptr addrspace(3) %80, align 8
  store <16 x i8> %123, ptr addrspace(3) %82, align 8
  store <16 x i8> %125, ptr addrspace(3) %84, align 8
  store <16 x i8> %127, ptr addrspace(3) %86, align 8
  store <16 x i8> %129, ptr addrspace(3) %88, align 8
  %168 = icmp samesign ult i32 %109, 124
  br i1 %168, label %106, label %169

169:                                              ; preds = %106
  %170 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %2, i16 0, i64 425984, i32 159744)
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %171 = load <16 x i8>, ptr addrspace(3) %93, align 8
  %172 = load <16 x i8>, ptr addrspace(3) %96, align 8
  %173 = load <32 x i8>, ptr addrspace(3) %98, align 8
  %174 = load <32 x i8>, ptr addrspace(3) %101, align 8
  %175 = load <32 x i8>, ptr addrspace(3) %103, align 8
  %176 = load <32 x i8>, ptr addrspace(3) %104, align 8
  %177 = shufflevector <16 x i8> %171, <16 x i8> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %178 = shufflevector <32 x i8> %173, <32 x i8> poison, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %179 = bitcast <8 x i8> %177 to <2 x i32>
  %180 = bitcast <16 x i8> %178 to <4 x i32>
  %181 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %179, <4 x i32> %180, <4 x float> %161, i32 %105, i32 0, i32 0)
  %182 = shufflevector <16 x i8> %171, <16 x i8> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %183 = shufflevector <32 x i8> %173, <32 x i8> poison, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %184 = bitcast <8 x i8> %182 to <2 x i32>
  %185 = bitcast <16 x i8> %183 to <4 x i32>
  %186 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %184, <4 x i32> %185, <4 x float> %181, i32 %105, i32 0, i32 0)
  %187 = shufflevector <32 x i8> %175, <32 x i8> poison, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %188 = bitcast <16 x i8> %187 to <4 x i32>
  %189 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %179, <4 x i32> %188, <4 x float> %167, i32 %105, i32 0, i32 0)
  %190 = shufflevector <32 x i8> %175, <32 x i8> poison, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %191 = bitcast <16 x i8> %190 to <4 x i32>
  %192 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %184, <4 x i32> %191, <4 x float> %189, i32 %105, i32 0, i32 0)
  %193 = shufflevector <16 x i8> %172, <16 x i8> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %194 = shufflevector <32 x i8> %174, <32 x i8> poison, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %195 = bitcast <8 x i8> %193 to <2 x i32>
  %196 = bitcast <16 x i8> %194 to <4 x i32>
  %197 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %195, <4 x i32> %196, <4 x float> %186, i32 %105, i32 0, i32 0)
  %198 = shufflevector <16 x i8> %172, <16 x i8> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %199 = shufflevector <32 x i8> %174, <32 x i8> poison, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %200 = bitcast <8 x i8> %198 to <2 x i32>
  %201 = bitcast <16 x i8> %199 to <4 x i32>
  %202 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %200, <4 x i32> %201, <4 x float> %197, i32 %105, i32 0, i32 0)
  %203 = shufflevector <32 x i8> %176, <32 x i8> poison, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %204 = bitcast <16 x i8> %203 to <4 x i32>
  %205 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %195, <4 x i32> %204, <4 x float> %192, i32 %105, i32 0, i32 0)
  %206 = shufflevector <32 x i8> %176, <32 x i8> poison, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %207 = bitcast <16 x i8> %206 to <4 x i32>
  %208 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %200, <4 x i32> %207, <4 x float> %205, i32 %105, i32 0, i32 0)
  %209 = shufflevector <4 x float> %202, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %210 = shufflevector <4 x float> %202, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %211 = fadd <2 x float> %209, %210
  %212 = shufflevector <2 x float> %211, <2 x float> poison, <1 x i32> zeroinitializer
  %213 = shufflevector <2 x float> %211, <2 x float> poison, <1 x i32> <i32 1>
  %214 = shufflevector <4 x float> %208, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %215 = shufflevector <4 x float> %208, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %216 = fadd <2 x float> %214, %215
  %217 = shufflevector <2 x float> %216, <2 x float> poison, <1 x i32> zeroinitializer
  %218 = shufflevector <2 x float> %216, <2 x float> poison, <1 x i32> <i32 1>
  %219 = or disjoint i32 %91, %32
  %.idx = mul nuw nsw i32 %8, 106496
  %220 = getelementptr i8, ptr addrspace(7) %170, i32 %.idx
  %221 = getelementptr float, ptr addrspace(7) %220, i32 %219
  store <1 x float> %212, ptr addrspace(7) %221, align 4
  %222 = or disjoint i32 %219, 16
  %223 = getelementptr float, ptr addrspace(7) %220, i32 %222
  store <1 x float> %217, ptr addrspace(7) %223, align 4
  %224 = getelementptr i8, ptr addrspace(7) %220, i32 53248
  %225 = getelementptr float, ptr addrspace(7) %224, i32 %219
  store <1 x float> %213, ptr addrspace(7) %225, align 4
  %226 = getelementptr float, ptr addrspace(7) %224, i32 %222
  store <1 x float> %218, ptr addrspace(7) %226, align 4
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
declare <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32>, <4 x i32>, <4 x float>, i32, i32 immarg, i32 immarg) #6

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
