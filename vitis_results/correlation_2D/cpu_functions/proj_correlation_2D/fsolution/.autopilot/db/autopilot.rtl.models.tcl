set SynModuleInfo {
  {SRCNAME correlation_2D_Pipeline_VITIS_LOOP_9_1_VITIS_LOOP_10_2 MODELNAME correlation_2D_Pipeline_VITIS_LOOP_9_1_VITIS_LOOP_10_2 RTLNAME correlation_2D_correlation_2D_Pipeline_VITIS_LOOP_9_1_VITIS_LOOP_10_2
    SUBMODULES {
      {MODELNAME correlation_2D_dadd_64ns_64ns_64_7_full_dsp_1 RTLNAME correlation_2D_dadd_64ns_64ns_64_7_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME correlation_2D_flow_control_loop_pipe_sequential_init RTLNAME correlation_2D_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME correlation_2D_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME correlation_2D_Pipeline_VITIS_LOOP_9_1_VITIS_LOOP_10_21 MODELNAME correlation_2D_Pipeline_VITIS_LOOP_9_1_VITIS_LOOP_10_21 RTLNAME correlation_2D_correlation_2D_Pipeline_VITIS_LOOP_9_1_VITIS_LOOP_10_21}
  {SRCNAME correlation_2D_Pipeline_VITIS_LOOP_31_1_VITIS_LOOP_32_2 MODELNAME correlation_2D_Pipeline_VITIS_LOOP_31_1_VITIS_LOOP_32_2 RTLNAME correlation_2D_correlation_2D_Pipeline_VITIS_LOOP_31_1_VITIS_LOOP_32_2}
  {SRCNAME correlation_2D MODELNAME correlation_2D RTLNAME correlation_2D IS_TOP 1
    SUBMODULES {
      {MODELNAME correlation_2D_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME correlation_2D_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME correlation_2D_fsub_32ns_32ns_32_5_full_dsp_1 RTLNAME correlation_2D_fsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME correlation_2D_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME correlation_2D_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME correlation_2D_fdiv_32ns_32ns_32_16_no_dsp_1 RTLNAME correlation_2D_fdiv_32ns_32ns_32_16_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME correlation_2D_sitofp_32ns_32_6_no_dsp_1 RTLNAME correlation_2D_sitofp_32ns_32_6_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 5 ALLOW_PRAGMA 1}
      {MODELNAME correlation_2D_fptrunc_64ns_32_2_no_dsp_1 RTLNAME correlation_2D_fptrunc_64ns_32_2_no_dsp_1 BINDTYPE op TYPE fptrunc IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME correlation_2D_fpext_32ns_64_2_no_dsp_1 RTLNAME correlation_2D_fpext_32ns_64_2_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME correlation_2D_fsqrt_32ns_32ns_32_16_no_dsp_1 RTLNAME correlation_2D_fsqrt_32ns_32ns_32_16_no_dsp_1 BINDTYPE op TYPE fsqrt IMPL fabric LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME correlation_2D_mul_31ns_32ns_63_2_1 RTLNAME correlation_2D_mul_31ns_32ns_63_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME correlation_2D_mul_32s_32s_32_2_1 RTLNAME correlation_2D_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
}
