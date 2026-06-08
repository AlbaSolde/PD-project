set SynModuleInfo {
  {SRCNAME matrix_multiplication_Pipeline_VITIS_LOOP_8_3 MODELNAME matrix_multiplication_Pipeline_VITIS_LOOP_8_3 RTLNAME matrix_multiplication_matrix_multiplication_Pipeline_VITIS_LOOP_8_3
    SUBMODULES {
      {MODELNAME matrix_multiplication_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME matrix_multiplication_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME matrix_multiplication_flow_control_loop_pipe_sequential_init RTLNAME matrix_multiplication_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME matrix_multiplication_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME matrix_multiplication MODELNAME matrix_multiplication RTLNAME matrix_multiplication IS_TOP 1
    SUBMODULES {
      {MODELNAME matrix_multiplication_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME matrix_multiplication_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
}
