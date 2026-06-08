set moduleName sin_or_cos_double_Pipeline_3
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
set C_modelName {sin_or_cos<double>_Pipeline_3}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ out_bits_7_reload int 32 regular  }
	{ out_bits_8_reload int 32 regular  }
	{ out_bits_9_reload int 32 regular  }
	{ out_bits_6 int 32 regular  }
	{ c_3_out int 32 regular {pointer 1}  }
	{ c_2_out int 32 regular {pointer 1}  }
	{ c_1_out int 32 regular {pointer 1}  }
	{ c_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "out_bits_7_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "out_bits_8_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "out_bits_9_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "out_bits_6", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "c_3_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "c_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "c_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "c_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ out_bits_7_reload sc_in sc_lv 32 signal 0 } 
	{ out_bits_8_reload sc_in sc_lv 32 signal 1 } 
	{ out_bits_9_reload sc_in sc_lv 32 signal 2 } 
	{ out_bits_6 sc_in sc_lv 32 signal 3 } 
	{ c_3_out sc_out sc_lv 32 signal 4 } 
	{ c_3_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ c_2_out sc_out sc_lv 32 signal 5 } 
	{ c_2_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ c_1_out sc_out sc_lv 32 signal 6 } 
	{ c_1_out_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ c_out sc_out sc_lv 32 signal 7 } 
	{ c_out_ap_vld sc_out sc_logic 1 outvld 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "out_bits_7_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_bits_7_reload", "role": "default" }} , 
 	{ "name": "out_bits_8_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_bits_8_reload", "role": "default" }} , 
 	{ "name": "out_bits_9_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_bits_9_reload", "role": "default" }} , 
 	{ "name": "out_bits_6", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_bits_6", "role": "default" }} , 
 	{ "name": "c_3_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_3_out", "role": "default" }} , 
 	{ "name": "c_3_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "c_3_out", "role": "ap_vld" }} , 
 	{ "name": "c_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_2_out", "role": "default" }} , 
 	{ "name": "c_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "c_2_out", "role": "ap_vld" }} , 
 	{ "name": "c_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_1_out", "role": "default" }} , 
 	{ "name": "c_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "c_1_out", "role": "ap_vld" }} , 
 	{ "name": "c_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_out", "role": "default" }} , 
 	{ "name": "c_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "c_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	sin_or_cos_double_Pipeline_3 {
		out_bits_7_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_8_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_9_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_6 {Type I LastRead 0 FirstWrite -1}
		c_3_out {Type O LastRead -1 FirstWrite 0}
		c_2_out {Type O LastRead -1 FirstWrite 0}
		c_1_out {Type O LastRead -1 FirstWrite 0}
		c_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "6"}
	, {"Name" : "Interval", "Min" : "5", "Max" : "5"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	out_bits_7_reload { ap_none {  { out_bits_7_reload in_data 0 32 } } }
	out_bits_8_reload { ap_none {  { out_bits_8_reload in_data 0 32 } } }
	out_bits_9_reload { ap_none {  { out_bits_9_reload in_data 0 32 } } }
	out_bits_6 { ap_none {  { out_bits_6 in_data 0 32 } } }
	c_3_out { ap_vld {  { c_3_out out_data 1 32 }  { c_3_out_ap_vld out_vld 1 1 } } }
	c_2_out { ap_vld {  { c_2_out out_data 1 32 }  { c_2_out_ap_vld out_vld 1 1 } } }
	c_1_out { ap_vld {  { c_1_out out_data 1 32 }  { c_1_out_ap_vld out_vld 1 1 } } }
	c_out { ap_vld {  { c_out out_data 1 32 }  { c_out_ap_vld out_vld 1 1 } } }
}
