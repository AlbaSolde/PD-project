set SynModuleInfo {
  {SRCNAME relu_Pipeline_VITIS_LOOP_19_1_VITIS_LOOP_21_2 MODELNAME relu_Pipeline_VITIS_LOOP_19_1_VITIS_LOOP_21_2 RTLNAME relu_relu_Pipeline_VITIS_LOOP_19_1_VITIS_LOOP_21_2
    SUBMODULES {
      {MODELNAME relu_flow_control_loop_pipe_sequential_init RTLNAME relu_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME relu_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME relu MODELNAME relu RTLNAME relu IS_TOP 1
    SUBMODULES {
      {MODELNAME relu_dcmp_64ns_64ns_1_2_no_dsp_1 RTLNAME relu_dcmp_64ns_64ns_1_2_no_dsp_1 BINDTYPE op TYPE dcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME relu_mul_32ns_32ns_64_2_1 RTLNAME relu_mul_32ns_32ns_64_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
}
