; To reproduce the .optimized.ll from the .linked.ll, run:
; opt -S -mtriple=amdgcn-amd-amdhsa -mcpu=gfx942 --passes='verify,memprof-remove-attributes,annotation2metadata,forceattrs,inferattrs,coro-early,function<eager-inv>(ee-instrument<>,lower-expect,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;no-switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,sroa<modify-cfg>,early-cse<>),openmp-opt,amdgpu-printf-runtime-binding,ipsccp,called-value-propagation,globalopt,function<eager-inv>(mem2reg,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>),always-inline,require<globals-aa>,function(invalidate<aa>),require<profile-summary>,cgscc(devirt<4>(inline,function-attrs<skip-non-recursive-function-attrs>,openmp-opt-cgscc,function(amdgpu-promote-kernel-arguments,infer-address-spaces,amdgpu-lower-kernel-attributes,amdgpu-promote-alloca-to-vector),function<eager-inv;no-rerun>(sroa<modify-cfg>,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jump-threading,correlated-propagation,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,aggressive-instcombine,libcalls-shrinkwrap,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassociate,constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,licm<no-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,licm<allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-deletion,loop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split-footer-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,jump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init,loop-mssa(licm<allowspeculation>),coro-elide,infer-address-spaces,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;no-switch-to-lookup;keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine),function-attrs,function(require<should-not-run-function-passes>),coro-split,coro-annotation-elide)),deadargelim,coro-cleanup,globalopt,globaldce,elim-avail-extern,rpo-function-attrs,recompute-globalsaa,function<eager-inv>(drop-unnecessary-assumes,float2int,lower-constant-intrinsics,loop(loop-rotate<header-duplication;no-prepare-for-lto>,loop-deletion),loop-distribute,inject-tli-mappings,loop-vectorize<no-interleave-forced-only;no-vectorize-forced-only;>,drop-unnecessary-assumes,infer-alignment,loop-load-elim,instcombine<max-iterations=1;no-verify-fixpoint>,simplifycfg<bonus-inst-threshold=1;forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;switch-to-lookup;no-keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,slp-vectorizer,vector-combine,instcombine<max-iterations=1;no-verify-fixpoint>,loop-unroll<O2>,transform-warning,sroa<preserve-cfg>,infer-alignment,instcombine<max-iterations=1;no-verify-fixpoint>,loop-mssa(licm<allowspeculation>),alignment-from-assumptions,infer-address-spaces,loop-sink,instsimplify,div-rem-pairs,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;speculate-unpredictables>),alloc-token,amdgpu-attributor,globaldce,constmerge,cg-profile,rel-lookup-table-converter,function(annotation-remarks),verify' <.linked.ll>
; The flag '-S' is to emit LLVMIR.
; The behavior of some passes depends on '-mtriple' and '-mcpu'.

; ModuleID = 'matmul_f8E5M2FNUZ_8x2304x16384_dispatch_0'
source_filename = "matmul_f8E5M2FNUZ_8x2304x16384_dispatch_0"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"

@__shared_memory___0 = private unnamed_addr addrspace(3) global [64 x [264 x i8]] undef, align 16
@__shared_memory__ = private unnamed_addr addrspace(3) global [16 x [264 x i8]] undef, align 16

; Function Attrs: alwaysinline nofree norecurse nounwind
define amdgpu_kernel void @matmul_f8E5M2FNUZ_8x2304x16384_dispatch_0_matmul_like_8x2304x16384_f8E5M2FNUZxf8E5M2FNUZxf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 captures(none) %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 captures(none) %1, ptr addrspace(1) inreg noalias noundef nonnull align 16 %2) local_unnamed_addr #0 !reqd_work_group_size !2 {
  %4 = tail call range(i32 0, 128) i32 @llvm.amdgcn.workitem.id.x()
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %5 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %0, i16 0, i64 131072, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %6 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %1, i16 0, i64 37748736, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  %7 = lshr i32 %4, 4
  %8 = and i32 %7, 3
  %9 = and i32 %4, 15
  %10 = shl nuw nsw i32 %8, 3
  %11 = or disjoint i32 %7, 8
  %12 = or disjoint i32 %7, 16
  %13 = or disjoint i32 %7, 24
  %14 = or disjoint i32 %7, 32
  %15 = or disjoint i32 %7, 40
  %16 = or disjoint i32 %7, 48
  %17 = or disjoint i32 %7, 56
  %18 = shl nuw nsw i32 %4, 4
  %19 = and i32 %18, 240
  %20 = tail call range(i32 0, 36) i32 @llvm.amdgcn.workgroup.id.x()
  %21 = shl nuw nsw i32 %20, 6
  %22 = shl nuw nsw i32 %7, 14
  %23 = getelementptr i8, ptr addrspace(7) %5, i32 %22
  %24 = getelementptr i8, ptr addrspace(7) %23, i32 %19
  %25 = load <16 x i8>, ptr addrspace(7) %24, align 1
  %26 = or disjoint i32 %7, %21
  %27 = shl nuw nsw i32 %26, 14
  %28 = getelementptr i8, ptr addrspace(7) %6, i32 %27
  %29 = getelementptr i8, ptr addrspace(7) %28, i32 %19
  %30 = load <16 x i8>, ptr addrspace(7) %29, align 1
  %31 = or disjoint i32 %11, %21
  %32 = shl nuw nsw i32 %31, 14
  %33 = getelementptr i8, ptr addrspace(7) %6, i32 %32
  %34 = getelementptr i8, ptr addrspace(7) %33, i32 %19
  %35 = load <16 x i8>, ptr addrspace(7) %34, align 1
  %36 = or disjoint i32 %12, %21
  %37 = shl nuw nsw i32 %36, 14
  %38 = getelementptr i8, ptr addrspace(7) %6, i32 %37
  %39 = getelementptr i8, ptr addrspace(7) %38, i32 %19
  %40 = load <16 x i8>, ptr addrspace(7) %39, align 1
  %41 = or disjoint i32 %13, %21
  %42 = shl nuw nsw i32 %41, 14
  %43 = getelementptr i8, ptr addrspace(7) %6, i32 %42
  %44 = getelementptr i8, ptr addrspace(7) %43, i32 %19
  %45 = load <16 x i8>, ptr addrspace(7) %44, align 1
  %46 = or disjoint i32 %14, %21
  %47 = shl nuw nsw i32 %46, 14
  %48 = getelementptr i8, ptr addrspace(7) %6, i32 %47
  %49 = getelementptr i8, ptr addrspace(7) %48, i32 %19
  %50 = load <16 x i8>, ptr addrspace(7) %49, align 1
  %51 = or disjoint i32 %15, %21
  %52 = shl nuw nsw i32 %51, 14
  %53 = getelementptr i8, ptr addrspace(7) %6, i32 %52
  %54 = getelementptr i8, ptr addrspace(7) %53, i32 %19
  %55 = load <16 x i8>, ptr addrspace(7) %54, align 1
  %56 = or disjoint i32 %16, %21
  %57 = shl nuw nsw i32 %56, 14
  %58 = getelementptr i8, ptr addrspace(7) %6, i32 %57
  %59 = getelementptr i8, ptr addrspace(7) %58, i32 %19
  %60 = load <16 x i8>, ptr addrspace(7) %59, align 1
  %61 = or disjoint i32 %17, %21
  %62 = shl nuw nsw i32 %61, 14
  %63 = getelementptr i8, ptr addrspace(7) %6, i32 %62
  %64 = getelementptr i8, ptr addrspace(7) %63, i32 %19
  %65 = load <16 x i8>, ptr addrspace(7) %64, align 1
  %narrow = mul nuw nsw i32 %7, 264
  %narrow1 = add nuw nsw i32 %narrow, %19
  %66 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %narrow1
  store <16 x i8> %25, ptr addrspace(3) %66, align 8
  %narrow2 = mul nuw nsw i32 %11, 264
  %narrow3 = add nuw nsw i32 %narrow2, %19
  %67 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %narrow3
  store <16 x i8> zeroinitializer, ptr addrspace(3) %67, align 8
  %68 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow1
  store <16 x i8> %30, ptr addrspace(3) %68, align 8
  %69 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow3
  store <16 x i8> %35, ptr addrspace(3) %69, align 8
  %narrow4 = mul nuw nsw i32 %12, 264
  %70 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow4
  %71 = getelementptr i8, ptr addrspace(3) %70, i32 %19
  store <16 x i8> %40, ptr addrspace(3) %71, align 8
  %narrow6 = mul nuw nsw i32 %13, 264
  %72 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow6
  %73 = getelementptr i8, ptr addrspace(3) %72, i32 %19
  store <16 x i8> %45, ptr addrspace(3) %73, align 8
  %narrow8 = mul nuw nsw i32 %14, 264
  %74 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow8
  %75 = getelementptr i8, ptr addrspace(3) %74, i32 %19
  store <16 x i8> %50, ptr addrspace(3) %75, align 8
  %narrow10 = mul nuw nsw i32 %15, 264
  %76 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow10
  %77 = getelementptr i8, ptr addrspace(3) %76, i32 %19
  store <16 x i8> %55, ptr addrspace(3) %77, align 8
  %narrow12 = mul nuw nsw i32 %16, 264
  %78 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow12
  %79 = getelementptr i8, ptr addrspace(3) %78, i32 %19
  store <16 x i8> %60, ptr addrspace(3) %79, align 8
  %narrow14 = mul nuw nsw i32 %17, 264
  %80 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow14
  %81 = getelementptr i8, ptr addrspace(3) %80, i32 %19
  store <16 x i8> %65, ptr addrspace(3) %81, align 8
  %82 = or disjoint i32 %10, 32
  %83 = or disjoint i32 %10, 64
  %84 = or disjoint i32 %10, 96
  %85 = or disjoint i32 %10, 128
  %86 = or disjoint i32 %10, 160
  %87 = or disjoint i32 %10, 192
  %88 = or disjoint i32 %10, 224
  %89 = lshr i32 %4, 1
  %90 = and i32 %89, 32
  %91 = or disjoint i32 %90, %9
  %92 = or disjoint i32 %91, 16
  %narrow25 = mul nuw nsw i32 %9, 264
  %93 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %10
  %94 = getelementptr i8, ptr addrspace(3) %93, i32 %narrow25
  %95 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %82
  %96 = getelementptr i8, ptr addrspace(3) %95, i32 %narrow25
  %97 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %83
  %98 = getelementptr i8, ptr addrspace(3) %97, i32 %narrow25
  %99 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %84
  %100 = getelementptr i8, ptr addrspace(3) %99, i32 %narrow25
  %101 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %85
  %102 = getelementptr i8, ptr addrspace(3) %101, i32 %narrow25
  %103 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %86
  %104 = getelementptr i8, ptr addrspace(3) %103, i32 %narrow25
  %105 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %87
  %106 = getelementptr i8, ptr addrspace(3) %105, i32 %narrow25
  %107 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %88
  %108 = getelementptr i8, ptr addrspace(3) %107, i32 %narrow25
  %narrow26 = mul nuw nsw i32 %91, 264
  %109 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %10
  %110 = getelementptr i8, ptr addrspace(3) %109, i32 %narrow26
  %111 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %82
  %112 = getelementptr i8, ptr addrspace(3) %111, i32 %narrow26
  %113 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %83
  %114 = getelementptr i8, ptr addrspace(3) %113, i32 %narrow26
  %115 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %84
  %116 = getelementptr i8, ptr addrspace(3) %115, i32 %narrow26
  %117 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %85
  %118 = getelementptr i8, ptr addrspace(3) %117, i32 %narrow26
  %119 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %86
  %120 = getelementptr i8, ptr addrspace(3) %119, i32 %narrow26
  %121 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %87
  %122 = getelementptr i8, ptr addrspace(3) %121, i32 %narrow26
  %123 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %88
  %124 = getelementptr i8, ptr addrspace(3) %123, i32 %narrow26
  %narrow27 = mul nuw nsw i32 %92, 264
  %125 = getelementptr i8, ptr addrspace(3) %109, i32 %narrow27
  %126 = getelementptr i8, ptr addrspace(3) %111, i32 %narrow27
  %127 = getelementptr i8, ptr addrspace(3) %113, i32 %narrow27
  %128 = getelementptr i8, ptr addrspace(3) %115, i32 %narrow27
  %129 = getelementptr i8, ptr addrspace(3) %117, i32 %narrow27
  %130 = getelementptr i8, ptr addrspace(3) %119, i32 %narrow27
  %131 = getelementptr i8, ptr addrspace(3) %121, i32 %narrow27
  %132 = getelementptr i8, ptr addrspace(3) %123, i32 %narrow27
  br label %133

133:                                              ; preds = %3, %133
  %134 = phi [1 x [2 x [4 x <1 x float>]]] [ zeroinitializer, %3 ], [ %233, %133 ]
  %135 = phi i32 [ 0, %3 ], [ %136, %133 ]
  %136 = add nuw nsw i32 %135, 8
  %137 = shl nuw nsw i32 %136, 5
  %138 = or disjoint i32 %137, %19
  %139 = getelementptr i8, ptr addrspace(7) %23, i32 %138
  %140 = load <16 x i8>, ptr addrspace(7) %139, align 1
  %141 = getelementptr i8, ptr addrspace(7) %28, i32 %138
  %142 = load <16 x i8>, ptr addrspace(7) %141, align 1
  %143 = getelementptr i8, ptr addrspace(7) %34, i32 %137
  %144 = load <16 x i8>, ptr addrspace(7) %143, align 1
  %145 = getelementptr i8, ptr addrspace(7) %39, i32 %137
  %146 = load <16 x i8>, ptr addrspace(7) %145, align 1
  %147 = getelementptr i8, ptr addrspace(7) %44, i32 %137
  %148 = load <16 x i8>, ptr addrspace(7) %147, align 1
  %149 = getelementptr i8, ptr addrspace(7) %49, i32 %137
  %150 = load <16 x i8>, ptr addrspace(7) %149, align 1
  %151 = getelementptr i8, ptr addrspace(7) %54, i32 %137
  %152 = load <16 x i8>, ptr addrspace(7) %151, align 1
  %153 = getelementptr i8, ptr addrspace(7) %59, i32 %137
  %154 = load <16 x i8>, ptr addrspace(7) %153, align 1
  %155 = getelementptr i8, ptr addrspace(7) %64, i32 %137
  %156 = load <16 x i8>, ptr addrspace(7) %155, align 1
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %157 = load i64, ptr addrspace(3) %94, align 8
  %158 = load i64, ptr addrspace(3) %96, align 8
  %159 = load i64, ptr addrspace(3) %98, align 8
  %160 = load i64, ptr addrspace(3) %100, align 8
  %161 = load i64, ptr addrspace(3) %102, align 8
  %162 = load i64, ptr addrspace(3) %104, align 8
  %163 = load i64, ptr addrspace(3) %106, align 8
  %164 = load i64, ptr addrspace(3) %108, align 8
  %165 = load i64, ptr addrspace(3) %110, align 8
  %166 = load i64, ptr addrspace(3) %112, align 8
  %167 = load i64, ptr addrspace(3) %114, align 8
  %168 = load i64, ptr addrspace(3) %116, align 8
  %169 = load i64, ptr addrspace(3) %118, align 8
  %170 = load i64, ptr addrspace(3) %120, align 8
  %171 = load i64, ptr addrspace(3) %122, align 8
  %172 = load i64, ptr addrspace(3) %124, align 8
  %173 = load i64, ptr addrspace(3) %125, align 8
  %174 = load i64, ptr addrspace(3) %126, align 8
  %175 = load i64, ptr addrspace(3) %127, align 8
  %176 = load i64, ptr addrspace(3) %128, align 8
  %177 = load i64, ptr addrspace(3) %129, align 8
  %178 = load i64, ptr addrspace(3) %130, align 8
  %179 = load i64, ptr addrspace(3) %131, align 8
  %180 = load i64, ptr addrspace(3) %132, align 8
  %181 = extractvalue [1 x [2 x [4 x <1 x float>]]] %134, 0, 0, 0
  %182 = extractvalue [1 x [2 x [4 x <1 x float>]]] %134, 0, 0, 1
  %183 = shufflevector <1 x float> %181, <1 x float> %182, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %184 = extractvalue [1 x [2 x [4 x <1 x float>]]] %134, 0, 0, 2
  %185 = shufflevector <1 x float> %184, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %186 = shufflevector <4 x float> %183, <4 x float> %185, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %187 = extractvalue [1 x [2 x [4 x <1 x float>]]] %134, 0, 0, 3
  %188 = shufflevector <1 x float> %187, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %189 = shufflevector <4 x float> %186, <4 x float> %188, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %190 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %157, i64 %165, <4 x float> %189, i32 0, i32 0, i32 0)
  %191 = extractvalue [1 x [2 x [4 x <1 x float>]]] %134, 0, 1, 0
  %192 = extractvalue [1 x [2 x [4 x <1 x float>]]] %134, 0, 1, 1
  %193 = shufflevector <1 x float> %191, <1 x float> %192, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %194 = extractvalue [1 x [2 x [4 x <1 x float>]]] %134, 0, 1, 2
  %195 = shufflevector <1 x float> %194, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %196 = shufflevector <4 x float> %193, <4 x float> %195, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %197 = extractvalue [1 x [2 x [4 x <1 x float>]]] %134, 0, 1, 3
  %198 = shufflevector <1 x float> %197, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %199 = shufflevector <4 x float> %196, <4 x float> %198, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %200 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %157, i64 %173, <4 x float> %199, i32 0, i32 0, i32 0)
  %201 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %158, i64 %166, <4 x float> %190, i32 0, i32 0, i32 0)
  %202 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %158, i64 %174, <4 x float> %200, i32 0, i32 0, i32 0)
  %203 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %159, i64 %167, <4 x float> %201, i32 0, i32 0, i32 0)
  %204 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %159, i64 %175, <4 x float> %202, i32 0, i32 0, i32 0)
  %205 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %160, i64 %168, <4 x float> %203, i32 0, i32 0, i32 0)
  %206 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %160, i64 %176, <4 x float> %204, i32 0, i32 0, i32 0)
  %207 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %161, i64 %169, <4 x float> %205, i32 0, i32 0, i32 0)
  %208 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %161, i64 %177, <4 x float> %206, i32 0, i32 0, i32 0)
  %209 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %162, i64 %170, <4 x float> %207, i32 0, i32 0, i32 0)
  %210 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %162, i64 %178, <4 x float> %208, i32 0, i32 0, i32 0)
  %211 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %163, i64 %171, <4 x float> %209, i32 0, i32 0, i32 0)
  %212 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %163, i64 %179, <4 x float> %210, i32 0, i32 0, i32 0)
  %213 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %164, i64 %172, <4 x float> %211, i32 0, i32 0, i32 0)
  %214 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %164, i64 %180, <4 x float> %212, i32 0, i32 0, i32 0)
  %215 = shufflevector <4 x float> %213, <4 x float> poison, <1 x i32> zeroinitializer
  %216 = insertvalue [4 x <1 x float>] poison, <1 x float> %215, 0
  %217 = shufflevector <4 x float> %213, <4 x float> poison, <1 x i32> <i32 1>
  %218 = insertvalue [4 x <1 x float>] %216, <1 x float> %217, 1
  %219 = shufflevector <4 x float> %213, <4 x float> poison, <1 x i32> <i32 2>
  %220 = insertvalue [4 x <1 x float>] %218, <1 x float> %219, 2
  %221 = shufflevector <4 x float> %213, <4 x float> poison, <1 x i32> <i32 3>
  %222 = insertvalue [4 x <1 x float>] %220, <1 x float> %221, 3
  %223 = insertvalue [2 x [4 x <1 x float>]] zeroinitializer, [4 x <1 x float>] %222, 0
  %224 = shufflevector <4 x float> %214, <4 x float> poison, <1 x i32> zeroinitializer
  %225 = insertvalue [4 x <1 x float>] poison, <1 x float> %224, 0
  %226 = shufflevector <4 x float> %214, <4 x float> poison, <1 x i32> <i32 1>
  %227 = insertvalue [4 x <1 x float>] %225, <1 x float> %226, 1
  %228 = shufflevector <4 x float> %214, <4 x float> poison, <1 x i32> <i32 2>
  %229 = insertvalue [4 x <1 x float>] %227, <1 x float> %228, 2
  %230 = shufflevector <4 x float> %214, <4 x float> poison, <1 x i32> <i32 3>
  %231 = insertvalue [4 x <1 x float>] %229, <1 x float> %230, 3
  %232 = insertvalue [2 x [4 x <1 x float>]] %223, [4 x <1 x float>] %231, 1
  %233 = insertvalue [1 x [2 x [4 x <1 x float>]]] poison, [2 x [4 x <1 x float>]] %232, 0
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  tail call void @llvm.amdgcn.sched.barrier(i32 0)
  store <16 x i8> %140, ptr addrspace(3) %66, align 8
  store <16 x i8> zeroinitializer, ptr addrspace(3) %67, align 8
  store <16 x i8> %142, ptr addrspace(3) %68, align 8
  store <16 x i8> %144, ptr addrspace(3) %69, align 8
  store <16 x i8> %146, ptr addrspace(3) %71, align 8
  store <16 x i8> %148, ptr addrspace(3) %73, align 8
  store <16 x i8> %150, ptr addrspace(3) %75, align 8
  store <16 x i8> %152, ptr addrspace(3) %77, align 8
  store <16 x i8> %154, ptr addrspace(3) %79, align 8
  store <16 x i8> %156, ptr addrspace(3) %81, align 8
  %234 = icmp samesign ult i32 %135, 496
  br i1 %234, label %133, label %235

235:                                              ; preds = %133
  %236 = icmp samesign ult i32 %8, 2
  %237 = insertelement <8 x i1> poison, i1 %236, i64 0
  %238 = shufflevector <8 x i1> %237, <8 x i1> poison, <8 x i32> zeroinitializer
  %239 = mul nuw nsw i32 %8, 9216
  %240 = add nuw nsw i32 %239, 6912
  %241 = add nuw nsw i32 %239, 4608
  %242 = add nuw nsw i32 %239, 2304
  %243 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %2, i16 0, i64 73728, i32 159744)
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %244 = load i64, ptr addrspace(3) %94, align 8
  %245 = load i64, ptr addrspace(3) %96, align 8
  %246 = load i64, ptr addrspace(3) %98, align 8
  %247 = load i64, ptr addrspace(3) %100, align 8
  %248 = load i64, ptr addrspace(3) %102, align 8
  %249 = load i64, ptr addrspace(3) %104, align 8
  %250 = load i64, ptr addrspace(3) %106, align 8
  %251 = load i64, ptr addrspace(3) %108, align 8
  %252 = load i64, ptr addrspace(3) %110, align 8
  %253 = load i64, ptr addrspace(3) %112, align 8
  %254 = load i64, ptr addrspace(3) %114, align 8
  %255 = load i64, ptr addrspace(3) %116, align 8
  %256 = load i64, ptr addrspace(3) %118, align 8
  %257 = load i64, ptr addrspace(3) %120, align 8
  %258 = load i64, ptr addrspace(3) %122, align 8
  %259 = load i64, ptr addrspace(3) %124, align 8
  %260 = load i64, ptr addrspace(3) %125, align 8
  %261 = load i64, ptr addrspace(3) %126, align 8
  %262 = load i64, ptr addrspace(3) %127, align 8
  %263 = load i64, ptr addrspace(3) %128, align 8
  %264 = load i64, ptr addrspace(3) %129, align 8
  %265 = load i64, ptr addrspace(3) %130, align 8
  %266 = load i64, ptr addrspace(3) %131, align 8
  %267 = load i64, ptr addrspace(3) %132, align 8
  %268 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %244, i64 %252, <4 x float> %213, i32 0, i32 0, i32 0)
  %269 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %244, i64 %260, <4 x float> %214, i32 0, i32 0, i32 0)
  %270 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %245, i64 %253, <4 x float> %268, i32 0, i32 0, i32 0)
  %271 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %245, i64 %261, <4 x float> %269, i32 0, i32 0, i32 0)
  %272 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %246, i64 %254, <4 x float> %270, i32 0, i32 0, i32 0)
  %273 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %246, i64 %262, <4 x float> %271, i32 0, i32 0, i32 0)
  %274 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %247, i64 %255, <4 x float> %272, i32 0, i32 0, i32 0)
  %275 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %247, i64 %263, <4 x float> %273, i32 0, i32 0, i32 0)
  %276 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %248, i64 %256, <4 x float> %274, i32 0, i32 0, i32 0)
  %277 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %248, i64 %264, <4 x float> %275, i32 0, i32 0, i32 0)
  %278 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %249, i64 %257, <4 x float> %276, i32 0, i32 0, i32 0)
  %279 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %249, i64 %265, <4 x float> %277, i32 0, i32 0, i32 0)
  %280 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %250, i64 %258, <4 x float> %278, i32 0, i32 0, i32 0)
  %281 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %250, i64 %266, <4 x float> %279, i32 0, i32 0, i32 0)
  %282 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %251, i64 %259, <4 x float> %280, i32 0, i32 0, i32 0)
  %283 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64 %251, i64 %267, <4 x float> %281, i32 0, i32 0, i32 0)
  %284 = or disjoint i32 %91, %21
  %285 = or disjoint i32 %92, %21
  %286 = add nuw nsw i32 %284, %239
  %287 = add nuw nsw i32 %285, %239
  %288 = add nuw nsw i32 %242, %284
  %289 = add nuw nsw i32 %285, %242
  %290 = add nuw nsw i32 %241, %284
  %291 = add nuw nsw i32 %285, %241
  %292 = add nuw nsw i32 %240, %284
  %293 = add nuw nsw i32 %285, %240
  %294 = insertelement <8 x i32> poison, i32 %286, i64 0
  %295 = insertelement <8 x i32> %294, i32 %287, i64 1
  %296 = insertelement <8 x i32> %295, i32 %288, i64 2
  %297 = insertelement <8 x i32> %296, i32 %289, i64 3
  %298 = insertelement <8 x i32> %297, i32 %290, i64 4
  %299 = insertelement <8 x i32> %298, i32 %291, i64 5
  %300 = insertelement <8 x i32> %299, i32 %292, i64 6
  %301 = insertelement <8 x i32> %300, i32 %293, i64 7
  %302 = shufflevector <4 x float> %282, <4 x float> %283, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %303 = getelementptr float, ptr addrspace(7) %243, <8 x i32> %301
  tail call void @llvm.masked.scatter.v8f32.v8p7(<8 x float> %302, <8 x ptr addrspace(7)> align 4 %303, <8 x i1> %238)
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
declare <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.bf8.bf8(i64, i64, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #5

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
