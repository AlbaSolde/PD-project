set moduleName cifar10_Pipeline_VITIS_LOOP_109_1_VITIS_LOOP_111_2
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
set cdfgNum 20
set C_modelName {cifar10_Pipeline_VITIS_LOOP_109_1_VITIS_LOOP_111_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ bitcast_ln109 float 32 regular  }
	{ pooling_1_output_load int 32 regular  }
	{ mul_ln155_2 int 64 regular  }
	{ p_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "bitcast_ln109", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "pooling_1_output_load", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln155_2", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "p_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 38
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ bitcast_ln109 sc_in sc_lv 32 signal 0 } 
	{ pooling_1_output_load sc_in sc_lv 32 signal 1 } 
	{ mul_ln155_2 sc_in sc_lv 64 signal 2 } 
	{ p_out sc_out sc_lv 32 signal 3 } 
	{ p_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ grp_fu_1351_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1351_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1351_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1354_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1354_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1354_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1357_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1357_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1357_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_1357_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1357_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1361_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1361_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1361_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1361_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1365_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1365_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_1365_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_1365_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_pow_generic_double_s_fu_1369_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_pow_generic_double_s_fu_1369_p_din2 sc_out sc_lv 64 signal -1 } 
	{ grp_pow_generic_double_s_fu_1369_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_pow_generic_double_s_fu_1369_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_pow_generic_double_s_fu_1369_p_start sc_out sc_logic 1 signal -1 } 
	{ grp_pow_generic_double_s_fu_1369_p_ready sc_in sc_logic 1 signal -1 } 
	{ grp_pow_generic_double_s_fu_1369_p_done sc_in sc_logic 1 signal -1 } 
	{ grp_pow_generic_double_s_fu_1369_p_idle sc_in sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "bitcast_ln109", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bitcast_ln109", "role": "default" }} , 
 	{ "name": "pooling_1_output_load", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pooling_1_output_load", "role": "default" }} , 
 	{ "name": "mul_ln155_2", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mul_ln155_2", "role": "default" }} , 
 	{ "name": "p_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out", "role": "default" }} , 
 	{ "name": "p_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_1351_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1351_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1351_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1351_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1351_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1351_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1354_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1354_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1354_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1354_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1354_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1354_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1357_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1357_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1357_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1357_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1357_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_1357_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1357_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1357_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1357_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1357_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1361_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1361_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1361_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1361_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1361_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1361_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1361_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1361_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1365_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1365_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1365_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1365_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1365_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_1365_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1365_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1365_p_ce", "role": "default" }} , 
 	{ "name": "grp_pow_generic_double_s_fu_1369_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_pow_generic_double_s_fu_1369_p_din1", "role": "default" }} , 
 	{ "name": "grp_pow_generic_double_s_fu_1369_p_din2", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_pow_generic_double_s_fu_1369_p_din2", "role": "default" }} , 
 	{ "name": "grp_pow_generic_double_s_fu_1369_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_pow_generic_double_s_fu_1369_p_dout0", "role": "default" }} , 
 	{ "name": "grp_pow_generic_double_s_fu_1369_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_pow_generic_double_s_fu_1369_p_ce", "role": "default" }} , 
 	{ "name": "grp_pow_generic_double_s_fu_1369_p_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_pow_generic_double_s_fu_1369_p_start", "role": "default" }} , 
 	{ "name": "grp_pow_generic_double_s_fu_1369_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_pow_generic_double_s_fu_1369_p_ready", "role": "default" }} , 
 	{ "name": "grp_pow_generic_double_s_fu_1369_p_done", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_pow_generic_double_s_fu_1369_p_done", "role": "default" }} , 
 	{ "name": "grp_pow_generic_double_s_fu_1369_p_idle", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_pow_generic_double_s_fu_1369_p_idle", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	cifar10_Pipeline_VITIS_LOOP_109_1_VITIS_LOOP_111_2 {
		bitcast_ln109 {Type I LastRead 0 FirstWrite -1}
		pooling_1_output_load {Type I LastRead 0 FirstWrite -1}
		mul_ln155_2 {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 1}
		pow_reduce_anonymous_namespace_log_inverse_lut_table_pow_0_5_64_array {Type I LastRead -1 FirstWrite -1}
		pow_reduce_anonymous_namespace_log0_lut_table_array {Type I LastRead -1 FirstWrite -1}
		pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_4_4_16_array {Type I LastRead -1 FirstWrite -1}
		pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_7_6_64_array {Type I LastRead -1 FirstWrite -1}
		pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_12_6_64_array {Type I LastRead -1 FirstWrite -1}
		pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_17_6_64_array {Type I LastRead -1 FirstWrite -1}
		pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_22_6_64_array {Type I LastRead -1 FirstWrite -1}
		pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_27_6_64_array {Type I LastRead -1 FirstWrite -1}
		pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_32_6_64_array {Type I LastRead -1 FirstWrite -1}
		pow_reduce_anonymous_namespace_table_exp_Z1_ap_ufixed_array {Type I LastRead -1 FirstWrite -1}
		pow_reduce_anonymous_namespace_table_f_Z3_ap_ufixed_array {Type I LastRead -1 FirstWrite -1}
		pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_array {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	bitcast_ln109 { ap_none {  { bitcast_ln109 in_data 0 32 } } }
	pooling_1_output_load { ap_none {  { pooling_1_output_load in_data 0 32 } } }
	mul_ln155_2 { ap_none {  { mul_ln155_2 in_data 0 64 } } }
	p_out { ap_vld {  { p_out out_data 1 32 }  { p_out_ap_vld out_vld 1 1 } } }
}
