set SynModuleInfo {
  {SRCNAME matrix_convolution_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_23_2_VITIS_LOOP_27_3_VITI MODELNAME matrix_convolution_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_23_2_VITIS_LOOP_27_3_VITI RTLNAME matrix_convolution_matrix_convolution_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_23_2_VITIS_LOOP_27_3_VITI
    SUBMODULES {
      {MODELNAME matrix_convolution_dadd_64ns_64ns_64_7_full_dsp_1 RTLNAME matrix_convolution_dadd_64ns_64ns_64_7_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME matrix_convolution_dmul_64ns_64ns_64_7_max_dsp_1 RTLNAME matrix_convolution_dmul_64ns_64ns_64_7_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME matrix_convolution_flow_control_loop_pipe_sequential_init RTLNAME matrix_convolution_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME matrix_convolution_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME matrix_convolution MODELNAME matrix_convolution RTLNAME matrix_convolution IS_TOP 1
    SUBMODULES {
      {MODELNAME matrix_convolution_mul_31ns_128ns_159_5_1 RTLNAME matrix_convolution_mul_31ns_128ns_159_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME matrix_convolution_mul_32ns_64ns_96_5_1 RTLNAME matrix_convolution_mul_32ns_64ns_96_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME matrix_convolution_mul_32ns_96ns_128_5_1 RTLNAME matrix_convolution_mul_32ns_96ns_128_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
    }
  }
}
