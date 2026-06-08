# This script segment is generated automatically by AutoPilot

set name cifar10_mul_32ns_32ns_64_2_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 1 ALLOW_PRAGMA 1
}


set name cifar10_udiv_32s_32ns_32_36_seq_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {udiv} IMPL {auto_seq} LATENCY 35 ALLOW_PRAGMA 1
}


set name cifar10_udiv_32ns_32ns_30_36_seq_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {udiv} IMPL {auto_seq} LATENCY 35 ALLOW_PRAGMA 1
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


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler cifar10_gmem_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
set port_control {
output_data { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
conv_1_output { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
pooling_1_output { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
conv_2_output { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
pooling_2_output { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
dense_layer_1_output { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 56
	offset_end 63
}
dense_layer_2_output { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 64
	offset_end 71
}
input_data { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 72
	offset_end 79
}
kernel_1_data { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 80
	offset_end 87
}
kernel_2_data { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 88
	offset_end 95
}
weights_1 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 96
	offset_end 103
}
weights_2 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 104
	offset_end 111
}
input_data_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 112
	offset_end 119
}
output_data_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 120
	offset_end 127
}
kernel_1_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 128
	offset_end 135
}
kernel_2_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 136
	offset_end 143
}
stride_1_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 144
	offset_end 151
}
stride_2_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 152
	offset_end 159
}
neurons_dense_1_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 160
	offset_end 167
}
neurons_dense_2_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 168
	offset_end 175
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


# Native S_AXILite:
if {${::AESL::PGuard_simmodel_gen}} {
	if {[info proc ::AESL_LIB_XILADAPTER::s_axilite_gen] == "::AESL_LIB_XILADAPTER::s_axilite_gen"} {
		eval "::AESL_LIB_XILADAPTER::s_axilite_gen { \
			id 203 \
			corename cifar10_control_axilite \
			name cifar10_control_s_axi \
			ports {$port_control} \
			op interface \
			interrupt_clear_mode TOW \
			interrupt_trigger_type default \
			is_flushable 0 \
			is_datawidth64 0 \
			is_addrwidth64 0 \
			enable_mem_auto_widen 1 \
		} "
	} else {
		puts "@W \[IMPL-110\] Cannot find AXI Lite interface model in the library. Ignored generation of AXI Lite  interface for 'control'"
	}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler cifar10_control_s_axi BINDTYPE interface TYPE interface_s_axilite
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -1 \
    name ${PortName} \
    reset_level 0 \
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
set PortName ap_rst_n
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -2 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_rst_n \
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


