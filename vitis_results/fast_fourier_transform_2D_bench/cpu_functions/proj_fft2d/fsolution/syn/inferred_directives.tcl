# Inferred from syn.array_partition.complete_threshold=4
set_directive_array_partition hotbm_::sin_or_cos<float>/out_bits.i -dim=1 -type=complete out_bits.i
set_directive_array_partition hotbm_::sin_or_cos<float>/c.i -dim=1 -type=complete c.i
# Inferred from syn.compile.pipeline_loops=64
set_directive_pipeline hotbm_::sin_or_cos<float>/anonymous
set_directive_pipeline fft2d_flat/VITIS_LOOP_59_1
set_directive_pipeline fft2d_flat/VITIS_LOOP_37_5
set_directive_pipeline hotbm_::sin_or_cos<float>/anonymous
set_directive_pipeline hotbm_::sin_or_cos<float>/anonymous
set_directive_pipeline fft2d_flat/VITIS_LOOP_21_2
set_directive_pipeline fft2d_flat/VITIS_LOOP_72_5
set_directive_pipeline fft2d_flat/VITIS_LOOP_69_4
