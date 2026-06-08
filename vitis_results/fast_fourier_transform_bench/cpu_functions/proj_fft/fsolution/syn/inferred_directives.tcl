# Inferred from syn.array_partition.complete_threshold=4
set_directive_array_partition hotbm_::sin_or_cos<double>/out_bits.i -dim=1 -type=complete out_bits.i
set_directive_array_partition hotbm_::sin_or_cos<double>/c.i -dim=1 -type=complete c.i
# Inferred from syn.compile.pipeline_loops=64
set_directive_pipeline hotbm_::sin_or_cos<double>/anonymous
set_directive_pipeline fft_function/VITIS_LOOP_18_2
set_directive_pipeline fft_function/VITIS_LOOP_37_5
set_directive_pipeline hotbm_::sin_or_cos<double>/anonymous
set_directive_pipeline hotbm_::sin_or_cos<double>/anonymous
set_directive_pipeline hotbm_::sin_or_cos<double>/anonymous
