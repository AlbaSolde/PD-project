set moduleName fft_function_Pipeline_VITIS_LOOP_37_5
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set isPipelined_legacy 1
set pipeline_type loop_auto_rewind
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
set cdfgNum 12
set C_modelName {fft_function_Pipeline_VITIS_LOOP_37_5}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ zext_ln36 int 63 regular  }
	{ empty_38 int 64 regular  }
	{ data int 32 regular {pointer 2}  }
	{ wr_2 float 32 regular  }
	{ wi float 32 regular  }
	{ empty int 64 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln36", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "empty_38", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "data", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "wr_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "wi", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln36 sc_in sc_lv 63 signal 0 } 
	{ empty_38 sc_in sc_lv 64 signal 1 } 
	{ data_i sc_in sc_lv 32 signal 2 } 
	{ data_o sc_out sc_lv 32 signal 2 } 
	{ data_o_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ wr_2 sc_in sc_lv 32 signal 3 } 
	{ wi sc_in sc_lv 32 signal 4 } 
	{ empty sc_in sc_lv 64 signal 5 } 
	{ grp_fu_133_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_133_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_133_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_133_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_133_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln36", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "zext_ln36", "role": "default" }} , 
 	{ "name": "empty_38", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "empty_38", "role": "default" }} , 
 	{ "name": "data_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data", "role": "i" }} , 
 	{ "name": "data_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data", "role": "o" }} , 
 	{ "name": "data_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "data", "role": "o_ap_vld" }} , 
 	{ "name": "wr_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "wr_2", "role": "default" }} , 
 	{ "name": "wi", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "wi", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "grp_fu_133_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_133_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_133_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_133_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_133_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_133_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_133_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_133_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_133_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_133_p_ce", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	fft_function_Pipeline_VITIS_LOOP_37_5 {
		zext_ln36 {Type I LastRead 0 FirstWrite -1}
		empty_38 {Type I LastRead 0 FirstWrite -1}
		data {Type IO LastRead 2 FirstWrite 30}
		wr_2 {Type I LastRead 0 FirstWrite -1}
		wi {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zext_ln36 { ap_none {  { zext_ln36 in_data 0 63 } } }
	empty_38 { ap_none {  { empty_38 in_data 0 64 } } }
	data { ap_ovld {  { data_i in_data 0 32 }  { data_o out_data 1 32 }  { data_o_ap_vld out_vld 1 1 } } }
	wr_2 { ap_none {  { wr_2 in_data 0 32 } } }
	wi { ap_none {  { wi in_data 0 32 } } }
	empty { ap_none {  { empty in_data 0 64 } } }
}
