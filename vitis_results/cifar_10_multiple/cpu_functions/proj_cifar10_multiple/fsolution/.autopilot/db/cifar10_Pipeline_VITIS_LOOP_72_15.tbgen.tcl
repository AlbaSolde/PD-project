set moduleName cifar10_Pipeline_VITIS_LOOP_72_15
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
set C_modelName {cifar10_Pipeline_VITIS_LOOP_72_15}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ acumulated_2_reload float 32 regular  }
	{ neurons_dense_2_size int 32 regular  }
	{ p_out float 32 regular {pointer 1}  }
	{ p_phi44_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "acumulated_2_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "neurons_dense_2_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_phi44_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ acumulated_2_reload sc_in sc_lv 32 signal 0 } 
	{ neurons_dense_2_size sc_in sc_lv 32 signal 1 } 
	{ p_out sc_out sc_lv 32 signal 2 } 
	{ p_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ p_phi44_out sc_out sc_lv 32 signal 3 } 
	{ p_phi44_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ grp_fu_1347_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1347_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1347_p_opcode sc_out sc_lv 5 signal -1 } 
	{ grp_fu_1347_p_dout0 sc_in sc_lv 1 signal -1 } 
	{ grp_fu_1347_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "acumulated_2_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acumulated_2_reload", "role": "default" }} , 
 	{ "name": "neurons_dense_2_size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "neurons_dense_2_size", "role": "default" }} , 
 	{ "name": "p_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out", "role": "default" }} , 
 	{ "name": "p_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out", "role": "ap_vld" }} , 
 	{ "name": "p_phi44_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_phi44_out", "role": "default" }} , 
 	{ "name": "p_phi44_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_phi44_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_1347_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1347_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1347_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1347_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1347_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_1347_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_1347_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1347_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1347_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1347_p_ce", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	cifar10_Pipeline_VITIS_LOOP_72_15 {
		acumulated_2_reload {Type I LastRead 0 FirstWrite -1}
		neurons_dense_2_size {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 1}
		p_phi44_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "3", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	acumulated_2_reload { ap_none {  { acumulated_2_reload in_data 0 32 } } }
	neurons_dense_2_size { ap_none {  { neurons_dense_2_size in_data 0 32 } } }
	p_out { ap_vld {  { p_out out_data 1 32 }  { p_out_ap_vld out_vld 1 1 } } }
	p_phi44_out { ap_vld {  { p_phi44_out out_data 1 32 }  { p_phi44_out_ap_vld out_vld 1 1 } } }
}
