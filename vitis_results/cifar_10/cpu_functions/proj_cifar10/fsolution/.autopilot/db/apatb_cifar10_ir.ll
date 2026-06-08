; ModuleID = '/home/albasg/Documentos/semestre-2/pd/project/GPU4S_Bench/gpu4s_benchmark/cifar_10/cpu_functions/proj_cifar10/fsolution/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: inaccessiblemem_or_argmemonly noinline willreturn
define void @apatb_cifar10_ir(float* noalias nocapture nonnull "maxi" %output_data, float* noalias nocapture nonnull "maxi" %conv_1_output, float* noalias nocapture nonnull "maxi" %pooling_1_output, float* noalias nocapture nonnull "maxi" %conv_2_output, float* noalias nocapture nonnull "maxi" %pooling_2_output, float* noalias nocapture nonnull "maxi" %dense_layer_1_output, float* noalias nocapture nonnull "maxi" %dense_layer_2_output, float* noalias nocapture nonnull readonly "maxi" %input_data, float* noalias nocapture nonnull readonly "maxi" %kernel_1_data, float* noalias nocapture nonnull readonly "maxi" %kernel_2_data, float* noalias nocapture nonnull readonly "maxi" %weights_1, float* noalias nocapture nonnull readonly "maxi" %weights_2, i32 %input_data_size, i32 %output_data_size, i32 %kernel_1_size, i32 %kernel_2_size, i32 %stride_1_size, i32 %stride_2_size, i32 %neurons_dense_1_size, i32 %neurons_dense_2_size) local_unnamed_addr #0 {
entry:
  %output_data_copy = alloca float, align 512
  %conv_1_output_copy = alloca float, align 512
  %pooling_1_output_copy = alloca float, align 512
  %conv_2_output_copy = alloca float, align 512
  %pooling_2_output_copy = alloca float, align 512
  %dense_layer_1_output_copy = alloca float, align 512
  %dense_layer_2_output_copy = alloca float, align 512
  %input_data_copy = alloca float, align 512
  %kernel_1_data_copy = alloca float, align 512
  %kernel_2_data_copy = alloca float, align 512
  %weights_1_copy = alloca float, align 512
  %weights_2_copy = alloca float, align 512
  call fastcc void @copy_in(float* nonnull %output_data, float* nonnull align 512 %output_data_copy, float* nonnull %conv_1_output, float* nonnull align 512 %conv_1_output_copy, float* nonnull %pooling_1_output, float* nonnull align 512 %pooling_1_output_copy, float* nonnull %conv_2_output, float* nonnull align 512 %conv_2_output_copy, float* nonnull %pooling_2_output, float* nonnull align 512 %pooling_2_output_copy, float* nonnull %dense_layer_1_output, float* nonnull align 512 %dense_layer_1_output_copy, float* nonnull %dense_layer_2_output, float* nonnull align 512 %dense_layer_2_output_copy, float* nonnull %input_data, float* nonnull align 512 %input_data_copy, float* nonnull %kernel_1_data, float* nonnull align 512 %kernel_1_data_copy, float* nonnull %kernel_2_data, float* nonnull align 512 %kernel_2_data_copy, float* nonnull %weights_1, float* nonnull align 512 %weights_1_copy, float* nonnull %weights_2, float* nonnull align 512 %weights_2_copy)
  call void @apatb_cifar10_hw(float* %output_data_copy, float* %conv_1_output_copy, float* %pooling_1_output_copy, float* %conv_2_output_copy, float* %pooling_2_output_copy, float* %dense_layer_1_output_copy, float* %dense_layer_2_output_copy, float* %input_data_copy, float* %kernel_1_data_copy, float* %kernel_2_data_copy, float* %weights_1_copy, float* %weights_2_copy, i32 %input_data_size, i32 %output_data_size, i32 %kernel_1_size, i32 %kernel_2_size, i32 %stride_1_size, i32 %stride_2_size, i32 %neurons_dense_1_size, i32 %neurons_dense_2_size)
  call void @copy_back(float* %output_data, float* %output_data_copy, float* %conv_1_output, float* %conv_1_output_copy, float* %pooling_1_output, float* %pooling_1_output_copy, float* %conv_2_output, float* %conv_2_output_copy, float* %pooling_2_output, float* %pooling_2_output_copy, float* %dense_layer_1_output, float* %dense_layer_1_output_copy, float* %dense_layer_2_output, float* %dense_layer_2_output_copy, float* %input_data, float* %input_data_copy, float* %kernel_1_data, float* %kernel_1_data_copy, float* %kernel_2_data, float* %kernel_2_data_copy, float* %weights_1, float* %weights_1_copy, float* %weights_2, float* %weights_2_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in(float* noalias readonly, float* noalias align 512, float* noalias readonly, float* noalias align 512, float* noalias readonly, float* noalias align 512, float* noalias readonly, float* noalias align 512, float* noalias readonly, float* noalias align 512, float* noalias readonly, float* noalias align 512, float* noalias readonly, float* noalias align 512, float* noalias readonly, float* noalias align 512, float* noalias readonly, float* noalias align 512, float* noalias readonly, float* noalias align 512, float* noalias readonly, float* noalias align 512, float* noalias readonly, float* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0f32(float* align 512 %1, float* %0)
  call fastcc void @onebyonecpy_hls.p0f32(float* align 512 %3, float* %2)
  call fastcc void @onebyonecpy_hls.p0f32(float* align 512 %5, float* %4)
  call fastcc void @onebyonecpy_hls.p0f32(float* align 512 %7, float* %6)
  call fastcc void @onebyonecpy_hls.p0f32(float* align 512 %9, float* %8)
  call fastcc void @onebyonecpy_hls.p0f32(float* align 512 %11, float* %10)
  call fastcc void @onebyonecpy_hls.p0f32(float* align 512 %13, float* %12)
  call fastcc void @onebyonecpy_hls.p0f32(float* align 512 %15, float* %14)
  call fastcc void @onebyonecpy_hls.p0f32(float* align 512 %17, float* %16)
  call fastcc void @onebyonecpy_hls.p0f32(float* align 512 %19, float* %18)
  call fastcc void @onebyonecpy_hls.p0f32(float* align 512 %21, float* %20)
  call fastcc void @onebyonecpy_hls.p0f32(float* align 512 %23, float* %22)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0f32(float* noalias align 512 %dst, float* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq float* %dst, null
  %1 = icmp eq float* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %3 = load float, float* %src, align 4
  store float %3, float* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out(float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0f32(float* %0, float* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0f32(float* %2, float* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0f32(float* %4, float* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0f32(float* %6, float* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0f32(float* %8, float* align 512 %9)
  call fastcc void @onebyonecpy_hls.p0f32(float* %10, float* align 512 %11)
  call fastcc void @onebyonecpy_hls.p0f32(float* %12, float* align 512 %13)
  call fastcc void @onebyonecpy_hls.p0f32(float* %14, float* align 512 %15)
  call fastcc void @onebyonecpy_hls.p0f32(float* %16, float* align 512 %17)
  call fastcc void @onebyonecpy_hls.p0f32(float* %18, float* align 512 %19)
  call fastcc void @onebyonecpy_hls.p0f32(float* %20, float* align 512 %21)
  call fastcc void @onebyonecpy_hls.p0f32(float* %22, float* align 512 %23)
  ret void
}

declare void @apatb_cifar10_hw(float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, i32, i32, i32, i32, i32, i32, i32, i32)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back(float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512, float* noalias, float* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0f32(float* %0, float* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0f32(float* %2, float* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0f32(float* %4, float* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0f32(float* %6, float* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0f32(float* %8, float* align 512 %9)
  call fastcc void @onebyonecpy_hls.p0f32(float* %10, float* align 512 %11)
  call fastcc void @onebyonecpy_hls.p0f32(float* %12, float* align 512 %13)
  ret void
}

declare void @cifar10_hw_stub(float* noalias nocapture nonnull, float* noalias nocapture nonnull, float* noalias nocapture nonnull, float* noalias nocapture nonnull, float* noalias nocapture nonnull, float* noalias nocapture nonnull, float* noalias nocapture nonnull, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, float* noalias nocapture nonnull readonly, i32, i32, i32, i32, i32, i32, i32, i32)

define void @cifar10_hw_stub_wrapper(float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, i32, i32, i32, i32, i32, i32, i32, i32) #4 {
entry:
  call void @copy_out(float* null, float* %0, float* null, float* %1, float* null, float* %2, float* null, float* %3, float* null, float* %4, float* null, float* %5, float* null, float* %6, float* null, float* %7, float* null, float* %8, float* null, float* %9, float* null, float* %10, float* null, float* %11)
  call void @cifar10_hw_stub(float* %0, float* %1, float* %2, float* %3, float* %4, float* %5, float* %6, float* %7, float* %8, float* %9, float* %10, float* %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18, i32 %19)
  call void @copy_in(float* null, float* %0, float* null, float* %1, float* null, float* %2, float* null, float* %3, float* null, float* %4, float* null, float* %5, float* null, float* %6, float* null, float* %7, float* null, float* %8, float* null, float* %9, float* null, float* %10, float* null, float* %11)
  ret void
}

attributes #0 = { inaccessiblemem_or_argmemonly noinline willreturn "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1}
!llvm.module.flags = !{!2, !3, !4}
!blackbox_cfg = !{!5}

!0 = !{!"AMD/Xilinx clang version 16.0.6"}
!1 = !{!"clang version 7.0.0 "}
!2 = !{i32 2, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{}
