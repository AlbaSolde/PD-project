set SynModuleInfo {
  {SRCNAME ccsds_wavelet_transform_Pipeline_VITIS_LOOP_55_1 MODELNAME ccsds_wavelet_transform_Pipeline_VITIS_LOOP_55_1 RTLNAME ccsds_wavelet_transform_ccsds_wavelet_transform_Pipeline_VITIS_LOOP_55_1
    SUBMODULES {
      {MODELNAME ccsds_wavelet_transform_dadd_64ns_64ns_64_7_full_dsp_1 RTLNAME ccsds_wavelet_transform_dadd_64ns_64ns_64_7_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME ccsds_wavelet_transform_dmul_64ns_64ns_64_7_max_dsp_1 RTLNAME ccsds_wavelet_transform_dmul_64ns_64ns_64_7_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME ccsds_wavelet_transform_flow_control_loop_pipe_sequential_init RTLNAME ccsds_wavelet_transform_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME ccsds_wavelet_transform_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME ccsds_wavelet_transform MODELNAME ccsds_wavelet_transform RTLNAME ccsds_wavelet_transform IS_TOP 1
    SUBMODULES {
      {MODELNAME ccsds_wavelet_transform_gmem0_m_axi RTLNAME ccsds_wavelet_transform_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ccsds_wavelet_transform_gmem1_m_axi RTLNAME ccsds_wavelet_transform_gmem1_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME ccsds_wavelet_transform_control_s_axi RTLNAME ccsds_wavelet_transform_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
