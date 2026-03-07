; To reproduce the .optimized.ll from the .linked.ll, run:
; opt -S -mtriple=amdgcn-amd-amdhsa -mcpu=gfx942 --passes='verify,memprof-remove-attributes,annotation2metadata,forceattrs,inferattrs,coro-early,function<eager-inv>(ee-instrument<>,lower-expect,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;no-switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,sroa<modify-cfg>,early-cse<>),openmp-opt,amdgpu-printf-runtime-binding,ipsccp,called-value-propagation,globalopt,function<eager-inv>(mem2reg,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>),always-inline,require<globals-aa>,function(invalidate<aa>),require<profile-summary>,cgscc(devirt<4>(inline,function-attrs<skip-non-recursive-function-attrs>,openmp-opt-cgscc,function(amdgpu-promote-kernel-arguments,infer-address-spaces,amdgpu-lower-kernel-attributes,amdgpu-promote-alloca-to-vector),function<eager-inv;no-rerun>(sroa<modify-cfg>,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jump-threading,correlated-propagation,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,aggressive-instcombine,libcalls-shrinkwrap,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassociate,constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,licm<no-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,licm<allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-deletion,loop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split-footer-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,jump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init,loop-mssa(licm<allowspeculation>),coro-elide,infer-address-spaces,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;no-switch-to-lookup;keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine),function-attrs,function(require<should-not-run-function-passes>),coro-split,coro-annotation-elide)),deadargelim,coro-cleanup,globalopt,globaldce,elim-avail-extern,rpo-function-attrs,recompute-globalsaa,function<eager-inv>(drop-unnecessary-assumes,float2int,lower-constant-intrinsics,loop(loop-rotate<header-duplication;no-prepare-for-lto>,loop-deletion),loop-distribute,inject-tli-mappings,loop-vectorize<no-interleave-forced-only;no-vectorize-forced-only;>,drop-unnecessary-assumes,infer-alignment,loop-load-elim,instcombine<max-iterations=1;no-verify-fixpoint>,simplifycfg<bonus-inst-threshold=1;forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;switch-to-lookup;no-keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,slp-vectorizer,vector-combine,instcombine<max-iterations=1;no-verify-fixpoint>,loop-unroll<O2>,transform-warning,sroa<preserve-cfg>,infer-alignment,instcombine<max-iterations=1;no-verify-fixpoint>,loop-mssa(licm<allowspeculation>),alignment-from-assumptions,infer-address-spaces,loop-sink,instsimplify,div-rem-pairs,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;speculate-unpredictables>),alloc-token,amdgpu-attributor,globaldce,constmerge,cg-profile,rel-lookup-table-converter,function(annotation-remarks),verify' <.linked.ll>
; The flag '-S' is to emit LLVMIR.
; The behavior of some passes depends on '-mtriple' and '-mcpu'.

; ModuleID = 'matmul_f16_8x6656x16384_dispatch_0'
source_filename = "matmul_f16_8x6656x16384_dispatch_0"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"

@__shared_memory___0 = private unnamed_addr addrspace(3) global [64 x [132 x half]] undef, align 16
@__shared_memory__ = private unnamed_addr addrspace(3) global [16 x [132 x half]] undef, align 16

; Function Attrs: alwaysinline nofree norecurse nounwind
define amdgpu_kernel void @matmul_f16_8x6656x16384_dispatch_0_matmul_like_8x6656x16384_f16xf16xf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 captures(none) %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 captures(none) %1, ptr addrspace(1) inreg noalias noundef nonnull align 16 %2) local_unnamed_addr #0 !reqd_work_group_size !2 {
  %4 = tail call range(i32 0, 128) i32 @llvm.amdgcn.workitem.id.x()
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %5 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %0, i16 0, i64 262144, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %6 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %1, i16 0, i64 218103808, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  %7 = and i32 %4, 15
  %8 = lshr i32 %4, 2
  %9 = and i32 %8, 12
  %10 = lshr i32 %4, 4
  %11 = or disjoint i32 %10, 8
  %12 = or disjoint i32 %10, 16
  %13 = or disjoint i32 %10, 24
  %14 = or disjoint i32 %10, 32
  %15 = or disjoint i32 %10, 40
  %16 = or disjoint i32 %10, 48
  %17 = or disjoint i32 %10, 56
  %18 = shl nuw nsw i32 %4, 3
  %19 = and i32 %18, 120
  %20 = tail call range(i32 0, 104) i32 @llvm.amdgcn.workgroup.id.x()
  %21 = shl nuw nsw i32 %20, 6
  %.idx30 = shl nuw nsw i32 %10, 15
  %22 = getelementptr i8, ptr addrspace(7) %5, i32 %.idx30
  %23 = getelementptr half, ptr addrspace(7) %22, i32 %19
  %24 = load <8 x half>, ptr addrspace(7) %23, align 2
  %25 = or disjoint i32 %10, %21
  %.idx31 = shl nuw nsw i32 %25, 15
  %26 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx31
  %27 = getelementptr half, ptr addrspace(7) %26, i32 %19
  %28 = load <8 x half>, ptr addrspace(7) %27, align 2
  %29 = or disjoint i32 %11, %21
  %.idx32 = shl nuw nsw i32 %29, 15
  %30 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx32
  %31 = getelementptr half, ptr addrspace(7) %30, i32 %19
  %32 = load <8 x half>, ptr addrspace(7) %31, align 2
  %33 = or disjoint i32 %12, %21
  %.idx33 = shl nuw nsw i32 %33, 15
  %34 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx33
  %35 = getelementptr half, ptr addrspace(7) %34, i32 %19
  %36 = load <8 x half>, ptr addrspace(7) %35, align 2
  %37 = or disjoint i32 %13, %21
  %.idx34 = shl nuw nsw i32 %37, 15
  %38 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx34
  %39 = getelementptr half, ptr addrspace(7) %38, i32 %19
  %40 = load <8 x half>, ptr addrspace(7) %39, align 2
  %41 = or disjoint i32 %14, %21
  %.idx35 = shl nuw nsw i32 %41, 15
  %42 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx35
  %43 = getelementptr half, ptr addrspace(7) %42, i32 %19
  %44 = load <8 x half>, ptr addrspace(7) %43, align 2
  %45 = or disjoint i32 %15, %21
  %.idx36 = shl nuw nsw i32 %45, 15
  %46 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx36
  %47 = getelementptr half, ptr addrspace(7) %46, i32 %19
  %48 = load <8 x half>, ptr addrspace(7) %47, align 2
  %49 = or disjoint i32 %16, %21
  %.idx37 = shl nuw nsw i32 %49, 15
  %50 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx37
  %51 = getelementptr half, ptr addrspace(7) %50, i32 %19
  %52 = load <8 x half>, ptr addrspace(7) %51, align 2
  %53 = or disjoint i32 %17, %21
  %.idx38 = shl nuw nsw i32 %53, 15
  %54 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx38
  %55 = getelementptr half, ptr addrspace(7) %54, i32 %19
  %56 = load <8 x half>, ptr addrspace(7) %55, align 2
  %narrow = mul nuw nsw i32 %10, 132
  %narrow1 = add nuw nsw i32 %narrow, %19
  %57 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %narrow1
  store <8 x half> %24, ptr addrspace(3) %57, align 8
  %narrow2 = mul nuw nsw i32 %11, 132
  %narrow3 = add nuw nsw i32 %narrow2, %19
  %58 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %narrow3
  store <8 x half> zeroinitializer, ptr addrspace(3) %58, align 8
  %59 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %narrow1
  store <8 x half> %28, ptr addrspace(3) %59, align 8
  %60 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %narrow3
  store <8 x half> %32, ptr addrspace(3) %60, align 8
  %.idx = mul nuw nsw i32 %12, 264
  %61 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %.idx
  %62 = getelementptr half, ptr addrspace(3) %61, i32 %19
  store <8 x half> %36, ptr addrspace(3) %62, align 8
  %.idx8 = mul nuw nsw i32 %13, 264
  %63 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %.idx8
  %64 = getelementptr half, ptr addrspace(3) %63, i32 %19
  store <8 x half> %40, ptr addrspace(3) %64, align 8
  %.idx11 = mul nuw nsw i32 %14, 264
  %65 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %.idx11
  %66 = getelementptr half, ptr addrspace(3) %65, i32 %19
  store <8 x half> %44, ptr addrspace(3) %66, align 8
  %.idx14 = mul nuw nsw i32 %15, 264
  %67 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %.idx14
  %68 = getelementptr half, ptr addrspace(3) %67, i32 %19
  store <8 x half> %48, ptr addrspace(3) %68, align 8
  %.idx17 = mul nuw nsw i32 %16, 264
  %69 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %.idx17
  %70 = getelementptr half, ptr addrspace(3) %69, i32 %19
  store <8 x half> %52, ptr addrspace(3) %70, align 8
  %.idx20 = mul nuw nsw i32 %17, 264
  %71 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %.idx20
  %72 = getelementptr half, ptr addrspace(3) %71, i32 %19
  store <8 x half> %56, ptr addrspace(3) %72, align 8
  %73 = or disjoint i32 %9, 16
  %74 = or disjoint i32 %9, 32
  %75 = or disjoint i32 %9, 48
  %76 = or disjoint i32 %9, 64
  %77 = or disjoint i32 %9, 80
  %78 = or disjoint i32 %9, 96
  %79 = or disjoint i32 %9, 112
  %80 = lshr i32 %4, 1
  %81 = and i32 %80, 32
  %82 = or disjoint i32 %81, %7
  %83 = or disjoint i32 %82, 16
  %narrow39 = mul nuw nsw i32 %7, 132
  %84 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %9
  %85 = getelementptr half, ptr addrspace(3) %84, i32 %narrow39
  %86 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %73
  %87 = getelementptr half, ptr addrspace(3) %86, i32 %narrow39
  %88 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %74
  %89 = getelementptr half, ptr addrspace(3) %88, i32 %narrow39
  %90 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %75
  %91 = getelementptr half, ptr addrspace(3) %90, i32 %narrow39
  %92 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %76
  %93 = getelementptr half, ptr addrspace(3) %92, i32 %narrow39
  %94 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %77
  %95 = getelementptr half, ptr addrspace(3) %94, i32 %narrow39
  %96 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %78
  %97 = getelementptr half, ptr addrspace(3) %96, i32 %narrow39
  %98 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %79
  %99 = getelementptr half, ptr addrspace(3) %98, i32 %narrow39
  %narrow40 = mul nuw nsw i32 %82, 132
  %100 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %9
  %101 = getelementptr half, ptr addrspace(3) %100, i32 %narrow40
  %102 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %73
  %103 = getelementptr half, ptr addrspace(3) %102, i32 %narrow40
  %104 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %74
  %105 = getelementptr half, ptr addrspace(3) %104, i32 %narrow40
  %106 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %75
  %107 = getelementptr half, ptr addrspace(3) %106, i32 %narrow40
  %108 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %76
  %109 = getelementptr half, ptr addrspace(3) %108, i32 %narrow40
  %110 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %77
  %111 = getelementptr half, ptr addrspace(3) %110, i32 %narrow40
  %112 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %78
  %113 = getelementptr half, ptr addrspace(3) %112, i32 %narrow40
  %114 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %79
  %115 = getelementptr half, ptr addrspace(3) %114, i32 %narrow40
  %narrow41 = mul nuw nsw i32 %83, 132
  %116 = getelementptr half, ptr addrspace(3) %100, i32 %narrow41
  %117 = getelementptr half, ptr addrspace(3) %102, i32 %narrow41
  %118 = getelementptr half, ptr addrspace(3) %104, i32 %narrow41
  %119 = getelementptr half, ptr addrspace(3) %106, i32 %narrow41
  %120 = getelementptr half, ptr addrspace(3) %108, i32 %narrow41
  %121 = getelementptr half, ptr addrspace(3) %110, i32 %narrow41
  %122 = getelementptr half, ptr addrspace(3) %112, i32 %narrow41
  %123 = getelementptr half, ptr addrspace(3) %114, i32 %narrow41
  br label %124

124:                                              ; preds = %3, %124
  %125 = phi [1 x [2 x [4 x <1 x float>]]] [ zeroinitializer, %3 ], [ %224, %124 ]
  %126 = phi i32 [ 0, %3 ], [ %127, %124 ]
  %127 = add nuw nsw i32 %126, 8
  %128 = shl nuw nsw i32 %127, 4
  %129 = or disjoint i32 %128, %19
  %130 = getelementptr half, ptr addrspace(7) %22, i32 %129
  %131 = load <8 x half>, ptr addrspace(7) %130, align 2
  %132 = getelementptr half, ptr addrspace(7) %26, i32 %129
  %133 = load <8 x half>, ptr addrspace(7) %132, align 2
  %134 = getelementptr half, ptr addrspace(7) %31, i32 %128
  %135 = load <8 x half>, ptr addrspace(7) %134, align 2
  %136 = getelementptr half, ptr addrspace(7) %35, i32 %128
  %137 = load <8 x half>, ptr addrspace(7) %136, align 2
  %138 = getelementptr half, ptr addrspace(7) %39, i32 %128
  %139 = load <8 x half>, ptr addrspace(7) %138, align 2
  %140 = getelementptr half, ptr addrspace(7) %43, i32 %128
  %141 = load <8 x half>, ptr addrspace(7) %140, align 2
  %142 = getelementptr half, ptr addrspace(7) %47, i32 %128
  %143 = load <8 x half>, ptr addrspace(7) %142, align 2
  %144 = getelementptr half, ptr addrspace(7) %51, i32 %128
  %145 = load <8 x half>, ptr addrspace(7) %144, align 2
  %146 = getelementptr half, ptr addrspace(7) %55, i32 %128
  %147 = load <8 x half>, ptr addrspace(7) %146, align 2
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %148 = load <4 x half>, ptr addrspace(3) %85, align 8
  %149 = load <4 x half>, ptr addrspace(3) %87, align 8
  %150 = load <4 x half>, ptr addrspace(3) %89, align 8
  %151 = load <4 x half>, ptr addrspace(3) %91, align 8
  %152 = load <4 x half>, ptr addrspace(3) %93, align 8
  %153 = load <4 x half>, ptr addrspace(3) %95, align 8
  %154 = load <4 x half>, ptr addrspace(3) %97, align 8
  %155 = load <4 x half>, ptr addrspace(3) %99, align 8
  %156 = load <4 x half>, ptr addrspace(3) %101, align 8
  %157 = load <4 x half>, ptr addrspace(3) %103, align 8
  %158 = load <4 x half>, ptr addrspace(3) %105, align 8
  %159 = load <4 x half>, ptr addrspace(3) %107, align 8
  %160 = load <4 x half>, ptr addrspace(3) %109, align 8
  %161 = load <4 x half>, ptr addrspace(3) %111, align 8
  %162 = load <4 x half>, ptr addrspace(3) %113, align 8
  %163 = load <4 x half>, ptr addrspace(3) %115, align 8
  %164 = load <4 x half>, ptr addrspace(3) %116, align 8
  %165 = load <4 x half>, ptr addrspace(3) %117, align 8
  %166 = load <4 x half>, ptr addrspace(3) %118, align 8
  %167 = load <4 x half>, ptr addrspace(3) %119, align 8
  %168 = load <4 x half>, ptr addrspace(3) %120, align 8
  %169 = load <4 x half>, ptr addrspace(3) %121, align 8
  %170 = load <4 x half>, ptr addrspace(3) %122, align 8
  %171 = load <4 x half>, ptr addrspace(3) %123, align 8
  %172 = extractvalue [1 x [2 x [4 x <1 x float>]]] %125, 0, 0, 0
  %173 = extractvalue [1 x [2 x [4 x <1 x float>]]] %125, 0, 0, 1
  %174 = shufflevector <1 x float> %172, <1 x float> %173, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %175 = extractvalue [1 x [2 x [4 x <1 x float>]]] %125, 0, 0, 2
  %176 = shufflevector <1 x float> %175, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %177 = shufflevector <4 x float> %174, <4 x float> %176, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %178 = extractvalue [1 x [2 x [4 x <1 x float>]]] %125, 0, 0, 3
  %179 = shufflevector <1 x float> %178, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %180 = shufflevector <4 x float> %177, <4 x float> %179, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %181 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %148, <4 x half> %156, <4 x float> %180, i32 0, i32 0, i32 0)
  %182 = extractvalue [1 x [2 x [4 x <1 x float>]]] %125, 0, 1, 0
  %183 = extractvalue [1 x [2 x [4 x <1 x float>]]] %125, 0, 1, 1
  %184 = shufflevector <1 x float> %182, <1 x float> %183, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %185 = extractvalue [1 x [2 x [4 x <1 x float>]]] %125, 0, 1, 2
  %186 = shufflevector <1 x float> %185, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %187 = shufflevector <4 x float> %184, <4 x float> %186, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %188 = extractvalue [1 x [2 x [4 x <1 x float>]]] %125, 0, 1, 3
  %189 = shufflevector <1 x float> %188, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %190 = shufflevector <4 x float> %187, <4 x float> %189, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %191 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %148, <4 x half> %164, <4 x float> %190, i32 0, i32 0, i32 0)
  %192 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %149, <4 x half> %157, <4 x float> %181, i32 0, i32 0, i32 0)
  %193 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %149, <4 x half> %165, <4 x float> %191, i32 0, i32 0, i32 0)
  %194 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %150, <4 x half> %158, <4 x float> %192, i32 0, i32 0, i32 0)
  %195 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %150, <4 x half> %166, <4 x float> %193, i32 0, i32 0, i32 0)
  %196 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %151, <4 x half> %159, <4 x float> %194, i32 0, i32 0, i32 0)
  %197 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %151, <4 x half> %167, <4 x float> %195, i32 0, i32 0, i32 0)
  %198 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %152, <4 x half> %160, <4 x float> %196, i32 0, i32 0, i32 0)
  %199 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %152, <4 x half> %168, <4 x float> %197, i32 0, i32 0, i32 0)
  %200 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %153, <4 x half> %161, <4 x float> %198, i32 0, i32 0, i32 0)
  %201 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %153, <4 x half> %169, <4 x float> %199, i32 0, i32 0, i32 0)
  %202 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %154, <4 x half> %162, <4 x float> %200, i32 0, i32 0, i32 0)
  %203 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %154, <4 x half> %170, <4 x float> %201, i32 0, i32 0, i32 0)
  %204 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %155, <4 x half> %163, <4 x float> %202, i32 0, i32 0, i32 0)
  %205 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %155, <4 x half> %171, <4 x float> %203, i32 0, i32 0, i32 0)
  %206 = shufflevector <4 x float> %204, <4 x float> poison, <1 x i32> zeroinitializer
  %207 = insertvalue [4 x <1 x float>] poison, <1 x float> %206, 0
  %208 = shufflevector <4 x float> %204, <4 x float> poison, <1 x i32> <i32 1>
  %209 = insertvalue [4 x <1 x float>] %207, <1 x float> %208, 1
  %210 = shufflevector <4 x float> %204, <4 x float> poison, <1 x i32> <i32 2>
  %211 = insertvalue [4 x <1 x float>] %209, <1 x float> %210, 2
  %212 = shufflevector <4 x float> %204, <4 x float> poison, <1 x i32> <i32 3>
  %213 = insertvalue [4 x <1 x float>] %211, <1 x float> %212, 3
  %214 = insertvalue [2 x [4 x <1 x float>]] zeroinitializer, [4 x <1 x float>] %213, 0
  %215 = shufflevector <4 x float> %205, <4 x float> poison, <1 x i32> zeroinitializer
  %216 = insertvalue [4 x <1 x float>] poison, <1 x float> %215, 0
  %217 = shufflevector <4 x float> %205, <4 x float> poison, <1 x i32> <i32 1>
  %218 = insertvalue [4 x <1 x float>] %216, <1 x float> %217, 1
  %219 = shufflevector <4 x float> %205, <4 x float> poison, <1 x i32> <i32 2>
  %220 = insertvalue [4 x <1 x float>] %218, <1 x float> %219, 2
  %221 = shufflevector <4 x float> %205, <4 x float> poison, <1 x i32> <i32 3>
  %222 = insertvalue [4 x <1 x float>] %220, <1 x float> %221, 3
  %223 = insertvalue [2 x [4 x <1 x float>]] %214, [4 x <1 x float>] %222, 1
  %224 = insertvalue [1 x [2 x [4 x <1 x float>]]] poison, [2 x [4 x <1 x float>]] %223, 0
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  tail call void @llvm.amdgcn.sched.barrier(i32 0)
  store <8 x half> %131, ptr addrspace(3) %57, align 8
  store <8 x half> zeroinitializer, ptr addrspace(3) %58, align 8
  store <8 x half> %133, ptr addrspace(3) %59, align 8
  store <8 x half> %135, ptr addrspace(3) %60, align 8
  store <8 x half> %137, ptr addrspace(3) %62, align 8
  store <8 x half> %139, ptr addrspace(3) %64, align 8
  store <8 x half> %141, ptr addrspace(3) %66, align 8
  store <8 x half> %143, ptr addrspace(3) %68, align 8
  store <8 x half> %145, ptr addrspace(3) %70, align 8
  store <8 x half> %147, ptr addrspace(3) %72, align 8
  %225 = icmp samesign ult i32 %126, 1008
  br i1 %225, label %124, label %226

226:                                              ; preds = %124
  %227 = icmp samesign ult i32 %9, 8
  %228 = insertelement <8 x i1> poison, i1 %227, i64 0
  %229 = shufflevector <8 x i1> %228, <8 x i1> poison, <8 x i32> zeroinitializer
  %230 = mul nuw nsw i32 %9, 6656
  %231 = add nuw nsw i32 %230, 19968
  %232 = add nuw nsw i32 %230, 13312
  %233 = add nuw nsw i32 %230, 6656
  %234 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %2, i16 0, i64 212992, i32 159744)
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %235 = load <4 x half>, ptr addrspace(3) %85, align 8
  %236 = load <4 x half>, ptr addrspace(3) %87, align 8
  %237 = load <4 x half>, ptr addrspace(3) %89, align 8
  %238 = load <4 x half>, ptr addrspace(3) %91, align 8
  %239 = load <4 x half>, ptr addrspace(3) %93, align 8
  %240 = load <4 x half>, ptr addrspace(3) %95, align 8
  %241 = load <4 x half>, ptr addrspace(3) %97, align 8
  %242 = load <4 x half>, ptr addrspace(3) %99, align 8
  %243 = load <4 x half>, ptr addrspace(3) %101, align 8
  %244 = load <4 x half>, ptr addrspace(3) %103, align 8
  %245 = load <4 x half>, ptr addrspace(3) %105, align 8
  %246 = load <4 x half>, ptr addrspace(3) %107, align 8
  %247 = load <4 x half>, ptr addrspace(3) %109, align 8
  %248 = load <4 x half>, ptr addrspace(3) %111, align 8
  %249 = load <4 x half>, ptr addrspace(3) %113, align 8
  %250 = load <4 x half>, ptr addrspace(3) %115, align 8
  %251 = load <4 x half>, ptr addrspace(3) %116, align 8
  %252 = load <4 x half>, ptr addrspace(3) %117, align 8
  %253 = load <4 x half>, ptr addrspace(3) %118, align 8
  %254 = load <4 x half>, ptr addrspace(3) %119, align 8
  %255 = load <4 x half>, ptr addrspace(3) %120, align 8
  %256 = load <4 x half>, ptr addrspace(3) %121, align 8
  %257 = load <4 x half>, ptr addrspace(3) %122, align 8
  %258 = load <4 x half>, ptr addrspace(3) %123, align 8
  %259 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %235, <4 x half> %243, <4 x float> %204, i32 0, i32 0, i32 0)
  %260 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %235, <4 x half> %251, <4 x float> %205, i32 0, i32 0, i32 0)
  %261 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %236, <4 x half> %244, <4 x float> %259, i32 0, i32 0, i32 0)
  %262 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %236, <4 x half> %252, <4 x float> %260, i32 0, i32 0, i32 0)
  %263 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %237, <4 x half> %245, <4 x float> %261, i32 0, i32 0, i32 0)
  %264 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %237, <4 x half> %253, <4 x float> %262, i32 0, i32 0, i32 0)
  %265 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %238, <4 x half> %246, <4 x float> %263, i32 0, i32 0, i32 0)
  %266 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %238, <4 x half> %254, <4 x float> %264, i32 0, i32 0, i32 0)
  %267 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %239, <4 x half> %247, <4 x float> %265, i32 0, i32 0, i32 0)
  %268 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %239, <4 x half> %255, <4 x float> %266, i32 0, i32 0, i32 0)
  %269 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %240, <4 x half> %248, <4 x float> %267, i32 0, i32 0, i32 0)
  %270 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %240, <4 x half> %256, <4 x float> %268, i32 0, i32 0, i32 0)
  %271 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %241, <4 x half> %249, <4 x float> %269, i32 0, i32 0, i32 0)
  %272 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %241, <4 x half> %257, <4 x float> %270, i32 0, i32 0, i32 0)
  %273 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %242, <4 x half> %250, <4 x float> %271, i32 0, i32 0, i32 0)
  %274 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %242, <4 x half> %258, <4 x float> %272, i32 0, i32 0, i32 0)
  %275 = or disjoint i32 %82, %21
  %276 = or disjoint i32 %83, %21
  %277 = add nuw nsw i32 %275, %230
  %278 = add nuw nsw i32 %276, %230
  %279 = add nuw nsw i32 %233, %275
  %280 = add nuw nsw i32 %276, %233
  %281 = add nuw nsw i32 %232, %275
  %282 = add nuw nsw i32 %276, %232
  %283 = add nuw nsw i32 %231, %275
  %284 = add nuw nsw i32 %276, %231
  %285 = insertelement <8 x i32> poison, i32 %277, i64 0
  %286 = insertelement <8 x i32> %285, i32 %278, i64 1
  %287 = insertelement <8 x i32> %286, i32 %279, i64 2
  %288 = insertelement <8 x i32> %287, i32 %280, i64 3
  %289 = insertelement <8 x i32> %288, i32 %281, i64 4
  %290 = insertelement <8 x i32> %289, i32 %282, i64 5
  %291 = insertelement <8 x i32> %290, i32 %283, i64 6
  %292 = insertelement <8 x i32> %291, i32 %284, i64 7
  %293 = shufflevector <4 x float> %273, <4 x float> %274, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %294 = getelementptr float, ptr addrspace(7) %234, <8 x i32> %292
  tail call void @llvm.masked.scatter.v8f32.v8p7(<8 x float> %293, <8 x ptr addrspace(7)> align 4 %294, <8 x i1> %229)
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

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: alwaysinline convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #4

; Function Attrs: alwaysinline convergent mustprogress nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half>, <4 x half>, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #5

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v8f32.v8p7(<8 x float>, <8 x ptr addrspace(7)>, <8 x i1>) #6

; Function Attrs: alwaysinline convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.sched.barrier(i32 immarg) #4

attributes #0 = { alwaysinline nofree norecurse nounwind "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="128,128" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "uniform-work-group-size"="true" }
attributes #1 = { alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #3 = { alwaysinline mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { alwaysinline convergent mustprogress nocallback nofree nounwind willreturn }
attributes #5 = { alwaysinline convergent mustprogress nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none) }
attributes #6 = { alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(write) }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"amdhsa_code_object_version", i32 500}
!2 = !{i32 128, i32 1, i32 1}
!3 = !{!"amdgpu-synchronize-as", !"local"}
