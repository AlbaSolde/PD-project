set SynModuleInfo {
  {SRCNAME aux_fft_function_Pipeline_VITIS_LOOP_21_2 MODELNAME aux_fft_function_Pipeline_VITIS_LOOP_21_2 RTLNAME fft_function_aux_fft_function_Pipeline_VITIS_LOOP_21_2
    SUBMODULES {
      {MODELNAME fft_function_flow_control_loop_pipe_sequential_init RTLNAME fft_function_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME fft_function_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME aux_fft_function_Outline_VITIS_LOOP_14_1 MODELNAME aux_fft_function_Outline_VITIS_LOOP_14_1 RTLNAME fft_function_aux_fft_function_Outline_VITIS_LOOP_14_1}
  {SRCNAME sin_or_cos<double>_Pipeline_1 MODELNAME sin_or_cos_double_Pipeline_1 RTLNAME fft_function_sin_or_cos_double_Pipeline_1}
  {SRCNAME sin_or_cos<double>_Pipeline_2 MODELNAME sin_or_cos_double_Pipeline_2 RTLNAME fft_function_sin_or_cos_double_Pipeline_2
    SUBMODULES {
      {MODELNAME fft_function_partselect_16ns_63ns_6ns_16_1_1 RTLNAME fft_function_partselect_16ns_63ns_6ns_16_1_1 BINDTYPE op TYPE partselect IMPL auto}
    }
  }
  {SRCNAME sin_or_cos<double>_Pipeline_3 MODELNAME sin_or_cos_double_Pipeline_3 RTLNAME fft_function_sin_or_cos_double_Pipeline_3
    SUBMODULES {
      {MODELNAME fft_function_sparsemux_9_2_32_1_1 RTLNAME fft_function_sparsemux_9_2_32_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME fft_function_ctlz_32_32_1_1 RTLNAME fft_function_ctlz_32_32_1_1 BINDTYPE op TYPE ctlz IMPL auto}
    }
  }
  {SRCNAME sin_or_cos<double>_Pipeline_4 MODELNAME sin_or_cos_double_Pipeline_4 RTLNAME fft_function_sin_or_cos_double_Pipeline_4}
  {SRCNAME sin_or_cos<double> MODELNAME sin_or_cos_double_s RTLNAME fft_function_sin_or_cos_double_s
    SUBMODULES {
      {MODELNAME fft_function_mul_35ns_25ns_60_2_1 RTLNAME fft_function_mul_35ns_25ns_60_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_mul_42ns_33ns_75_2_1 RTLNAME fft_function_mul_42ns_33ns_75_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_mul_49ns_44s_93_5_1 RTLNAME fft_function_mul_49ns_44s_93_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_mul_49ns_49ns_98_5_1 RTLNAME fft_function_mul_49ns_49ns_98_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_mul_56ns_52s_108_5_1 RTLNAME fft_function_mul_56ns_52s_108_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_mul_64s_63ns_126_5_1 RTLNAME fft_function_mul_64s_63ns_126_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_mul_170s_53ns_170_5_1 RTLNAME fft_function_mul_170s_53ns_170_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_sparsemux_17_3_1_1_1 RTLNAME fft_function_sparsemux_17_3_1_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME fft_function_sparsemux_33_4_1_1_1 RTLNAME fft_function_sparsemux_33_4_1_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME fft_function_ctlz_62_62_1_1 RTLNAME fft_function_ctlz_62_62_1_1 BINDTYPE op TYPE ctlz IMPL auto}
      {MODELNAME fft_function_sin_or_cos_double_s_ref_4oPi_table_256_ROM_AUTO_1R RTLNAME fft_function_sin_or_cos_double_s_ref_4oPi_table_256_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_sin_or_cos_double_s_fourth_order_double_sin_cos_K0_ROM_1P_LUTRAM_1R RTLNAME fft_function_sin_or_cos_double_s_fourth_order_double_sin_cos_K0_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_sin_or_cos_double_s_fourth_order_double_sin_cos_K1_ROM_1P_LUTRAM_1R RTLNAME fft_function_sin_or_cos_double_s_fourth_order_double_sin_cos_K1_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_sin_or_cos_double_s_fourth_order_double_sin_cos_K2_ROM_1P_LUTRAM_1R RTLNAME fft_function_sin_or_cos_double_s_fourth_order_double_sin_cos_K2_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_sin_or_cos_double_s_fourth_order_double_sin_cos_K3_ROM_1P_LUTRAM_1R RTLNAME fft_function_sin_or_cos_double_s_fourth_order_double_sin_cos_K3_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_sin_or_cos_double_s_fourth_order_double_sin_cos_K4_ROM_1P_LUTRAM_1R RTLNAME fft_function_sin_or_cos_double_s_fourth_order_double_sin_cos_K4_ROM_1P_LUTRAM_1R BINDTYPE storage TYPE rom_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME aux_fft_function_Pipeline_VITIS_LOOP_40_5 MODELNAME aux_fft_function_Pipeline_VITIS_LOOP_40_5 RTLNAME fft_function_aux_fft_function_Pipeline_VITIS_LOOP_40_5
    SUBMODULES {
      {MODELNAME fft_function_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME fft_function_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME aux_fft_function_Outline_VITIS_LOOP_30_3 MODELNAME aux_fft_function_Outline_VITIS_LOOP_30_3 RTLNAME fft_function_aux_fft_function_Outline_VITIS_LOOP_30_3
    SUBMODULES {
      {MODELNAME fft_function_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME fft_function_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME fft_function_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_fptrunc_64ns_32_2_no_dsp_1 RTLNAME fft_function_fptrunc_64ns_32_2_no_dsp_1 BINDTYPE op TYPE fptrunc IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_fpext_32ns_64_2_no_dsp_1 RTLNAME fft_function_fpext_32ns_64_2_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_dmul_64ns_64ns_64_7_max_dsp_1 RTLNAME fft_function_dmul_64ns_64ns_64_7_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_ddiv_64ns_64ns_64_59_no_dsp_1 RTLNAME fft_function_ddiv_64ns_64ns_64_59_no_dsp_1 BINDTYPE op TYPE ddiv IMPL fabric LATENCY 58 ALLOW_PRAGMA 1}
      {MODELNAME fft_function_sitodp_64ns_64_6_no_dsp_1 RTLNAME fft_function_sitodp_64ns_64_6_no_dsp_1 BINDTYPE op TYPE sitodp IMPL auto LATENCY 5 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME aux_fft_function MODELNAME aux_fft_function RTLNAME fft_function_aux_fft_function}
  {SRCNAME fft_function MODELNAME fft_function RTLNAME fft_function IS_TOP 1}
}
