set SynModuleInfo {
  {SRCNAME softmax_Pipeline_VITIS_LOOP_46_1_VITIS_LOOP_48_2 MODELNAME softmax_Pipeline_VITIS_LOOP_46_1_VITIS_LOOP_48_2 RTLNAME softmax_softmax_Pipeline_VITIS_LOOP_46_1_VITIS_LOOP_48_2
    SUBMODULES {
      {MODELNAME softmax_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME softmax_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME softmax_flow_control_loop_pipe_sequential_init RTLNAME softmax_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME softmax_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME softmax_Pipeline_VITIS_LOOP_56_3_VITIS_LOOP_58_4 MODELNAME softmax_Pipeline_VITIS_LOOP_56_3_VITIS_LOOP_58_4 RTLNAME softmax_softmax_Pipeline_VITIS_LOOP_56_3_VITIS_LOOP_58_4
    SUBMODULES {
      {MODELNAME softmax_fdiv_32ns_32ns_32_16_no_dsp_1 RTLNAME softmax_fdiv_32ns_32ns_32_16_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 15 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME softmax MODELNAME softmax RTLNAME softmax IS_TOP 1
    SUBMODULES {
      {MODELNAME softmax_fptrunc_64ns_32_2_no_dsp_1 RTLNAME softmax_fptrunc_64ns_32_2_no_dsp_1 BINDTYPE op TYPE fptrunc IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME softmax_fpext_32ns_64_2_no_dsp_1 RTLNAME softmax_fpext_32ns_64_2_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME softmax_dexp_64ns_64ns_64_21_full_dsp_1 RTLNAME softmax_dexp_64ns_64ns_64_21_full_dsp_1 BINDTYPE op TYPE dexp IMPL fulldsp LATENCY 20 ALLOW_PRAGMA 1}
      {MODELNAME softmax_mul_32ns_32ns_64_2_1 RTLNAME softmax_mul_32ns_32ns_64_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
}
