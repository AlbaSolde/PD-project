set moduleName correlation_2D_Pipeline_VITIS_LOOP_31_1_VITIS_LOOP_32_2
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
set cdfgNum 6
set C_modelName {correlation_2D_Pipeline_VITIS_LOOP_31_1_VITIS_LOOP_32_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ mul_ln20 int 63 regular  }
	{ mul float 32 regular  }
	{ mul1 float 32 regular  }
	{ mul2 float 32 regular  }
	{ acumulate_value_b_b_1_out float 32 regular {pointer 1}  }
	{ acumulate_value_a_b_1_out float 32 regular {pointer 1}  }
	{ acumulate_value_a_a_1_out float 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "mul_ln20", "interface" : "wire", "bitwidth" : 63, "direction" : "READONLY"} , 
 	{ "Name" : "mul", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mul1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mul2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "acumulate_value_b_b_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acumulate_value_a_b_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "acumulate_value_a_a_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ mul_ln20 sc_in sc_lv 63 signal 0 } 
	{ mul sc_in sc_lv 32 signal 1 } 
	{ mul1 sc_in sc_lv 32 signal 2 } 
	{ mul2 sc_in sc_lv 32 signal 3 } 
	{ acumulate_value_b_b_1_out sc_out sc_lv 32 signal 4 } 
	{ acumulate_value_b_b_1_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ acumulate_value_a_b_1_out sc_out sc_lv 32 signal 5 } 
	{ acumulate_value_a_b_1_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ acumulate_value_a_a_1_out sc_out sc_lv 32 signal 6 } 
	{ acumulate_value_a_a_1_out_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ grp_fu_112_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_112_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_112_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_112_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_112_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mul_ln20", "direction": "in", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "mul_ln20", "role": "default" }} , 
 	{ "name": "mul", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mul", "role": "default" }} , 
 	{ "name": "mul1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mul1", "role": "default" }} , 
 	{ "name": "mul2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mul2", "role": "default" }} , 
 	{ "name": "acumulate_value_b_b_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acumulate_value_b_b_1_out", "role": "default" }} , 
 	{ "name": "acumulate_value_b_b_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acumulate_value_b_b_1_out", "role": "ap_vld" }} , 
 	{ "name": "acumulate_value_a_b_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acumulate_value_a_b_1_out", "role": "default" }} , 
 	{ "name": "acumulate_value_a_b_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acumulate_value_a_b_1_out", "role": "ap_vld" }} , 
 	{ "name": "acumulate_value_a_a_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acumulate_value_a_a_1_out", "role": "default" }} , 
 	{ "name": "acumulate_value_a_a_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acumulate_value_a_a_1_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_112_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_112_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_112_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_112_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_112_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_112_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_112_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_112_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_112_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_112_p_ce", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
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
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	mul_ln20 { ap_none {  { mul_ln20 in_data 0 63 } } }
	mul { ap_none {  { mul in_data 0 32 } } }
	mul1 { ap_none {  { mul1 in_data 0 32 } } }
	mul2 { ap_none {  { mul2 in_data 0 32 } } }
	acumulate_value_b_b_1_out { ap_vld {  { acumulate_value_b_b_1_out out_data 1 32 }  { acumulate_value_b_b_1_out_ap_vld out_vld 1 1 } } }
	acumulate_value_a_b_1_out { ap_vld {  { acumulate_value_a_b_1_out out_data 1 32 }  { acumulate_value_a_b_1_out_ap_vld out_vld 1 1 } } }
	acumulate_value_a_a_1_out { ap_vld {  { acumulate_value_a_a_1_out out_data 1 32 }  { acumulate_value_a_a_1_out_ap_vld out_vld 1 1 } } }
}
