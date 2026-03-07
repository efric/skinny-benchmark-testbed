module {
  util.global private @__device_0 = #hal.device.target<"hip", [#hal.executable.target<"rocm", "rocm-hsaco-fb", {abi = "hip", iree.encoding.resolver = #iree_gpu.gpu_encoding_resolver<>, iree_codegen.default_tuning_spec = #rocm.builtin.tuning_module<"iree_default_tuning_spec_gfx942.mlir">, iree_codegen.target_info = #iree_gpu.target<arch = "gfx942", features = "", wgp = <compute =  fp64|fp32|fp16|int64|int32|int16|int8, storage =  b64|b32|b16|b8, subgroup =  shuffle|arithmetic, dot =  dp4xi8toi32, mma = [<MFMA_F32_16x16x16_BF16>, <MFMA_F32_32x32x8_BF16>, <MFMA_F32_16x16x32_F8E5M2FNUZ>, <MFMA_F32_16x16x32_F8E5M2FNUZ_F8E4M3FNUZ>, <MFMA_F32_16x16x32_F8E4M3FNUZ>, <MFMA_F32_16x16x32_F8E4M3FNUZ_F8E5M2FNUZ>, <MFMA_F32_32x32x16_F8E5M2FNUZ>, <MFMA_F32_32x32x16_F8E5M2FNUZ_F8E4M3FNUZ>, <MFMA_F32_32x32x16_F8E4M3FNUZ>, <MFMA_F32_32x32x16_F8E4M3FNUZ_F8E5M2FNUZ>, <MFMA_I32_16x16x32_I8>, <MFMA_I32_32x32x16_I8>, <MFMA_F64_16x16x4_F64>, <MFMA_F32_16x16x4_F32>, <MFMA_F32_16x16x16_F16>, <MFMA_F32_32x32x8_F16>], subgroup_size_choices = [64], max_workgroup_sizes = [1024, 1024, 1024], max_thread_count_per_workgroup = 1024, max_workgroup_memory_bytes = 65536, max_workgroup_counts = [2147483647, 2147483647, 2147483647], max_load_instruction_bits = 128, simds_per_wgp = 4, vgpr_space_bits = 16384, dma_sizes = [32], workgroup_memory_bank_count = 32>>, ukernels = "none"}>]> : !hal.device
  hal.executable private @matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0 {
    hal.executable.variant public @rocm_hsaco_fb target(<"rocm", "rocm-hsaco-fb", {abi = "hip", iree.encoding.resolver = #iree_gpu.gpu_encoding_resolver<>, iree_codegen.default_tuning_spec = #rocm.builtin.tuning_module<"iree_default_tuning_spec_gfx942.mlir">, iree_codegen.target_info = #iree_gpu.target<arch = "gfx942", features = "", wgp = <compute =  fp64|fp32|fp16|int64|int32|int16|int8, storage =  b64|b32|b16|b8, subgroup =  shuffle|arithmetic, dot =  dp4xi8toi32, mma = [<MFMA_F32_16x16x16_BF16>, <MFMA_F32_32x32x8_BF16>, <MFMA_F32_16x16x32_F8E5M2FNUZ>, <MFMA_F32_16x16x32_F8E5M2FNUZ_F8E4M3FNUZ>, <MFMA_F32_16x16x32_F8E4M3FNUZ>, <MFMA_F32_16x16x32_F8E4M3FNUZ_F8E5M2FNUZ>, <MFMA_F32_32x32x16_F8E5M2FNUZ>, <MFMA_F32_32x32x16_F8E5M2FNUZ_F8E4M3FNUZ>, <MFMA_F32_32x32x16_F8E4M3FNUZ>, <MFMA_F32_32x32x16_F8E4M3FNUZ_F8E5M2FNUZ>, <MFMA_I32_16x16x32_I8>, <MFMA_I32_32x32x16_I8>, <MFMA_F64_16x16x4_F64>, <MFMA_F32_16x16x4_F32>, <MFMA_F32_16x16x16_F16>, <MFMA_F32_32x32x8_F16>], subgroup_size_choices = [64], max_workgroup_sizes = [1024, 1024, 1024], max_thread_count_per_workgroup = 1024, max_workgroup_memory_bytes = 65536, max_workgroup_counts = [2147483647, 2147483647, 2147483647], max_load_instruction_bits = 128, simds_per_wgp = 4, vgpr_space_bits = 16384, dma_sizes = [32], workgroup_memory_bank_count = 32>>, ukernels = "none"}>) {
      hal.executable.export public @matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_matmul_like_8x2304x16384_f8E4M3FNUZxf8E4M3FNUZxf32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
        %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
        hal.return %x, %y, %z : index, index, index
      }
      builtin.module {
        func.func @matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_matmul_like_8x2304x16384_f8E4M3FNUZxf8E4M3FNUZxf32() attributes {translation_info = #iree_codegen.translation_info<pipeline = LLVMGPUTileAndFuse workgroup_size = [128, 1, 1] subgroup_size = 64, {gpu_pipeline_options = #iree_gpu.pipeline_options<prefetch_num_stages = 2, no_reduce_shared_memory_bank_conflicts = false, use_igemm_convolution = false>}>} {
          %cst = arith.constant 0.000000e+00 : f32
          %c0 = arith.constant 0 : index
          %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<8x16384xf8E4M3FNUZ, #hal.descriptor_type<storage_buffer>>
          %1 = amdgpu.fat_raw_buffer_cast %0 resetOffset : memref<8x16384xf8E4M3FNUZ, #hal.descriptor_type<storage_buffer>> to memref<8x16384xf8E4M3FNUZ, #amdgpu.address_space<fat_raw_buffer>>
          %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<2304x16384xf8E4M3FNUZ, #hal.descriptor_type<storage_buffer>>
          %3 = amdgpu.fat_raw_buffer_cast %2 resetOffset : memref<2304x16384xf8E4M3FNUZ, #hal.descriptor_type<storage_buffer>> to memref<2304x16384xf8E4M3FNUZ, #amdgpu.address_space<fat_raw_buffer>>
          %4 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : memref<8x2304xf32, #hal.descriptor_type<storage_buffer>>
          %5 = amdgpu.fat_raw_buffer_cast %4 resetOffset : memref<8x2304xf32, #hal.descriptor_type<storage_buffer>> to memref<8x2304xf32, #amdgpu.address_space<fat_raw_buffer>>
          %6 = iree_codegen.load_from_buffer %1 : memref<8x16384xf8E4M3FNUZ, #amdgpu.address_space<fat_raw_buffer>> -> tensor<8x16384xf8E4M3FNUZ>
          %7 = iree_codegen.load_from_buffer %3 : memref<2304x16384xf8E4M3FNUZ, #amdgpu.address_space<fat_raw_buffer>> -> tensor<2304x16384xf8E4M3FNUZ>
          %8 = tensor.empty() : tensor<8x2304xf32>
          %9 = linalg.fill ins(%cst : f32) outs(%8 : tensor<8x2304xf32>) -> tensor<8x2304xf32>
          %10 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = ["parallel", "parallel", "reduction"]} ins(%6, %7 : tensor<8x16384xf8E4M3FNUZ>, tensor<2304x16384xf8E4M3FNUZ>) outs(%9 : tensor<8x2304xf32>) attrs =  {lowering_config = #iree_gpu.lowering_config<{mma_kind = #iree_gpu.virtual_mma_layout<VDMFMA_F32_8x16x128_F8E4M3FNUZ>, promote_operands = [0, 1], reduction = [0, 0, 2], subgroup = [1, 2, 0], workgroup = [8, 64, 0]}>} {
          ^bb0(%in: f8E4M3FNUZ, %in_0: f8E4M3FNUZ, %out: f32):
            %11 = arith.extf %in : f8E4M3FNUZ to f32
            %12 = arith.extf %in_0 : f8E4M3FNUZ to f32
            %13 = arith.mulf %11, %12 : f32
            %14 = arith.addf %out, %13 : f32
            linalg.yield %14 : f32
          } -> tensor<8x2304xf32>
          iree_codegen.store_to_buffer %10, %5 : tensor<8x2304xf32> into memref<8x2304xf32, #amdgpu.address_space<fat_raw_buffer>>
          return
        }
      }
    }
  }
  util.global private mutable @matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_rocm_hsaco_fb_matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_matmul_like_8x2304x16384_f8E4M3FNUZxf8E4M3FNUZxf32_buffer : !hal.buffer
  util.initializer {
    %device, %queue_affinity = hal.device.resolve on(#hal.device.affinity<@__device_0>) : !hal.device, i64
    %allocator = hal.device.allocator<%device : !hal.device> : !hal.allocator
    %memory_type = hal.memory_type<"DeviceVisible|DeviceLocal"> : i32
    %buffer_usage = hal.buffer_usage<"TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage"> : i32
    %c37953536 = arith.constant 37953536 : index
    %buffer = hal.allocator.allocate<%allocator : !hal.allocator> affinity(%queue_affinity) type(%memory_type) usage(%buffer_usage) : !hal.buffer{%c37953536}
    util.global.store %buffer, @matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_rocm_hsaco_fb_matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_matmul_like_8x2304x16384_f8E4M3FNUZxf8E4M3FNUZxf32_buffer : !hal.buffer
    util.return
  }
  util.func public @matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_rocm_hsaco_fb_matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_matmul_like_8x2304x16384_f8E4M3FNUZxf8E4M3FNUZxf32(%arg0: i32) attributes {iree.abi.stub, iree.reflection = {iree.benchmark = "dispatch"}} {
    %0 = arith.index_cast %arg0 : i32 to index
    %device, %queue_affinity = hal.device.resolve on(#hal.device.affinity<@__device_0>) : !hal.device, i64
    %cmd = hal.command_buffer.create device(%device : !hal.device) mode("OneShot|AllowInlineExecution") categories(Dispatch) affinity(%queue_affinity) : !hal.command_buffer
    %matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_rocm_hsaco_fb_matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_matmul_like_8x2304x16384_f8E4M3FNUZxf8E4M3FNUZxf32_buffer = util.global.load @matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_rocm_hsaco_fb_matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_matmul_like_8x2304x16384_f8E4M3FNUZxf8E4M3FNUZxf32_buffer : !hal.buffer
    %c0 = arith.constant 0 : index
    %c131072 = arith.constant 131072 : index
    %c37748736 = arith.constant 37748736 : index
    %c37879808 = arith.constant 37879808 : index
    %c73728 = arith.constant 73728 : index
    %workgroup_x, %workgroup_y, %workgroup_z = hal.executable.calculate_workgroups device(%device : !hal.device) target(@matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0::@rocm_hsaco_fb::@matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_matmul_like_8x2304x16384_f8E4M3FNUZxf8E4M3FNUZxf32) : index, index, index
    %exe = hal.executable.lookup device(%device : !hal.device) executable(@matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0) : !hal.executable
    %ordinal = hal.executable.export.ordinal target(@matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0::@rocm_hsaco_fb::@matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_matmul_like_8x2304x16384_f8E4M3FNUZxf8E4M3FNUZxf32) : index
    %c1 = arith.constant 1 : index
    scf.for %arg1 = %c0 to %0 step %c1 {
      hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%exe : !hal.executable)[%ordinal] workgroups([%workgroup_x, %workgroup_y, %workgroup_z]) bindings([
        (%matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_rocm_hsaco_fb_matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_matmul_like_8x2304x16384_f8E4M3FNUZxf8E4M3FNUZxf32_buffer : !hal.buffer)[%c0, %c131072], 
        (%matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_rocm_hsaco_fb_matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_matmul_like_8x2304x16384_f8E4M3FNUZxf8E4M3FNUZxf32_buffer : !hal.buffer)[%c131072, %c37748736], 
        (%matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_rocm_hsaco_fb_matmul_f8E4M3FNUZ_8x2304x16384_dispatch_0_matmul_like_8x2304x16384_f8E4M3FNUZxf8E4M3FNUZxf32_buffer : !hal.buffer)[%c37879808, %c73728]
      ]) flags("None")
      hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|CommandRetire") target("CommandIssue|Dispatch") flags("None")
    }
    hal.command_buffer.finalize<%cmd : !hal.command_buffer>
    %1 = util.null : !hal.fence
    %fence = hal.fence.create device(%device : !hal.device) flags("None") : !hal.fence
    hal.device.queue.execute<%device : !hal.device> affinity(%queue_affinity) wait(%1) signal(%fence) commands(%cmd) flags("None")
    %c-1_i32 = arith.constant -1 : i32
    %status = hal.fence.await until([%fence]) timeout_millis(%c-1_i32) flags("None") : i32
    util.status.check_ok %status, "failed to wait on timepoint"
    util.return
  }
}
