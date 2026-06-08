set moduleName max_pooling_Pipeline_VITIS_LOOP_49_3_VITIS_LOOP_51_4
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
set cdfgNum 4
set C_modelName {max_pooling_Pipeline_VITIS_LOOP_49_3_VITIS_LOOP_51_4}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ max_value double 64 regular  }
	{ mul_ln40 int 64 regular  }
	{ A_load int 63 regular  }
	{ empty int 52 regular  }
	{ max_value_4_out double 64 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "max_value", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln40", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "A_load", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 52, "direction" : "READONLY"} , 
 	{ "Name" : "max_value_4_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 12
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ max_value sc_in sc_lv 64 signal 0 } 
	{ mul_ln40 sc_in sc_lv 64 signal 1 } 
	{ A_load sc_in sc_lv 63 signal 2 } 
	{ empty sc_in sc_lv 52 signal 3 } 
	{ max_value_4_out sc_out sc_lv 64 signal 4 } 
	{ max_value_4_out_ap_vld sc_out sc_logic 1 outvld 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "max_value", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "max_value", "role": "default" }} , 
 	{ "name": "mul_ln40", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mul_ln40", "role": "default" }} , 
 	{ "name": "A_load", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "A_load", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":52, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "max_value_4_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "max_value_4_out", "role": "default" }} , 
 	{ "name": "max_value_4_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "max_value_4_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	max_pooling_Pipeline_VITIS_LOOP_49_3_VITIS_LOOP_51_4 {
		max_value {Type I LastRead 0 FirstWrite -1}
		mul_ln40 {Type I LastRead 0 FirstWrite -1}
		A_load {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		max_value_4_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	max_value { ap_none {  { max_value in_data 0 64 } } }
	mul_ln40 { ap_none {  { mul_ln40 in_data 0 64 } } }
	A_load { ap_none {  { A_load in_data 0 63 } } }
	empty { ap_none {  { empty in_data 0 52 } } }
	max_value_4_out { ap_vld {  { max_value_4_out out_data 1 64 }  { max_value_4_out_ap_vld out_vld 1 1 } } }
}
