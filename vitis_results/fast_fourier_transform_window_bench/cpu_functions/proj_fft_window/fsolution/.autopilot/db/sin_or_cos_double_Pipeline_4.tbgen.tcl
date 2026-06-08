set moduleName sin_or_cos_double_Pipeline_4
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
set cdfgNum 13
set C_modelName {sin_or_cos<double>_Pipeline_4}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ result int 63 regular  }
	{ c_reload int 32 regular  }
	{ c_1_reload int 32 regular  }
	{ c_2_reload int 32 regular  }
	{ c_3_reload int 32 regular  }
	{ shift_1_out int 32 regular {pointer 1}  }
	{ in_shift_out int 62 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "result", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "c_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "c_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "c_2_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "c_3_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "shift_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "in_shift_out", "interface" : "wire", "bitwidth" : 62, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ result sc_in sc_lv 63 signal 0 } 
	{ c_reload sc_in sc_lv 32 signal 1 } 
	{ c_1_reload sc_in sc_lv 32 signal 2 } 
	{ c_2_reload sc_in sc_lv 32 signal 3 } 
	{ c_3_reload sc_in sc_lv 32 signal 4 } 
	{ shift_1_out sc_out sc_lv 32 signal 5 } 
	{ shift_1_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ in_shift_out sc_out sc_lv 62 signal 6 } 
	{ in_shift_out_ap_vld sc_out sc_logic 1 outvld 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "result", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "result", "role": "default" }} , 
 	{ "name": "c_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_reload", "role": "default" }} , 
 	{ "name": "c_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_1_reload", "role": "default" }} , 
 	{ "name": "c_2_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_2_reload", "role": "default" }} , 
 	{ "name": "c_3_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_3_reload", "role": "default" }} , 
 	{ "name": "shift_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "shift_1_out", "role": "default" }} , 
 	{ "name": "shift_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "shift_1_out", "role": "ap_vld" }} , 
 	{ "name": "in_shift_out", "direction": "out", "datatype": "sc_lv", "bitwidth":62, "type": "signal", "bundle":{"name": "in_shift_out", "role": "default" }} , 
 	{ "name": "in_shift_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "in_shift_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	sin_or_cos_double_Pipeline_4 {
		result {Type I LastRead 0 FirstWrite -1}
		c_reload {Type I LastRead 0 FirstWrite -1}
		c_1_reload {Type I LastRead 0 FirstWrite -1}
		c_2_reload {Type I LastRead 0 FirstWrite -1}
		c_3_reload {Type I LastRead 0 FirstWrite -1}
		shift_1_out {Type O LastRead -1 FirstWrite 2}
		in_shift_out {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4", "Max" : "10"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "8"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	result { ap_none {  { result in_data 0 63 } } }
	c_reload { ap_none {  { c_reload in_data 0 32 } } }
	c_1_reload { ap_none {  { c_1_reload in_data 0 32 } } }
	c_2_reload { ap_none {  { c_2_reload in_data 0 32 } } }
	c_3_reload { ap_none {  { c_3_reload in_data 0 32 } } }
	shift_1_out { ap_vld {  { shift_1_out out_data 1 32 }  { shift_1_out_ap_vld out_vld 1 1 } } }
	in_shift_out { ap_vld {  { in_shift_out out_data 1 62 }  { in_shift_out_ap_vld out_vld 1 1 } } }
}
