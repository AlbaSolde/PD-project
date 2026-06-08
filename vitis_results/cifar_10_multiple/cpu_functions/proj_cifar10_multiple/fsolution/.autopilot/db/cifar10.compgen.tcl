# This script segment is generated automatically by AutoPilot

set name cifar10_fmul_32ns_32ns_32_4_max_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fmul} IMPL {maxdsp} LATENCY 3 ALLOW_PRAGMA 1
}


set name cifar10_fexp_32ns_32ns_32_10_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fexp} IMPL {fulldsp} LATENCY 9 ALLOW_PRAGMA 1
}


set name cifar10_mul_32ns_32ns_64_2_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 1 ALLOW_PRAGMA 1
}


set name cifar10_mul_32s_32s_32_2_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 1 ALLOW_PRAGMA 1
}


set name cifar10_udiv_32s_32ns_32_36_seq_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {udiv} IMPL {auto_seq} LATENCY 35 ALLOW_PRAGMA 1
}


set name cifar10_udiv_32ns_32ns_32_36_seq_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {udiv} IMPL {auto_seq} LATENCY 35 ALLOW_PRAGMA 1
}


set name cifar10_fadd_32ns_32ns_32_5_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fadd} IMPL {fulldsp} LATENCY 4 ALLOW_PRAGMA 1
}


set name cifar10_fcmp_32ns_32ns_1_2_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fcmp} IMPL {auto} LATENCY 1 ALLOW_PRAGMA 1
}


set name cifar10_fptrunc_64ns_32_2_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fptrunc} IMPL {auto} LATENCY 1 ALLOW_PRAGMA 1
}


set name cifar10_fpext_32ns_64_2_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fpext} IMPL {auto} LATENCY 1 ALLOW_PRAGMA 1
}


set name cifar10_dadd_64ns_64ns_64_7_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {dadd} IMPL {fulldsp} LATENCY 6 ALLOW_PRAGMA 1
}


set name cifar10_dmul_64ns_64ns_64_7_max_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {dmul} IMPL {maxdsp} LATENCY 6 ALLOW_PRAGMA 1
}


set name cifar10_ddiv_64ns_64ns_64_59_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {ddiv} IMPL {fabric} LATENCY 58 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 207 \
    name output_data \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_output_data \
    op interface \
    ports { output_data_i { I 32 vector } output_data_o { O 32 vector } output_data_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 208 \
    name conv_1_output \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_conv_1_output \
    op interface \
    ports { conv_1_output_i { I 32 vector } conv_1_output_o { O 32 vector } conv_1_output_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 209 \
    name pooling_1_output \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_pooling_1_output \
    op interface \
    ports { pooling_1_output_i { I 32 vector } pooling_1_output_o { O 32 vector } pooling_1_output_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 210 \
    name conv_2_output \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_conv_2_output \
    op interface \
    ports { conv_2_output_i { I 32 vector } conv_2_output_o { O 32 vector } conv_2_output_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 211 \
    name pooling_2_output \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_pooling_2_output \
    op interface \
    ports { pooling_2_output_i { I 32 vector } pooling_2_output_o { O 32 vector } pooling_2_output_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 212 \
    name dense_layer_1_output \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_dense_layer_1_output \
    op interface \
    ports { dense_layer_1_output_i { I 32 vector } dense_layer_1_output_o { O 32 vector } dense_layer_1_output_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 213 \
    name dense_layer_2_output \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dense_layer_2_output \
    op interface \
    ports { dense_layer_2_output { O 32 vector } dense_layer_2_output_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 214 \
    name input_data \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_data \
    op interface \
    ports { input_data { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 215 \
    name kernel_1_data \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kernel_1_data \
    op interface \
    ports { kernel_1_data { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 216 \
    name kernel_2_data \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kernel_2_data \
    op interface \
    ports { kernel_2_data { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 217 \
    name weights_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_1 \
    op interface \
    ports { weights_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 218 \
    name weights_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_2 \
    op interface \
    ports { weights_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 219 \
    name input_data_size \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_data_size \
    op interface \
    ports { input_data_size { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 220 \
    name kernel_1_size \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kernel_1_size \
    op interface \
    ports { kernel_1_size { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 221 \
    name kernel_2_size \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kernel_2_size \
    op interface \
    ports { kernel_2_size { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 222 \
    name stride_1_size \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stride_1_size \
    op interface \
    ports { stride_1_size { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 223 \
    name stride_2_size \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stride_2_size \
    op interface \
    ports { stride_2_size { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 224 \
    name neurons_dense_1_size \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_neurons_dense_1_size \
    op interface \
    ports { neurons_dense_1_size { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 225 \
    name neurons_dense_2_size \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_neurons_dense_2_size \
    op interface \
    ports { neurons_dense_2_size { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 226 \
    name number_of_images \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_number_of_images \
    op interface \
    ports { number_of_images { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


