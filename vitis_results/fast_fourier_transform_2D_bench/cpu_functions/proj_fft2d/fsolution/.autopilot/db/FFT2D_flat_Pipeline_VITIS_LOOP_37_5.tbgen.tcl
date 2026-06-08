set moduleName FFT2D_flat_Pipeline_VITIS_LOOP_37_5
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
set cdfgNum 14
set C_modelName {FFT2D_flat_Pipeline_VITIS_LOOP_37_5}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ out_flat_load_1 int 64 regular  }
	{ select_ln37 int 31 regular  }
	{ wcos float 32 regular  }
	{ wsin float 32 regular  }
	{ p_out int 64 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "out_flat_load_1", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln37", "interface" : "wire", "bitwidth" : 31, "direction" : "READONLY"} , 
 	{ "Name" : "wcos", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "wsin", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 38
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ out_flat_load_1 sc_in sc_lv 64 signal 0 } 
	{ select_ln37 sc_in sc_lv 31 signal 1 } 
	{ wcos sc_in sc_lv 32 signal 2 } 
	{ wsin sc_in sc_lv 32 signal 3 } 
	{ p_out sc_out sc_lv 64 signal 4 } 
	{ p_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ grp_fu_320_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_320_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_320_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_320_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_320_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_324_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_324_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_324_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_324_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_324_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_328_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_328_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_328_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_328_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_332_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_332_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_332_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_332_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_336_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_336_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_336_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_336_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_340_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_340_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_340_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_340_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "out_flat_load_1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "out_flat_load_1", "role": "default" }} , 
 	{ "name": "select_ln37", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "select_ln37", "role": "default" }} , 
 	{ "name": "wcos", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "wcos", "role": "default" }} , 
 	{ "name": "wsin", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "wsin", "role": "default" }} , 
 	{ "name": "p_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_out", "role": "default" }} , 
 	{ "name": "p_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_320_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_320_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_320_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_320_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_320_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_320_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_320_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_320_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_320_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_320_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_324_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_324_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_324_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_324_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_324_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_324_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_324_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_324_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_324_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_324_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_328_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_328_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_328_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_328_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_328_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_328_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_328_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_328_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_332_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_332_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_332_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_332_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_332_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_332_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_332_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_332_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_336_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_336_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_336_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_336_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_336_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_336_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_336_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_336_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_340_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_340_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_340_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_340_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_340_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_340_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_340_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_340_p_ce", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	FFT2D_flat_Pipeline_VITIS_LOOP_37_5 {
		out_flat_load_1 {Type I LastRead 0 FirstWrite -1}
		select_ln37 {Type I LastRead 0 FirstWrite -1}
		wcos {Type I LastRead 0 FirstWrite -1}
		wsin {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "15032385524"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "15032385523"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	out_flat_load_1 { ap_none {  { out_flat_load_1 in_data 0 64 } } }
	select_ln37 { ap_none {  { select_ln37 in_data 0 31 } } }
	wcos { ap_none {  { wcos in_data 0 32 } } }
	wsin { ap_none {  { wsin in_data 0 32 } } }
	p_out { ap_vld {  { p_out out_data 1 64 }  { p_out_ap_vld out_vld 1 1 } } }
}
