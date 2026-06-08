set moduleName matrix_convolution_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_23_2_VITIS_LOOP_27_3_VITI
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
set C_modelName {matrix_convolution_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_23_2_VITIS_LOOP_27_3_VITI}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ i int 32 regular  }
	{ sext_ln21 int 32 regular  }
	{ mul_ln18_2 int 159 regular  }
	{ mul_ln18_1 int 128 regular  }
	{ add_ln21 int 32 regular  }
	{ sext_ln29 int 32 regular  }
	{ mul_ln18 int 96 regular  }
	{ sext_ln21_2 int 32 regular  }
	{ sext_ln21_1 int 32 regular  }
	{ value_r double 64 regular  }
	{ bitcast_ln48 double 64 regular  }
	{ sum_1_out double 64 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "i", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln18_2", "interface" : "wire", "bitwidth" : 159, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln18_1", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln21", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln29", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln18", "interface" : "wire", "bitwidth" : 96, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "value_r", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "bitcast_ln48", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "sum_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ i sc_in sc_lv 32 signal 0 } 
	{ sext_ln21 sc_in sc_lv 32 signal 1 } 
	{ mul_ln18_2 sc_in sc_lv 159 signal 2 } 
	{ mul_ln18_1 sc_in sc_lv 128 signal 3 } 
	{ add_ln21 sc_in sc_lv 32 signal 4 } 
	{ sext_ln29 sc_in sc_lv 32 signal 5 } 
	{ mul_ln18 sc_in sc_lv 96 signal 6 } 
	{ sext_ln21_2 sc_in sc_lv 32 signal 7 } 
	{ sext_ln21_1 sc_in sc_lv 32 signal 8 } 
	{ value_r sc_in sc_lv 64 signal 9 } 
	{ bitcast_ln48 sc_in sc_lv 64 signal 10 } 
	{ sum_1_out sc_out sc_lv 64 signal 11 } 
	{ sum_1_out_ap_vld sc_out sc_logic 1 outvld 11 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "i", "role": "default" }} , 
 	{ "name": "sext_ln21", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln21", "role": "default" }} , 
 	{ "name": "mul_ln18_2", "direction": "in", "datatype": "sc_lv", "bitwidth":159, "type": "signal", "bundle":{"name": "mul_ln18_2", "role": "default" }} , 
 	{ "name": "mul_ln18_1", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "mul_ln18_1", "role": "default" }} , 
 	{ "name": "add_ln21", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "add_ln21", "role": "default" }} , 
 	{ "name": "sext_ln29", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln29", "role": "default" }} , 
 	{ "name": "mul_ln18", "direction": "in", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "mul_ln18", "role": "default" }} , 
 	{ "name": "sext_ln21_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln21_2", "role": "default" }} , 
 	{ "name": "sext_ln21_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln21_1", "role": "default" }} , 
 	{ "name": "value_r", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "value_r", "role": "default" }} , 
 	{ "name": "bitcast_ln48", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bitcast_ln48", "role": "default" }} , 
 	{ "name": "sum_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "sum_1_out", "role": "default" }} , 
 	{ "name": "sum_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "sum_1_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	matrix_convolution_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_23_2_VITIS_LOOP_27_3_VITI {
		i {Type I LastRead 0 FirstWrite -1}
		sext_ln21 {Type I LastRead 0 FirstWrite -1}
		mul_ln18_2 {Type I LastRead 0 FirstWrite -1}
		mul_ln18_1 {Type I LastRead 0 FirstWrite -1}
		add_ln21 {Type I LastRead 0 FirstWrite -1}
		sext_ln29 {Type I LastRead 0 FirstWrite -1}
		mul_ln18 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_2 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_1 {Type I LastRead 0 FirstWrite -1}
		value_r {Type I LastRead 0 FirstWrite -1}
		bitcast_ln48 {Type I LastRead 0 FirstWrite -1}
		sum_1_out {Type O LastRead -1 FirstWrite 10}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	i { ap_none {  { i in_data 0 32 } } }
	sext_ln21 { ap_none {  { sext_ln21 in_data 0 32 } } }
	mul_ln18_2 { ap_none {  { mul_ln18_2 in_data 0 159 } } }
	mul_ln18_1 { ap_none {  { mul_ln18_1 in_data 0 128 } } }
	add_ln21 { ap_none {  { add_ln21 in_data 0 32 } } }
	sext_ln29 { ap_none {  { sext_ln29 in_data 0 32 } } }
	mul_ln18 { ap_none {  { mul_ln18 in_data 0 96 } } }
	sext_ln21_2 { ap_none {  { sext_ln21_2 in_data 0 32 } } }
	sext_ln21_1 { ap_none {  { sext_ln21_1 in_data 0 32 } } }
	value_r { ap_none {  { value_r in_data 0 64 } } }
	bitcast_ln48 { ap_none {  { bitcast_ln48 in_data 0 64 } } }
	sum_1_out { ap_vld {  { sum_1_out out_data 1 64 }  { sum_1_out_ap_vld out_vld 1 1 } } }
}
