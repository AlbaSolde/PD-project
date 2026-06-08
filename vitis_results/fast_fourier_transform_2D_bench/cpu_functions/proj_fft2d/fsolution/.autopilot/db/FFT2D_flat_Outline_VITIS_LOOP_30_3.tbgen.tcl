set moduleName FFT2D_flat_Outline_VITIS_LOOP_30_3
set isTopModule 0
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
set cdfgNum 14
set C_modelName {FFT2D_flat_Outline_VITIS_LOOP_30_3}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ ny int 32 regular  }
	{ out_flat int 64 regular {pointer 2}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "ny", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "out_flat", "interface" : "wire", "bitwidth" : 64, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 60
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ny sc_in sc_lv 32 signal 0 } 
	{ out_flat_i sc_in sc_lv 64 signal 1 } 
	{ out_flat_o sc_out sc_lv 64 signal 1 } 
	{ out_flat_o_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ grp_fu_323_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_323_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_323_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_326_p_din0 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_326_p_din1 sc_out sc_lv 64 signal -1 } 
	{ grp_fu_326_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_326_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_331_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_331_p_dout0 sc_in sc_lv 64 signal -1 } 
	{ grp_fu_331_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_749_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_749_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_749_p_opcode sc_out sc_lv 1 signal -1 } 
	{ grp_fu_749_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_749_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_753_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_753_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_753_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_753_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_753_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_757_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_757_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_757_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_757_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_761_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_761_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_761_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_761_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_765_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_765_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_765_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_765_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_769_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_769_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_769_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_769_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_sin_or_cos_float_s_fu_282_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_sin_or_cos_float_s_fu_282_p_din2 sc_out sc_lv 1 signal -1 } 
	{ grp_sin_or_cos_float_s_fu_282_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_sin_or_cos_float_s_fu_282_p_start sc_out sc_logic 1 signal -1 } 
	{ grp_sin_or_cos_float_s_fu_282_p_ready sc_in sc_logic 1 signal -1 } 
	{ grp_sin_or_cos_float_s_fu_282_p_done sc_in sc_logic 1 signal -1 } 
	{ grp_sin_or_cos_float_s_fu_282_p_idle sc_in sc_logic 1 signal -1 } 
	{ grp_sin_or_cos_float_s_fu_297_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_sin_or_cos_float_s_fu_297_p_din2 sc_out sc_lv 1 signal -1 } 
	{ grp_sin_or_cos_float_s_fu_297_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_sin_or_cos_float_s_fu_297_p_start sc_out sc_logic 1 signal -1 } 
	{ grp_sin_or_cos_float_s_fu_297_p_ready sc_in sc_logic 1 signal -1 } 
	{ grp_sin_or_cos_float_s_fu_297_p_done sc_in sc_logic 1 signal -1 } 
	{ grp_sin_or_cos_float_s_fu_297_p_idle sc_in sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ny", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ny", "role": "default" }} , 
 	{ "name": "out_flat_i", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "out_flat", "role": "i" }} , 
 	{ "name": "out_flat_o", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "out_flat", "role": "o" }} , 
 	{ "name": "out_flat_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_flat", "role": "o_ap_vld" }} , 
 	{ "name": "grp_fu_323_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_323_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_323_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_323_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_323_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_323_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_326_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_326_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_326_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_326_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_326_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_326_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_326_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_326_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_331_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_331_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_331_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "grp_fu_331_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_331_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_331_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_749_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_749_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_749_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_749_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_749_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_749_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_749_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_749_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_749_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_749_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_753_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_753_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_753_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_753_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_753_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_753_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_753_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_753_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_753_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_753_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_757_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_757_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_757_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_757_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_757_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_757_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_757_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_757_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_761_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_761_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_761_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_761_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_761_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_761_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_761_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_761_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_765_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_765_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_765_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_765_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_765_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_765_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_765_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_765_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_769_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_769_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_769_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_769_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_769_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_769_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_769_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_769_p_ce", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_float_s_fu_282_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_sin_or_cos_float_s_fu_282_p_din1", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_float_s_fu_282_p_din2", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_sin_or_cos_float_s_fu_282_p_din2", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_float_s_fu_282_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_sin_or_cos_float_s_fu_282_p_dout0", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_float_s_fu_282_p_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_sin_or_cos_float_s_fu_282_p_start", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_float_s_fu_282_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_sin_or_cos_float_s_fu_282_p_ready", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_float_s_fu_282_p_done", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_sin_or_cos_float_s_fu_282_p_done", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_float_s_fu_282_p_idle", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_sin_or_cos_float_s_fu_282_p_idle", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_float_s_fu_297_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_sin_or_cos_float_s_fu_297_p_din1", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_float_s_fu_297_p_din2", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_sin_or_cos_float_s_fu_297_p_din2", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_float_s_fu_297_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_sin_or_cos_float_s_fu_297_p_dout0", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_float_s_fu_297_p_start", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_sin_or_cos_float_s_fu_297_p_start", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_float_s_fu_297_p_ready", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_sin_or_cos_float_s_fu_297_p_ready", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_float_s_fu_297_p_done", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_sin_or_cos_float_s_fu_297_p_done", "role": "default" }} , 
 	{ "name": "grp_sin_or_cos_float_s_fu_297_p_idle", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_sin_or_cos_float_s_fu_297_p_idle", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	FFT2D_flat_Outline_VITIS_LOOP_30_3 {
		ny {Type I LastRead 0 FirstWrite -1}
		out_flat {Type IO LastRead 71 FirstWrite 73}
		ref_4oPi_table_100 {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K0 {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K1 {Type I LastRead -1 FirstWrite -1}
		second_order_float_sin_cos_K2 {Type I LastRead -1 FirstWrite -1}}
	FFT2D_flat_Pipeline_VITIS_LOOP_37_5 {
		out_flat_load_1 {Type I LastRead 0 FirstWrite -1}
		select_ln37 {Type I LastRead 0 FirstWrite -1}
		wcos {Type I LastRead 0 FirstWrite -1}
		wsin {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	ny { ap_none {  { ny in_data 0 32 } } }
	out_flat { ap_ovld {  { out_flat_i in_data 0 64 }  { out_flat_o out_data 1 64 }  { out_flat_o_ap_vld out_vld 1 1 } } }
}
