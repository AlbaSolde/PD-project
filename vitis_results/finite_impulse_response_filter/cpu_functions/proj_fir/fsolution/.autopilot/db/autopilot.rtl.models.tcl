set SynModuleInfo {
  {SRCNAME vector_convolution_Pipeline_VITIS_LOOP_43_1_VITIS_LOOP_45_2 MODELNAME vector_convolution_Pipeline_VITIS_LOOP_43_1_VITIS_LOOP_45_2 RTLNAME vector_convolution_vector_convolution_Pipeline_VITIS_LOOP_43_1_VITIS_LOOP_45_2
    SUBMODULES {
      {MODELNAME vector_convolution_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME vector_convolution_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME vector_convolution_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME vector_convolution_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME vector_convolution_flow_control_loop_pipe_sequential_init RTLNAME vector_convolution_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME vector_convolution_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME vector_convolution MODELNAME vector_convolution RTLNAME vector_convolution IS_TOP 1
    SUBMODULES {
      {MODELNAME vector_convolution_mul_32ns_32ns_64_2_1 RTLNAME vector_convolution_mul_32ns_32ns_64_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
}
