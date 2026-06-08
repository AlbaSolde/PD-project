; ModuleID = '/home/albasg/Documentos/semestre-2/pd/project/GPU4S_Bench/gpu4s_benchmark/fast_fourier_transform_2D_bench/cpu_functions/proj_fft2d/fsolution/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%struct.COMPLEX = type { float, float }

; Function Attrs: argmemonly noinline willreturn
define i1 @apatb_FFT2D_flat_ir(%struct.COMPLEX* noalias nocapture nonnull readonly %c_flat, i32 %nx, i32 %ny, %struct.COMPLEX* noalias nocapture nonnull %out_flat) local_unnamed_addr #0 {
entry:
  %c_flat_copy = alloca i64, align 512
  %out_flat_copy = alloca i64, align 512
  call fastcc void @copy_in(%struct.COMPLEX* nonnull %c_flat, i64* nonnull align 512 %c_flat_copy, %struct.COMPLEX* nonnull %out_flat, i64* nonnull align 512 %out_flat_copy)
  %0 = call i1 @apatb_FFT2D_flat_hw(i64* %c_flat_copy, i32 %nx, i32 %ny, i64* %out_flat_copy)
  call void @copy_back(%struct.COMPLEX* %c_flat, i64* %c_flat_copy, %struct.COMPLEX* %out_flat, i64* %out_flat_copy)
  ret i1 %0
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in(%struct.COMPLEX* noalias readonly, i64* noalias align 512, %struct.COMPLEX* noalias readonly, i64* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.COMPLEX.118(i64* align 512 %1, %struct.COMPLEX* %0)
  call fastcc void @onebyonecpy_hls.p0struct.COMPLEX.118(i64* align 512 %3, %struct.COMPLEX* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out(%struct.COMPLEX* noalias, i64* noalias readonly align 512, %struct.COMPLEX* noalias, i64* noalias readonly align 512) unnamed_addr #2 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.COMPLEX(%struct.COMPLEX* %0, i64* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0struct.COMPLEX(%struct.COMPLEX* %2, i64* align 512 %3)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.COMPLEX(%struct.COMPLEX* noalias %dst, i64* noalias readonly align 512 %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %struct.COMPLEX* %dst, null
  %1 = icmp eq i64* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0 = getelementptr %struct.COMPLEX, %struct.COMPLEX* %dst, i64 0, i32 0
  %3 = load i64, i64* %src, align 512
  %.partselect1 = trunc i64 %3 to i32
  %4 = call float @_llvm.fpga.unpack.bits.f32.i32(i32 %.partselect1)
  store float %4, float* %dst.0, align 512
  %dst.1 = getelementptr %struct.COMPLEX, %struct.COMPLEX* %dst, i64 0, i32 1
  %5 = lshr i64 %3, 32
  %.partselect = trunc i64 %5 to i32
  %6 = call float @_llvm.fpga.unpack.bits.f32.i32(i32 %.partselect)
  store float %6, float* %dst.1, align 4
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: alwaysinline nounwind readnone willreturn
define internal float @_llvm.fpga.unpack.bits.f32.i32(i32 %A) #4 {
  %A.cast = bitcast i32 %A to float
  ret float %A.cast
}

; Function Attrs: alwaysinline nounwind readnone willreturn
define internal i32 @_llvm.fpga.pack.bits.i32.f32(float %A) #4 {
  %A.cast = bitcast float %A to i32
  ret i32 %A.cast
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.COMPLEX.118(i64* noalias align 512 %dst, %struct.COMPLEX* noalias readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq i64* %dst, null
  %1 = icmp eq %struct.COMPLEX* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0 = getelementptr %struct.COMPLEX, %struct.COMPLEX* %src, i64 0, i32 0
  %3 = load float, float* %src.0, align 4
  %4 = call i32 @_llvm.fpga.pack.bits.i32.f32(float %3)
  %5 = zext i32 %4 to i64
  %src.1 = getelementptr %struct.COMPLEX, %struct.COMPLEX* %src, i64 0, i32 1
  %6 = load float, float* %src.1, align 4
  %7 = call i32 @_llvm.fpga.pack.bits.i32.f32(float %6)
  %8 = zext i32 %7 to i64
  %9 = shl i64 %8, 32
  %.partset = or i64 %9, %5
  store i64 %.partset, i64* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare i8* @malloc(i64)

declare void @free(i8*)

declare i1 @apatb_FFT2D_flat_hw(i64*, i32, i32, i64*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back(%struct.COMPLEX* noalias, i64* noalias readonly align 512, %struct.COMPLEX* noalias, i64* noalias readonly align 512) unnamed_addr #2 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.COMPLEX(%struct.COMPLEX* %2, i64* align 512 %3)
  ret void
}

declare i1 @FFT2D_flat_hw_stub(%struct.COMPLEX* noalias nocapture nonnull readonly, i32, i32, %struct.COMPLEX* noalias nocapture nonnull)

define i1 @FFT2D_flat_hw_stub_wrapper(i64*, i32, i32, i64*) #5 {
entry:
  %4 = call i8* @malloc(i64 8)
  %5 = bitcast i8* %4 to %struct.COMPLEX*
  %6 = call i8* @malloc(i64 8)
  %7 = bitcast i8* %6 to %struct.COMPLEX*
  call void @copy_out(%struct.COMPLEX* %5, i64* %0, %struct.COMPLEX* %7, i64* %3)
  %8 = call i1 @FFT2D_flat_hw_stub(%struct.COMPLEX* %5, i32 %1, i32 %2, %struct.COMPLEX* %7)
  call void @copy_in(%struct.COMPLEX* %5, i64* %0, %struct.COMPLEX* %7, i64* %3)
  call void @free(i8* %4)
  call void @free(i8* %6)
  ret i1 %8
}

attributes #0 = { argmemonly noinline willreturn "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { alwaysinline nounwind readnone willreturn }
attributes #5 = { "fpga.wrapper.func"="stub" }

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
