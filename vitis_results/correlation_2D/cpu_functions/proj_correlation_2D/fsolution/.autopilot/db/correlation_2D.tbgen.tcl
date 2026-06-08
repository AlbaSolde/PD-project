set moduleName correlation_2D
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
set cdfgNum 6
set C_modelName {correlation_2D}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ A int 32 regular {pointer 0}  }
	{ B int 32 regular {pointer 0}  }
	{ R int 32 regular {pointer 1}  }
	{ size int 32 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "A", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "B", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "R", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 11
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ A sc_in sc_lv 32 signal 0 } 
	{ B sc_in sc_lv 32 signal 1 } 
	{ R sc_out sc_lv 32 signal 2 } 
	{ R_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ size sc_in sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "A", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "default" }} , 
 	{ "name": "B", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B", "role": "default" }} , 
 	{ "name": "R", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "R", "role": "default" }} , 
 	{ "name": "R_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "R", "role": "ap_vld" }} , 
 	{ "name": "size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "size", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	correlation_2D {
		A {Type I LastRead 3 FirstWrite -1}
		B {Type I LastRead 3 FirstWrite -1}
		R {Type O LastRead -1 FirstWrite 69}
		size {Type I LastRead 0 FirstWrite -1}}
	correlation_2D_Pipeline_VITIS_LOOP_9_1_VITIS_LOOP_10_2 {
		mul_ln20 {Type I LastRead 0 FirstWrite -1}
		conv_i {Type I LastRead 0 FirstWrite -1}
		suma_valores_1_out {Type O LastRead -1 FirstWrite 1}}
	correlation_2D_Pipeline_VITIS_LOOP_9_1_VITIS_LOOP_10_21 {
		mul_ln20 {Type I LastRead 0 FirstWrite -1}
		conv_i1 {Type I LastRead 0 FirstWrite -1}
		suma_valores_3_out {Type O LastRead -1 FirstWrite 1}}
	correlation_2D_Pipeline_VITIS_LOOP_31_1_VITIS_LOOP_32_2 {
		mul_ln20 {Type I LastRead 0 FirstWrite -1}
		mul {Type I LastRead 0 FirstWrite -1}
		mul1 {Type I LastRead 0 FirstWrite -1}
		mul2 {Type I LastRead 0 FirstWrite -1}
		acumulate_value_b_b_1_out {Type O LastRead -1 FirstWrite 3}
		acumulate_value_a_b_1_out {Type O LastRead -1 FirstWrite 3}
		acumulate_value_a_a_1_out {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	A { ap_none {  { A in_data 0 32 } } }
	B { ap_none {  { B in_data 0 32 } } }
	R { ap_vld {  { R out_data 1 32 }  { R_ap_vld out_vld 1 1 } } }
	size { ap_none {  { size in_data 0 32 } } }
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
