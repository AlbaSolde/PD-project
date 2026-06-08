set SynModuleInfo {
  {SRCNAME max_pooling_Pipeline_VITIS_LOOP_49_3_VITIS_LOOP_51_4 MODELNAME max_pooling_Pipeline_VITIS_LOOP_49_3_VITIS_LOOP_51_4 RTLNAME max_pooling_max_pooling_Pipeline_VITIS_LOOP_49_3_VITIS_LOOP_51_4
    SUBMODULES {
      {MODELNAME max_pooling_dcmp_64ns_64ns_1_2_no_dsp_1 RTLNAME max_pooling_dcmp_64ns_64ns_1_2_no_dsp_1 BINDTYPE op TYPE dcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME max_pooling_flow_control_loop_pipe_sequential_init RTLNAME max_pooling_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME max_pooling_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME max_pooling MODELNAME max_pooling RTLNAME max_pooling IS_TOP 1
    SUBMODULES {
      {MODELNAME max_pooling_mul_32ns_32ns_64_2_1 RTLNAME max_pooling_mul_32ns_32ns_64_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
}
