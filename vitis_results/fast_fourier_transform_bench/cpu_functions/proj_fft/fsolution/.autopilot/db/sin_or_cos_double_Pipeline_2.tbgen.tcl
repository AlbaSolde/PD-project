set moduleName sin_or_cos_double_Pipeline_2
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
set C_modelName {sin_or_cos<double>_Pipeline_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ out_bits_5_reload int 32 regular  }
	{ out_bits_4_reload int 32 regular  }
	{ out_bits_3_reload int 32 regular  }
	{ result int 63 regular  }
	{ out_bits_9_out int 32 regular {pointer 1}  }
	{ out_bits_8_out int 32 regular {pointer 1}  }
	{ out_bits_7_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "out_bits_5_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "out_bits_4_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "out_bits_3_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "result", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "out_bits_9_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_bits_8_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_bits_7_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ out_bits_5_reload sc_in sc_lv 32 signal 0 } 
	{ out_bits_4_reload sc_in sc_lv 32 signal 1 } 
	{ out_bits_3_reload sc_in sc_lv 32 signal 2 } 
	{ result sc_in sc_lv 63 signal 3 } 
	{ out_bits_9_out sc_out sc_lv 32 signal 4 } 
	{ out_bits_9_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ out_bits_8_out sc_out sc_lv 32 signal 5 } 
	{ out_bits_8_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ out_bits_7_out sc_out sc_lv 32 signal 6 } 
	{ out_bits_7_out_ap_vld sc_out sc_logic 1 outvld 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "out_bits_5_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_bits_5_reload", "role": "default" }} , 
 	{ "name": "out_bits_4_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_bits_4_reload", "role": "default" }} , 
 	{ "name": "out_bits_3_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_bits_3_reload", "role": "default" }} , 
 	{ "name": "result", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "result", "role": "default" }} , 
 	{ "name": "out_bits_9_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_bits_9_out", "role": "default" }} , 
 	{ "name": "out_bits_9_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_bits_9_out", "role": "ap_vld" }} , 
 	{ "name": "out_bits_8_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_bits_8_out", "role": "default" }} , 
 	{ "name": "out_bits_8_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_bits_8_out", "role": "ap_vld" }} , 
 	{ "name": "out_bits_7_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_bits_7_out", "role": "default" }} , 
 	{ "name": "out_bits_7_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_bits_7_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	sin_or_cos_double_Pipeline_2 {
		out_bits_5_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_4_reload {Type I LastRead 0 FirstWrite -1}
		out_bits_3_reload {Type I LastRead 0 FirstWrite -1}
		result {Type I LastRead 0 FirstWrite -1}
		out_bits_9_out {Type O LastRead -1 FirstWrite 0}
		out_bits_8_out {Type O LastRead -1 FirstWrite 0}
		out_bits_7_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5", "Max" : "5"}
	, {"Name" : "Interval", "Min" : "4", "Max" : "4"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	out_bits_5_reload { ap_none {  { out_bits_5_reload in_data 0 32 } } }
	out_bits_4_reload { ap_none {  { out_bits_4_reload in_data 0 32 } } }
	out_bits_3_reload { ap_none {  { out_bits_3_reload in_data 0 32 } } }
	result { ap_none {  { result in_data 0 63 } } }
	out_bits_9_out { ap_vld {  { out_bits_9_out out_data 1 32 }  { out_bits_9_out_ap_vld out_vld 1 1 } } }
	out_bits_8_out { ap_vld {  { out_bits_8_out out_data 1 32 }  { out_bits_8_out_ap_vld out_vld 1 1 } } }
	out_bits_7_out { ap_vld {  { out_bits_7_out out_data 1 32 }  { out_bits_7_out_ap_vld out_vld 1 1 } } }
}
