set SynModuleInfo {
  {SRCNAME FFT2D_flat_Pipeline_VITIS_LOOP_21_2 MODELNAME FFT2D_flat_Pipeline_VITIS_LOOP_21_2 RTLNAME FFT2D_flat_FFT2D_flat_Pipeline_VITIS_LOOP_21_2
    SUBMODULES {
      {MODELNAME FFT2D_flat_flow_control_loop_pipe_sequential_init RTLNAME FFT2D_flat_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME FFT2D_flat_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME FFT2D_flat_Outline_VITIS_LOOP_19_1 MODELNAME FFT2D_flat_Outline_VITIS_LOOP_19_1 RTLNAME FFT2D_flat_FFT2D_flat_Outline_VITIS_LOOP_19_1}
  {SRCNAME sin_or_cos<float>_Pipeline_1 MODELNAME sin_or_cos_float_Pipeline_1 RTLNAME FFT2D_flat_sin_or_cos_float_Pipeline_1
    SUBMODULES {
      {MODELNAME FFT2D_flat_ctlz_32_32_1_1 RTLNAME FFT2D_flat_ctlz_32_32_1_1 BINDTYPE op TYPE ctlz IMPL auto}
    }
  }
  {SRCNAME sin_or_cos<float>_Pipeline_2 MODELNAME sin_or_cos_float_Pipeline_2 RTLNAME FFT2D_flat_sin_or_cos_float_Pipeline_2}
  {SRCNAME sin_or_cos<float> MODELNAME sin_or_cos_float_s RTLNAME FFT2D_flat_sin_or_cos_float_s
    SUBMODULES {
      {MODELNAME FFT2D_flat_mul_23s_22ns_45_1_1 RTLNAME FFT2D_flat_mul_23s_22ns_45_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME FFT2D_flat_mul_30s_29ns_58_2_1 RTLNAME FFT2D_flat_mul_30s_29ns_58_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME FFT2D_flat_mul_80s_24ns_80_5_1 RTLNAME FFT2D_flat_mul_80s_24ns_80_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME FFT2D_flat_sparsemux_17_3_1_1_1 RTLNAME FFT2D_flat_sparsemux_17_3_1_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME FFT2D_flat_ctlz_30_30_1_1 RTLNAME FFT2D_flat_ctlz_30_30_1_1 BINDTYPE op TYPE ctlz IMPL auto}
      {MODELNAME FFT2D_flat_sparsemux_33_4_1_1_1 RTLNAME FFT2D_flat_sparsemux_33_4_1_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME FFT2D_flat_mul_15ns_15ns_30_1_1 RTLNAME FFT2D_flat_mul_15ns_15ns_30_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME FFT2D_flat_mul_15ns_15s_30_1_1 RTLNAME FFT2D_flat_mul_15ns_15s_30_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME FFT2D_flat_sin_or_cos_float_s_ref_4oPi_table_100_ROM_1P_LUTRAM_1R RTLNAME FFT2D_flat_sin_or_cos_float_s_ref_4oPi_table_100_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME FFT2D_flat_sin_or_cos_float_s_second_order_float_sin_cos_K0_ROM_1P_LUTRAM_1R RTLNAME FFT2D_flat_sin_or_cos_float_s_second_order_float_sin_cos_K0_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME FFT2D_flat_sin_or_cos_float_s_second_order_float_sin_cos_K1_ROM_1P_LUTRAM_1R RTLNAME FFT2D_flat_sin_or_cos_float_s_second_order_float_sin_cos_K1_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME FFT2D_flat_sin_or_cos_float_s_second_order_float_sin_cos_K2_ROM_1P_LUTRAM_1R RTLNAME FFT2D_flat_sin_or_cos_float_s_second_order_float_sin_cos_K2_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME FFT2D_flat_Pipeline_VITIS_LOOP_37_5 MODELNAME FFT2D_flat_Pipeline_VITIS_LOOP_37_5 RTLNAME FFT2D_flat_FFT2D_flat_Pipeline_VITIS_LOOP_37_5}
  {SRCNAME FFT2D_flat_Outline_VITIS_LOOP_30_3 MODELNAME FFT2D_flat_Outline_VITIS_LOOP_30_3 RTLNAME FFT2D_flat_FFT2D_flat_Outline_VITIS_LOOP_30_3}
  {SRCNAME FFT2D_flat_Pipeline_VITIS_LOOP_69_4 MODELNAME FFT2D_flat_Pipeline_VITIS_LOOP_69_4 RTLNAME FFT2D_flat_FFT2D_flat_Pipeline_VITIS_LOOP_69_4}
  {SRCNAME FFT2D_flat_Pipeline_VITIS_LOOP_21_21 MODELNAME FFT2D_flat_Pipeline_VITIS_LOOP_21_21 RTLNAME FFT2D_flat_FFT2D_flat_Pipeline_VITIS_LOOP_21_21}
  {SRCNAME FFT2D_flat_Pipeline_VITIS_LOOP_37_52 MODELNAME FFT2D_flat_Pipeline_VITIS_LOOP_37_52 RTLNAME FFT2D_flat_FFT2D_flat_Pipeline_VITIS_LOOP_37_52}
  {SRCNAME FFT2D_flat_Pipeline_VITIS_LOOP_72_5 MODELNAME FFT2D_flat_Pipeline_VITIS_LOOP_72_5 RTLNAME FFT2D_flat_FFT2D_flat_Pipeline_VITIS_LOOP_72_5}
  {SRCNAME FFT2D_flat MODELNAME FFT2D_flat RTLNAME FFT2D_flat IS_TOP 1
    SUBMODULES {
      {MODELNAME FFT2D_flat_fptrunc_64ns_32_2_no_dsp_1 RTLNAME FFT2D_flat_fptrunc_64ns_32_2_no_dsp_1 BINDTYPE op TYPE fptrunc IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME FFT2D_flat_ddiv_64ns_64ns_64_59_no_dsp_1 RTLNAME FFT2D_flat_ddiv_64ns_64ns_64_59_no_dsp_1 BINDTYPE op TYPE ddiv IMPL fabric LATENCY 58 ALLOW_PRAGMA 1}
      {MODELNAME FFT2D_flat_sitodp_32s_64_6_no_dsp_1 RTLNAME FFT2D_flat_sitodp_32s_64_6_no_dsp_1 BINDTYPE op TYPE sitodp IMPL auto LATENCY 5 ALLOW_PRAGMA 1}
      {MODELNAME FFT2D_flat_mul_32s_32s_32_2_1 RTLNAME FFT2D_flat_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME FFT2D_flat_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME FFT2D_flat_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME FFT2D_flat_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME FFT2D_flat_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME FFT2D_flat_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME FFT2D_flat_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME FFT2D_flat_col_x_RAM_AUTO_1R1W RTLNAME FFT2D_flat_col_x_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
