set SynModuleInfo {
  {SRCNAME convolution_Pipeline_VITIS_LOOP_26_2 MODELNAME convolution_Pipeline_VITIS_LOOP_26_2 RTLNAME cifar10_convolution_Pipeline_VITIS_LOOP_26_2
    SUBMODULES {
      {MODELNAME cifar10_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME cifar10_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME cifar10_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_mul_30s_30s_30_2_1 RTLNAME cifar10_mul_30s_30s_30_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_udiv_32ns_32ns_32_36_1 RTLNAME cifar10_udiv_32ns_32ns_32_36_1 BINDTYPE op TYPE udiv IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_urem_32ns_32ns_32_36_1 RTLNAME cifar10_urem_32ns_32ns_32_36_1 BINDTYPE op TYPE urem IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_flow_control_loop_pipe_sequential_init RTLNAME cifar10_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME cifar10_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME convolution MODELNAME convolution RTLNAME cifar10_convolution
    SUBMODULES {
      {MODELNAME cifar10_mul_32s_32s_32_2_1 RTLNAME cifar10_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_udiv_32ns_32s_32_36_seq_1 RTLNAME cifar10_udiv_32ns_32s_32_36_seq_1 BINDTYPE op TYPE udiv IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_urem_32ns_32s_32_36_seq_1 RTLNAME cifar10_urem_32ns_32s_32_36_seq_1 BINDTYPE op TYPE urem IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME cifar10_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2 MODELNAME cifar10_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2 RTLNAME cifar10_cifar10_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_2}
  {SRCNAME cifar10_Pipeline_VITIS_LOOP_93_3_VITIS_LOOP_95_4 MODELNAME cifar10_Pipeline_VITIS_LOOP_93_3_VITIS_LOOP_95_4 RTLNAME cifar10_cifar10_Pipeline_VITIS_LOOP_93_3_VITIS_LOOP_95_4}
  {SRCNAME pow_generic<double> MODELNAME pow_generic_double_s RTLNAME cifar10_pow_generic_double_s
    SUBMODULES {
      {MODELNAME cifar10_mul_12s_80ns_90_5_0 RTLNAME cifar10_mul_12s_80ns_90_5_0 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_mul_13s_71s_71_5_0 RTLNAME cifar10_mul_13s_71s_71_5_0 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_mul_40ns_40ns_79_2_0 RTLNAME cifar10_mul_40ns_40ns_79_2_0 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_mul_43ns_36ns_78_3_0 RTLNAME cifar10_mul_43ns_36ns_78_3_0 BINDTYPE op TYPE mul IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_mul_49ns_44ns_92_5_0 RTLNAME cifar10_mul_49ns_44ns_92_5_0 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_mul_50ns_50ns_99_5_0 RTLNAME cifar10_mul_50ns_50ns_99_5_0 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_mul_54s_6ns_54_5_0 RTLNAME cifar10_mul_54s_6ns_54_5_0 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_mul_73ns_6ns_79_5_0 RTLNAME cifar10_mul_73ns_6ns_79_5_0 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_mul_77ns_6ns_82_5_0 RTLNAME cifar10_mul_77ns_6ns_82_5_0 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_mul_78s_54s_131_5_0 RTLNAME cifar10_mul_78s_54s_131_5_0 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_mul_82ns_6ns_87_5_0 RTLNAME cifar10_mul_82ns_6ns_87_5_0 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_mul_83ns_6ns_89_5_0 RTLNAME cifar10_mul_83ns_6ns_89_5_0 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_mul_87ns_6ns_92_5_0 RTLNAME cifar10_mul_87ns_6ns_92_5_0 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_mul_92ns_6ns_97_5_0 RTLNAME cifar10_mul_92ns_6ns_97_5_0 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_mul_71ns_4ns_75_5_0 RTLNAME cifar10_mul_71ns_4ns_75_5_0 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_bitselect_1ns_52ns_6ns_1_1_0 RTLNAME cifar10_bitselect_1ns_52ns_6ns_1_1_0 BINDTYPE op TYPE bitselect IMPL auto}
      {MODELNAME cifar10_sparsemux_7_2_1_1_0 RTLNAME cifar10_sparsemux_7_2_1_1_0 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME cifar10_sparsemux_19_8_64_1_0 RTLNAME cifar10_sparsemux_19_8_64_1_0 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME cifar10_mac_muladd_16s_15ns_19s_31_4_0 RTLNAME cifar10_mac_muladd_16s_15ns_19s_31_4_0 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log_inverse_lut_table_powbkb RTLNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log_inverse_lut_table_powbkb BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log0_lut_table_array_ROM_cud RTLNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log0_lut_table_array_ROM_cud BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_4_dEe RTLNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_4_dEe BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_7_eOg RTLNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_7_eOg BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_12fYi RTLNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_12fYi BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_17g8j RTLNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_17g8j BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_22hbi RTLNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_22hbi BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_27ibs RTLNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_27ibs BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_32jbC RTLNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_32jbC BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_table_exp_Z1_ap_ufixed_arkbM RTLNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_table_exp_Z1_ap_ufixed_arkbM BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_table_f_Z3_ap_ufixed_arralbW RTLNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_table_f_Z3_ap_ufixed_arralbW BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_arramb6 RTLNAME cifar10_pow_generic_double_s_pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_arramb6 BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME cifar10_Pipeline_VITIS_LOOP_108_1_VITIS_LOOP_110_2 MODELNAME cifar10_Pipeline_VITIS_LOOP_108_1_VITIS_LOOP_110_2 RTLNAME cifar10_cifar10_Pipeline_VITIS_LOOP_108_1_VITIS_LOOP_110_2}
  {SRCNAME cifar10_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_21 MODELNAME cifar10_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_21 RTLNAME cifar10_cifar10_Pipeline_VITIS_LOOP_51_1_VITIS_LOOP_53_21}
  {SRCNAME cifar10_Pipeline_VITIS_LOOP_108_1_VITIS_LOOP_110_22 MODELNAME cifar10_Pipeline_VITIS_LOOP_108_1_VITIS_LOOP_110_22 RTLNAME cifar10_cifar10_Pipeline_VITIS_LOOP_108_1_VITIS_LOOP_110_22}
  {SRCNAME cifar10_Pipeline_VITIS_LOOP_93_3_VITIS_LOOP_95_43 MODELNAME cifar10_Pipeline_VITIS_LOOP_93_3_VITIS_LOOP_95_43 RTLNAME cifar10_cifar10_Pipeline_VITIS_LOOP_93_3_VITIS_LOOP_95_43}
  {SRCNAME cifar10_Pipeline_VITIS_LOOP_125_3 MODELNAME cifar10_Pipeline_VITIS_LOOP_125_3 RTLNAME cifar10_cifar10_Pipeline_VITIS_LOOP_125_3}
  {SRCNAME cifar10_Pipeline_VITIS_LOOP_71_1 MODELNAME cifar10_Pipeline_VITIS_LOOP_71_1 RTLNAME cifar10_cifar10_Pipeline_VITIS_LOOP_71_1}
  {SRCNAME cifar10_Pipeline_VITIS_LOOP_125_34 MODELNAME cifar10_Pipeline_VITIS_LOOP_125_34 RTLNAME cifar10_cifar10_Pipeline_VITIS_LOOP_125_34}
  {SRCNAME cifar10_Pipeline_VITIS_LOOP_71_15 MODELNAME cifar10_Pipeline_VITIS_LOOP_71_15 RTLNAME cifar10_cifar10_Pipeline_VITIS_LOOP_71_15}
  {SRCNAME cifar10_Pipeline_VITIS_LOOP_140_1 MODELNAME cifar10_Pipeline_VITIS_LOOP_140_1 RTLNAME cifar10_cifar10_Pipeline_VITIS_LOOP_140_1
    SUBMODULES {
      {MODELNAME cifar10_fexp_32ns_32ns_32_10_full_dsp_1 RTLNAME cifar10_fexp_32ns_32ns_32_10_full_dsp_1 BINDTYPE op TYPE fexp IMPL fulldsp LATENCY 9 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME cifar10_Pipeline_VITIS_LOOP_147_2 MODELNAME cifar10_Pipeline_VITIS_LOOP_147_2 RTLNAME cifar10_cifar10_Pipeline_VITIS_LOOP_147_2
    SUBMODULES {
      {MODELNAME cifar10_fdiv_32ns_32ns_32_16_no_dsp_1 RTLNAME cifar10_fdiv_32ns_32ns_32_16_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 15 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME cifar10 MODELNAME cifar10 RTLNAME cifar10 IS_TOP 1
    SUBMODULES {
      {MODELNAME cifar10_mul_32ns_32ns_64_2_1 RTLNAME cifar10_mul_32ns_32ns_64_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_udiv_32s_32ns_32_36_seq_1 RTLNAME cifar10_udiv_32s_32ns_32_36_seq_1 BINDTYPE op TYPE udiv IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_udiv_32ns_32ns_30_36_seq_1 RTLNAME cifar10_udiv_32ns_32ns_30_36_seq_1 BINDTYPE op TYPE udiv IMPL auto_seq LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME cifar10_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_fptrunc_64ns_32_2_no_dsp_1 RTLNAME cifar10_fptrunc_64ns_32_2_no_dsp_1 BINDTYPE op TYPE fptrunc IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_fpext_32ns_64_2_no_dsp_1 RTLNAME cifar10_fpext_32ns_64_2_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_dadd_64ns_64ns_64_7_full_dsp_1 RTLNAME cifar10_dadd_64ns_64ns_64_7_full_dsp_1 BINDTYPE op TYPE dadd IMPL fulldsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_dmul_64ns_64ns_64_7_max_dsp_1 RTLNAME cifar10_dmul_64ns_64ns_64_7_max_dsp_1 BINDTYPE op TYPE dmul IMPL maxdsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_ddiv_64ns_64ns_64_59_no_dsp_1 RTLNAME cifar10_ddiv_64ns_64ns_64_59_no_dsp_1 BINDTYPE op TYPE ddiv IMPL fabric LATENCY 58 ALLOW_PRAGMA 1}
      {MODELNAME cifar10_gmem_m_axi RTLNAME cifar10_gmem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME cifar10_control_s_axi RTLNAME cifar10_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
