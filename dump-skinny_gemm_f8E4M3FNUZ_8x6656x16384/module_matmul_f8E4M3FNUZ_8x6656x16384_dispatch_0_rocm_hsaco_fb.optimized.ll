; To reproduce the .optimized.ll from the .linked.ll, run:
; opt -S -mtriple=amdgcn-amd-amdhsa -mcpu=gfx942 --passes='verify,memprof-remove-attributes,annotation2metadata,forceattrs,inferattrs,coro-early,function<eager-inv>(ee-instrument<>,lower-expect,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;no-switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,sroa<modify-cfg>,early-cse<>),openmp-opt,amdgpu-printf-runtime-binding,ipsccp,called-value-propagation,globalopt,function<eager-inv>(mem2reg,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>),always-inline,require<globals-aa>,function(invalidate<aa>),require<profile-summary>,cgscc(devirt<4>(inline,function-attrs<skip-non-recursive-function-attrs>,openmp-opt-cgscc,function(amdgpu-promote-kernel-arguments,infer-address-spaces,amdgpu-lower-kernel-attributes,amdgpu-promote-alloca-to-vector),function<eager-inv;no-rerun>(sroa<modify-cfg>,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jump-threading,correlated-propagation,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,aggressive-instcombine,libcalls-shrinkwrap,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassociate,constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,licm<no-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,licm<allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-deletion,loop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split-footer-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,jump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init,loop-mssa(licm<allowspeculation>),coro-elide,infer-address-spaces,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;no-switch-to-lookup;keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine),function-attrs,function(require<should-not-run-function-passes>),coro-split,coro-annotation-elide)),deadargelim,coro-cleanup,globalopt,globaldce,elim-avail-extern,rpo-function-attrs,recompute-globalsaa,function<eager-inv>(drop-unnecessary-assumes,float2int,lower-constant-intrinsics,loop(loop-rotate<header-duplication;no-prepare-for-lto>,loop-deletion),loop-distribute,inject-tli-mappings,loop-vectorize<no-interleave-forced-only;no-vectorize-forced-only;>,drop-unnecessary-assumes,infer-alignment,loop-load-elim,instcombine<max-iterations=1;no-verify-fixpoint>,simplifycfg<bonus-inst-threshold=1;forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;switch-to-lookup;no-keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,slp-vectorizer,vector-combine,instcombine<max-iterations=1;no-verify-fixpoint>,loop-unroll<O2>,transform-warning,sroa<preserve-cfg>,infer-alignment,instcombine<max-iterations=1;no-verify-fixpoint>,loop-mssa(licm<allowspeculation>),alignment-from-assumptions,infer-address-spaces,loop-sink,instsimplify,div-rem-pairs,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;speculate-unpredictables>),alloc-token,amdgpu-attributor,globaldce,constmerge,cg-profile,rel-lookup-table-converter,function(annotation-remarks),verify' <.linked.ll>
; The flag '-S' is to emit LLVMIR.
; The behavior of some passes depends on '-mtriple' and '-mcpu'.

; ModuleID = 'matmul_f8E4M3FNUZ_8x6656x16384_dispatch_0'
source_filename = "matmul_f8E4M3FNUZ_8x6656x16384_dispatch_0"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"

@__shared_memory___0 = private unnamed_addr addrspace(3) global [64 x [264 x i8]] undef, align 16
@__shared_memory__ = private unnamed_addr addrspace(3) global [8 x [264 x i8]] undef, align 16

; Function Attrs: alwaysinline nofree norecurse nounwind
define amdgpu_kernel void @matmul_f8E4M3FNUZ_8x6656x16384_dispatch_0_matmul_like_8x6656x16384_f8E4M3FNUZxf8E4M3FNUZxf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 captures(none) %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 captures(none) %1, ptr addrspace(1) inreg noalias noundef nonnull writeonly align 16 captures(none) %2) local_unnamed_addr #0 !reqd_work_group_size !2 {
  %4 = tail call range(i32 0, 128) i32 @llvm.amdgcn.workitem.id.x()
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %5 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %0, i16 0, i64 131072, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %6 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %1, i16 0, i64 109051904, i32 159744)
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
  %27 = tail call range(i32 0, 104) i32 @llvm.amdgcn.workgroup.id.x()
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
  %107 = phi [1 x [2 x [2 x <1 x float>]]] [ zeroinitializer, %3 ], [ %199, %106 ]
  %108 = phi i32 [ 0, %3 ], [ %109, %106 ]
  %109 = add nuw nsw i32 %108, 2
  %110 = shl nuw nsw i32 %109, 7
  %111 = or disjoint i32 %110, %26
  %gep = getelementptr i8, ptr addrspace(7) %invariant.gep, i32 %111
  %112 = load <16 x i8>, ptr addrspace(7) %gep, align 1
  %113 = getelementptr i8, ptr addrspace(7) %35, i32 %111
  %114 = load <16 x i8>, ptr addrspace(7) %113, align 1
  %115 = getelementptr i8, ptr addrspace(7) %41, i32 %110
  %116 = load <16 x i8>, ptr addrspace(7) %115, align 1
  %117 = getelementptr i8, ptr addrspace(7) %46, i32 %110
  %118 = load <16 x i8>, ptr addrspace(7) %117, align 1
  %119 = getelementptr i8, ptr addrspace(7) %51, i32 %110
  %120 = load <16 x i8>, ptr addrspace(7) %119, align 1
  %121 = getelementptr i8, ptr addrspace(7) %56, i32 %110
  %122 = load <16 x i8>, ptr addrspace(7) %121, align 1
  %123 = getelementptr i8, ptr addrspace(7) %61, i32 %110
  %124 = load <16 x i8>, ptr addrspace(7) %123, align 1
  %125 = getelementptr i8, ptr addrspace(7) %66, i32 %110
  %126 = load <16 x i8>, ptr addrspace(7) %125, align 1
  %127 = getelementptr i8, ptr addrspace(7) %71, i32 %110
  %128 = load <16 x i8>, ptr addrspace(7) %127, align 1
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %129 = load <16 x i8>, ptr addrspace(3) %93, align 8
  %130 = load <16 x i8>, ptr addrspace(3) %96, align 8
  %131 = load <32 x i8>, ptr addrspace(3) %98, align 8
  %132 = load <32 x i8>, ptr addrspace(3) %101, align 8
  %133 = load <32 x i8>, ptr addrspace(3) %103, align 8
  %134 = load <32 x i8>, ptr addrspace(3) %104, align 8
  %135 = extractvalue [1 x [2 x [2 x <1 x float>]]] %107, 0, 0, 0
  %136 = extractvalue [1 x [2 x [2 x <1 x float>]]] %107, 0, 0, 1
  %137 = shufflevector <1 x float> %135, <1 x float> %136, <2 x i32> <i32 0, i32 1>
  %138 = shufflevector <2 x float> %137, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %139 = shufflevector <16 x i8> %129, <16 x i8> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %140 = shufflevector <32 x i8> %131, <32 x i8> poison, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %141 = bitcast <8 x i8> %139 to <2 x i32>
  %142 = bitcast <16 x i8> %140 to <4 x i32>
  %143 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %141, <4 x i32> %142, <4 x float> %138, i32 %105, i32 0, i32 0)
  %144 = shufflevector <16 x i8> %129, <16 x i8> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %145 = shufflevector <32 x i8> %131, <32 x i8> poison, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %146 = bitcast <8 x i8> %144 to <2 x i32>
  %147 = bitcast <16 x i8> %145 to <4 x i32>
  %148 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %146, <4 x i32> %147, <4 x float> %143, i32 %105, i32 0, i32 0)
  %149 = shufflevector <4 x float> %148, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %150 = shufflevector <4 x float> %148, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %151 = fadd <2 x float> %149, %150
  %152 = extractvalue [1 x [2 x [2 x <1 x float>]]] %107, 0, 1, 0
  %153 = extractvalue [1 x [2 x [2 x <1 x float>]]] %107, 0, 1, 1
  %154 = shufflevector <1 x float> %152, <1 x float> %153, <2 x i32> <i32 0, i32 1>
  %155 = shufflevector <2 x float> %154, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %156 = shufflevector <32 x i8> %133, <32 x i8> poison, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %157 = bitcast <16 x i8> %156 to <4 x i32>
  %158 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %141, <4 x i32> %157, <4 x float> %155, i32 %105, i32 0, i32 0)
  %159 = shufflevector <32 x i8> %133, <32 x i8> poison, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %160 = bitcast <16 x i8> %159 to <4 x i32>
  %161 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %146, <4 x i32> %160, <4 x float> %158, i32 %105, i32 0, i32 0)
  %162 = shufflevector <4 x float> %161, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %163 = shufflevector <4 x float> %161, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %164 = fadd <2 x float> %162, %163
  %165 = shufflevector <2 x float> %151, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %166 = shufflevector <16 x i8> %130, <16 x i8> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %167 = shufflevector <32 x i8> %132, <32 x i8> poison, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %168 = bitcast <8 x i8> %166 to <2 x i32>
  %169 = bitcast <16 x i8> %167 to <4 x i32>
  %170 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %168, <4 x i32> %169, <4 x float> %165, i32 %105, i32 0, i32 0)
  %171 = shufflevector <16 x i8> %130, <16 x i8> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %172 = shufflevector <32 x i8> %132, <32 x i8> poison, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %173 = bitcast <8 x i8> %171 to <2 x i32>
  %174 = bitcast <16 x i8> %172 to <4 x i32>
  %175 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %173, <4 x i32> %174, <4 x float> %170, i32 %105, i32 0, i32 0)
  %176 = shufflevector <4 x float> %175, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %177 = shufflevector <4 x float> %175, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %178 = fadd <2 x float> %176, %177
  %179 = shufflevector <2 x float> %164, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %180 = shufflevector <32 x i8> %134, <32 x i8> poison, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %181 = bitcast <16 x i8> %180 to <4 x i32>
  %182 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %168, <4 x i32> %181, <4 x float> %179, i32 %105, i32 0, i32 0)
  %183 = shufflevector <32 x i8> %134, <32 x i8> poison, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %184 = bitcast <16 x i8> %183 to <4 x i32>
  %185 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %173, <4 x i32> %184, <4 x float> %182, i32 %105, i32 0, i32 0)
  %186 = shufflevector <4 x float> %185, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %187 = shufflevector <4 x float> %185, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %188 = fadd <2 x float> %186, %187
  %189 = shufflevector <2 x float> %178, <2 x float> poison, <1 x i32> zeroinitializer
  %190 = insertvalue [2 x <1 x float>] poison, <1 x float> %189, 0
  %191 = shufflevector <2 x float> %178, <2 x float> poison, <1 x i32> <i32 1>
  %192 = insertvalue [2 x <1 x float>] %190, <1 x float> %191, 1
  %193 = insertvalue [2 x [2 x <1 x float>]] zeroinitializer, [2 x <1 x float>] %192, 0
  %194 = shufflevector <2 x float> %188, <2 x float> poison, <1 x i32> zeroinitializer
  %195 = insertvalue [2 x <1 x float>] poison, <1 x float> %194, 0
  %196 = shufflevector <2 x float> %188, <2 x float> poison, <1 x i32> <i32 1>
  %197 = insertvalue [2 x <1 x float>] %195, <1 x float> %196, 1
  %198 = insertvalue [2 x [2 x <1 x float>]] %193, [2 x <1 x float>] %197, 1
  %199 = insertvalue [1 x [2 x [2 x <1 x float>]]] poison, [2 x [2 x <1 x float>]] %198, 0
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  tail call void @llvm.amdgcn.sched.barrier(i32 0)
  store <16 x i8> %112, ptr addrspace(3) %73, align 8
  store <16 x i8> %114, ptr addrspace(3) %74, align 8
  store <16 x i8> %116, ptr addrspace(3) %76, align 8
  store <16 x i8> %118, ptr addrspace(3) %78, align 8
  store <16 x i8> %120, ptr addrspace(3) %80, align 8
  store <16 x i8> %122, ptr addrspace(3) %82, align 8
  store <16 x i8> %124, ptr addrspace(3) %84, align 8
  store <16 x i8> %126, ptr addrspace(3) %86, align 8
  store <16 x i8> %128, ptr addrspace(3) %88, align 8
  %200 = icmp samesign ult i32 %108, 124
  br i1 %200, label %106, label %201

201:                                              ; preds = %106
  %202 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %2, i16 0, i64 212992, i32 159744)
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %203 = load <16 x i8>, ptr addrspace(3) %93, align 8
  %204 = load <16 x i8>, ptr addrspace(3) %96, align 8
  %205 = load <32 x i8>, ptr addrspace(3) %98, align 8
  %206 = load <32 x i8>, ptr addrspace(3) %101, align 8
  %207 = load <32 x i8>, ptr addrspace(3) %103, align 8
  %208 = load <32 x i8>, ptr addrspace(3) %104, align 8
  %209 = shufflevector <2 x float> %178, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %210 = shufflevector <16 x i8> %203, <16 x i8> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %211 = shufflevector <32 x i8> %205, <32 x i8> poison, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %212 = bitcast <8 x i8> %210 to <2 x i32>
  %213 = bitcast <16 x i8> %211 to <4 x i32>
  %214 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %212, <4 x i32> %213, <4 x float> %209, i32 %105, i32 0, i32 0)
  %215 = shufflevector <16 x i8> %203, <16 x i8> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %216 = shufflevector <32 x i8> %205, <32 x i8> poison, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %217 = bitcast <8 x i8> %215 to <2 x i32>
  %218 = bitcast <16 x i8> %216 to <4 x i32>
  %219 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %217, <4 x i32> %218, <4 x float> %214, i32 %105, i32 0, i32 0)
  %220 = shufflevector <4 x float> %219, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %221 = shufflevector <4 x float> %219, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %222 = fadd <2 x float> %220, %221
  %223 = shufflevector <2 x float> %188, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %224 = shufflevector <32 x i8> %207, <32 x i8> poison, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %225 = bitcast <16 x i8> %224 to <4 x i32>
  %226 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %212, <4 x i32> %225, <4 x float> %223, i32 %105, i32 0, i32 0)
  %227 = shufflevector <32 x i8> %207, <32 x i8> poison, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %228 = bitcast <16 x i8> %227 to <4 x i32>
  %229 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %217, <4 x i32> %228, <4 x float> %226, i32 %105, i32 0, i32 0)
  %230 = shufflevector <4 x float> %229, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %231 = shufflevector <4 x float> %229, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %232 = fadd <2 x float> %230, %231
  %233 = shufflevector <2 x float> %222, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %234 = shufflevector <16 x i8> %204, <16 x i8> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %235 = shufflevector <32 x i8> %206, <32 x i8> poison, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %236 = bitcast <8 x i8> %234 to <2 x i32>
  %237 = bitcast <16 x i8> %235 to <4 x i32>
  %238 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %236, <4 x i32> %237, <4 x float> %233, i32 %105, i32 0, i32 0)
  %239 = shufflevector <16 x i8> %204, <16 x i8> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %240 = shufflevector <32 x i8> %206, <32 x i8> poison, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %241 = bitcast <8 x i8> %239 to <2 x i32>
  %242 = bitcast <16 x i8> %240 to <4 x i32>
  %243 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %241, <4 x i32> %242, <4 x float> %238, i32 %105, i32 0, i32 0)
  %244 = shufflevector <4 x float> %243, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %245 = shufflevector <4 x float> %243, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %246 = fadd <2 x float> %244, %245
  %247 = shufflevector <2 x float> %232, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  %248 = shufflevector <32 x i8> %208, <32 x i8> poison, <16 x i32> <i32 0, i32 1, i32 16, i32 17, i32 2, i32 3, i32 18, i32 19, i32 4, i32 5, i32 20, i32 21, i32 6, i32 7, i32 22, i32 23>
  %249 = bitcast <16 x i8> %248 to <4 x i32>
  %250 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %236, <4 x i32> %249, <4 x float> %247, i32 %105, i32 0, i32 0)
  %251 = shufflevector <32 x i8> %208, <32 x i8> poison, <16 x i32> <i32 8, i32 9, i32 24, i32 25, i32 10, i32 11, i32 26, i32 27, i32 12, i32 13, i32 28, i32 29, i32 14, i32 15, i32 30, i32 31>
  %252 = bitcast <16 x i8> %251 to <4 x i32>
  %253 = tail call <4 x float> @llvm.amdgcn.smfmac.f32.16x16x64.fp8.fp8(<2 x i32> %241, <4 x i32> %252, <4 x float> %250, i32 %105, i32 0, i32 0)
  %254 = shufflevector <4 x float> %253, <4 x float> poison, <2 x i32> <i32 0, i32 2>
  %255 = shufflevector <4 x float> %253, <4 x float> poison, <2 x i32> <i32 1, i32 3>
  %256 = fadd <2 x float> %254, %255
  %257 = shufflevector <2 x float> %246, <2 x float> poison, <1 x i32> zeroinitializer
  %258 = shufflevector <2 x float> %246, <2 x float> poison, <1 x i32> <i32 1>
  %259 = shufflevector <2 x float> %256, <2 x float> poison, <1 x i32> zeroinitializer
  %260 = shufflevector <2 x float> %256, <2 x float> poison, <1 x i32> <i32 1>
  %261 = or disjoint i32 %91, %32
  %.idx = mul nuw nsw i32 %8, 53248
  %262 = getelementptr i8, ptr addrspace(7) %202, i32 %.idx
  %263 = getelementptr float, ptr addrspace(7) %262, i32 %261
  store <1 x float> %257, ptr addrspace(7) %263, align 4
  %264 = or disjoint i32 %261, 16
  %265 = getelementptr float, ptr addrspace(7) %262, i32 %264
  store <1 x float> %259, ptr addrspace(7) %265, align 4
  %266 = getelementptr i8, ptr addrspace(7) %262, i32 26624
  %267 = getelementptr float, ptr addrspace(7) %266, i32 %261
  store <1 x float> %258, ptr addrspace(7) %267, align 4
  %268 = getelementptr float, ptr addrspace(7) %266, i32 %264
  store <1 x float> %260, ptr addrspace(7) %268, align 4
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
