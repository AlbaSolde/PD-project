set moduleName FFT2D_flat
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set restart_counter_num 0
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 14
set C_modelName {FFT2D_flat}
set C_modelType { int 1 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ c_flat int 64 regular {pointer 0}  }
	{ nx int 32 regular  }
	{ ny int 32 regular  }
	{ out_flat int 64 regular {pointer 2}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "c_flat", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "nx", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ny", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "out_flat", "interface" : "wire", "bitwidth" : 64, "direction" : "READWRITE"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ c_flat sc_in sc_lv 64 signal 0 } 
	{ nx sc_in sc_lv 32 signal 1 } 
	{ ny sc_in sc_lv 32 signal 2 } 
	{ out_flat_i sc_in sc_lv 64 signal 3 } 
	{ out_flat_o sc_out sc_lv 64 signal 3 } 
	{ out_flat_o_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "c_flat", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "c_flat", "role": "default" }} , 
 	{ "name": "nx", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "nx", "role": "default" }} , 
 	{ "name": "ny", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ny", "role": "default" }} , 
 	{ "name": "out_flat_i", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "out_flat", "role": "i" }} , 
 	{ "name": "out_flat_o", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "out_flat", "role": "o" }} , 
 	{ "name": "out_flat_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_flat", "role": "o_ap_vld" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	FFT2D_flat {
		c_flat {Type I LastRead 2 FirstWrite -1}
		nx {Type I LastRead 0 FirstWrite -1}
		ny {Type I LastRead 0 FirstWrite -1}
		out_flat {Type IO LastRead 71 FirstWrite 2}
		ref_4oPi_table_100 {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}}
	FFT2D_flat_Outline_VITIS_LOOP_19_1 {
		ny {Type I LastRead 0 FirstWrite -1}}
	FFT2D_flat_Pipeline_VITIS_LOOP_21_2 {
		ny {Type I LastRead 0 FirstWrite -1}
		j {Type I LastRead 0 FirstWrite -1}
		j_3_out {Type O LastRead -1 FirstWrite 1}}
	FFT2D_flat_Outline_VITIS_LOOP_30_3 {
		ny {Type I LastRead 0 FirstWrite -1}
		out_flat {Type IO LastRead 71 FirstWrite 73}
		ref_4oPi_table_100 {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}}
	FFT2D_flat_Pipeline_VITIS_LOOP_37_5 {
		out_flat_load_1 {Type I LastRead 0 FirstWrite -1}
		select_ln37 {Type I LastRead 0 FirstWrite -1}
		wcos {Type I LastRead 0 FirstWrite -1}
		wsin {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 1}}
	FFT2D_flat_Pipeline_VITIS_LOOP_69_4 {
		nx {Type I LastRead 0 FirstWrite -1}
		col_x {Type O LastRead -1 FirstWrite 1}
		col_y {Type O LastRead -1 FirstWrite 1}
		bitcast_ln70 {Type I LastRead 0 FirstWrite -1}
		bitcast_ln70_1 {Type I LastRead 0 FirstWrite -1}}
	FFT2D_flat_Pipeline_VITIS_LOOP_21_21 {
		empty {Type I LastRead 0 FirstWrite -1}
		j_4 {Type I LastRead 0 FirstWrite -1}
		j_6_out {Type O LastRead -1 FirstWrite 1}}
	FFT2D_flat_Pipeline_VITIS_LOOP_72_5 {
		nx {Type I LastRead 0 FirstWrite -1}
		col_x {Type I LastRead 0 FirstWrite -1}
		col_y {Type I LastRead 0 FirstWrite -1}
		p_phi_out {Type O LastRead -1 FirstWrite 0}}
	sin_or_cos_float_s {
		t_in {Type I LastRead 0 FirstWrite -1}
		do_cos {Type I LastRead 8 FirstWrite -1}
		ref_4oPi_table_100 {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}}
	sin_or_cos_float_Pipeline_1 {
		out_bits_1 {Type I LastRead 0 FirstWrite -1}
		out_bits {Type I LastRead 0 FirstWrite -1}
		c_1_out {Type O LastRead -1 FirstWrite 0}
		c_out {Type O LastRead -1 FirstWrite 0}}
	sin_or_cos_float_Pipeline_2 {
		result {Type I LastRead 0 FirstWrite -1}
		c_1_reload {Type I LastRead 0 FirstWrite -1}
		c_reload {Type I LastRead 0 FirstWrite -1}
		shift_1_out {Type O LastRead -1 FirstWrite 1}
		select_ln291_1_out {Type O LastRead -1 FirstWrite 1}}
	sin_or_cos_float_s {
		t_in {Type I LastRead 0 FirstWrite -1}
		do_cos {Type I LastRead 8 FirstWrite -1}
		ref_4oPi_table_100 {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}}
	sin_or_cos_float_Pipeline_1 {
		out_bits_1 {Type I LastRead 0 FirstWrite -1}
		out_bits {Type I LastRead 0 FirstWrite -1}
		c_1_out {Type O LastRead -1 FirstWrite 0}
		c_out {Type O LastRead -1 FirstWrite 0}}
	sin_or_cos_float_Pipeline_2 {
		result {Type I LastRead 0 FirstWrite -1}
		c_1_reload {Type I LastRead 0 FirstWrite -1}
		c_reload {Type I LastRead 0 FirstWrite -1}
		shift_1_out {Type O LastRead -1 FirstWrite 1}
		select_ln291_1_out {Type O LastRead -1 FirstWrite 1}}
	FFT2D_flat_Pipeline_VITIS_LOOP_37_52 {
		select_ln37_1 {Type I LastRead 0 FirstWrite -1}
		empty_38 {Type I LastRead 0 FirstWrite -1}
		col_x {Type IO LastRead 3 FirstWrite 18}
		col_y {Type IO LastRead 3 FirstWrite 18}
		empty {Type I LastRead 0 FirstWrite -1}
		wcos_1 {Type I LastRead 0 FirstWrite -1}
		wsin_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	c_flat { ap_none {  { c_flat in_data 0 64 } } }
	nx { ap_none {  { nx in_data 0 32 } } }
	ny { ap_none {  { ny in_data 0 32 } } }
	out_flat { ap_ovld {  { out_flat_i in_data 0 64 }  { out_flat_o out_data 1 64 }  { out_flat_o_ap_vld out_vld 1 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
