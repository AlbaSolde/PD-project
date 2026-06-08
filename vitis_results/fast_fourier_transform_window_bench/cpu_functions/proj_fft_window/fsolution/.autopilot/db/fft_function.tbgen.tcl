set moduleName fft_function
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
set cdfgNum 13
set C_modelName {fft_function}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ data int 32 regular {pointer 0}  }
	{ output_r int 32 regular {pointer 2}  }
	{ window int 64 regular  }
	{ nn int 64 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "data", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "output_r", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "window", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "nn", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 12
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ data sc_in sc_lv 32 signal 0 } 
	{ output_r_i sc_in sc_lv 32 signal 1 } 
	{ output_r_o sc_out sc_lv 32 signal 1 } 
	{ output_r_o_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ window sc_in sc_lv 64 signal 2 } 
	{ nn sc_in sc_lv 64 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "data", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data", "role": "default" }} , 
 	{ "name": "output_r_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_r", "role": "i" }} , 
 	{ "name": "output_r_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_r", "role": "o" }} , 
 	{ "name": "output_r_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "output_r", "role": "o_ap_vld" }} , 
 	{ "name": "window", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "window", "role": "default" }} , 
 	{ "name": "nn", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "nn", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	fft_function {
		data {Type I LastRead 0 FirstWrite -1}
		output_r {Type IO LastRead 2 FirstWrite 1}
		window {Type I LastRead 0 FirstWrite -1}
		nn {Type I LastRead 0 FirstWrite -1}
		ref_4oPi_table_256 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4 {Type I LastRead -1 FirstWrite -1}}
	aux_fft_function {
		data_read {Type I LastRead 0 FirstWrite -1}
		nn {Type I LastRead 0 FirstWrite -1}
		ref_4oPi_table_256 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4 {Type I LastRead -1 FirstWrite -1}}
	aux_fft_function_Outline_VITIS_LOOP_14_1 {
		n {Type I LastRead 0 FirstWrite -1}
		nn {Type I LastRead 0 FirstWrite -1}}
	aux_fft_function_Pipeline_VITIS_LOOP_21_2 {
		j {Type I LastRead 0 FirstWrite -1}
		nn {Type I LastRead 0 FirstWrite -1}
		j_1_out {Type O LastRead -1 FirstWrite 1}
		m_out {Type O LastRead -1 FirstWrite 1}}
	aux_fft_function_Outline_VITIS_LOOP_30_3 {
		data_read {Type I LastRead 0 FirstWrite -1}
		n {Type I LastRead 0 FirstWrite -1}
		data_0_out {Type O LastRead -1 FirstWrite 1}
		ref_4oPi_table_256 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4 {Type I LastRead -1 FirstWrite -1}}
	sin_or_cos_double_s {
		t_in {Type I LastRead 0 FirstWrite -1}
		ref_4oPi_table_256 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K3 {Type I LastRead -1 FirstWrite -1}
		fourth_order_double_sin_cos_K4 {Type I LastRead -1 FirstWrite -1}}
	sin_or_cos_double_Pipeline_1 {
		out_bits_5_out {Type O LastRead -1 FirstWrite 0}
		out_bits_4_out {Type O LastRead -1 FirstWrite 0}
		out_bits_3_out {Type O LastRead -1 FirstWrite 0}}
	sin_or_cos_double_Pipeline_2 {
		out_bits_5_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_4_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_3_reload {Type I LastRead 0 FirstWrite -1}
		result {Type I LastRead 0 FirstWrite -1}
		out_bits_9_out {Type O LastRead -1 FirstWrite 0}
		out_bits_8_out {Type O LastRead -1 FirstWrite 0}
		out_bits_7_out {Type O LastRead -1 FirstWrite 0}}
	sin_or_cos_double_Pipeline_3 {
		out_bits_7_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_8_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_9_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_6 {Type I LastRead 0 FirstWrite -1}
		c_3_out {Type O LastRead -1 FirstWrite 0}
		c_2_out {Type O LastRead -1 FirstWrite 0}
		c_1_out {Type O LastRead -1 FirstWrite 0}
		c_out {Type O LastRead -1 FirstWrite 0}}
	sin_or_cos_double_Pipeline_4 {
		result {Type I LastRead 0 FirstWrite -1}
		c_reload {Type I LastRead 0 FirstWrite -1}
		c_1_reload {Type I LastRead 0 FirstWrite -1}
		c_2_reload {Type I LastRead 0 FirstWrite -1}
		c_3_reload {Type I LastRead 0 FirstWrite -1}
		shift_1_out {Type O LastRead -1 FirstWrite 2}
		in_shift_out {Type O LastRead -1 FirstWrite 2}}
	aux_fft_function_Pipeline_VITIS_LOOP_40_5 {
		zext_ln39 {Type I LastRead 0 FirstWrite -1}
		n {Type I LastRead 0 FirstWrite -1}
		wr_2 {Type I LastRead 0 FirstWrite -1}
		wi {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		data_2_out {Type IO LastRead 1 FirstWrite 29}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	data { ap_none {  { data in_data 0 32 } } }
	output_r { ap_ovld {  { output_r_i in_data 0 32 }  { output_r_o out_data 1 32 }  { output_r_o_ap_vld out_vld 1 1 } } }
	window { ap_none {  { window in_data 0 64 } } }
	nn { ap_none {  { nn in_data 0 64 } } }
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
