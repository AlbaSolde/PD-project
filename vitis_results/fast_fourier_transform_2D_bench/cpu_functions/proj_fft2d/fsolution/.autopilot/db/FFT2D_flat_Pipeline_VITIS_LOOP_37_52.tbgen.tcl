set moduleName FFT2D_flat_Pipeline_VITIS_LOOP_37_52
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
set C_modelName {FFT2D_flat_Pipeline_VITIS_LOOP_37_52}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict col_x { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict col_y { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ select_ln37_1 int 31 regular  }
	{ empty_38 int 6 regular  }
	{ col_x float 32 regular {array 64 { 0 1 } 1 1 }  }
	{ col_y float 32 regular {array 64 { 0 1 } 1 1 }  }
	{ empty int 6 regular  }
	{ wcos_1 float 32 regular  }
	{ wsin_1 float 32 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "select_ln37_1", "interface" : "wire", "bitwidth" : 31, "direction" : "READONLY"} , 
 	{ "Name" : "empty_38", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "col_x", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "col_y", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "wcos_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "wsin_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 51
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ select_ln37_1 sc_in sc_lv 31 signal 0 } 
	{ empty_38 sc_in sc_lv 6 signal 1 } 
	{ col_x_address0 sc_out sc_lv 6 signal 2 } 
	{ col_x_ce0 sc_out sc_logic 1 signal 2 } 
	{ col_x_we0 sc_out sc_logic 1 signal 2 } 
	{ col_x_d0 sc_out sc_lv 32 signal 2 } 
	{ col_x_address1 sc_out sc_lv 6 signal 2 } 
	{ col_x_ce1 sc_out sc_logic 1 signal 2 } 
	{ col_x_q1 sc_in sc_lv 32 signal 2 } 
	{ col_y_address0 sc_out sc_lv 6 signal 3 } 
	{ col_y_ce0 sc_out sc_logic 1 signal 3 } 
	{ col_y_we0 sc_out sc_logic 1 signal 3 } 
	{ col_y_d0 sc_out sc_lv 32 signal 3 } 
	{ col_y_address1 sc_out sc_lv 6 signal 3 } 
	{ col_y_ce1 sc_out sc_logic 1 signal 3 } 
	{ col_y_q1 sc_in sc_lv 32 signal 3 } 
	{ empty sc_in sc_lv 6 signal 4 } 
	{ wcos_1 sc_in sc_lv 32 signal 5 } 
	{ wsin_1 sc_in sc_lv 32 signal 6 } 
	{ grp_fu_749_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_749_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_749_p_opcode sc_out sc_lv 2 signal -1 } 
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
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "select_ln37_1", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "select_ln37_1", "role": "default" }} , 
 	{ "name": "empty_38", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "empty_38", "role": "default" }} , 
 	{ "name": "col_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "col_x", "role": "address0" }} , 
 	{ "name": "col_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "col_x", "role": "ce0" }} , 
 	{ "name": "col_x_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "col_x", "role": "we0" }} , 
 	{ "name": "col_x_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "col_x", "role": "d0" }} , 
 	{ "name": "col_x_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "col_x", "role": "address1" }} , 
 	{ "name": "col_x_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "col_x", "role": "ce1" }} , 
 	{ "name": "col_x_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "col_x", "role": "q1" }} , 
 	{ "name": "col_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "col_y", "role": "address0" }} , 
 	{ "name": "col_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "col_y", "role": "ce0" }} , 
 	{ "name": "col_y_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "col_y", "role": "we0" }} , 
 	{ "name": "col_y_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "col_y", "role": "d0" }} , 
 	{ "name": "col_y_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "col_y", "role": "address1" }} , 
 	{ "name": "col_y_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "col_y", "role": "ce1" }} , 
 	{ "name": "col_y_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "col_y", "role": "q1" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "wcos_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "wcos_1", "role": "default" }} , 
 	{ "name": "wsin_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "wsin_1", "role": "default" }} , 
 	{ "name": "grp_fu_749_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_749_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_749_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_749_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_749_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_749_p_opcode", "role": "default" }} , 
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
 	{ "name": "grp_fu_769_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_769_p_ce", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	FFT2D_flat_Pipeline_VITIS_LOOP_37_52 {
		select_ln37_1 {Type I LastRead 0 FirstWrite -1}
		empty_38 {Type I LastRead 0 FirstWrite -1}
		col_x {Type IO LastRead 3 FirstWrite 18}
		col_y {Type IO LastRead 3 FirstWrite 18}
		empty {Type I LastRead 0 FirstWrite -1}
		wcos_1 {Type I LastRead 0 FirstWrite -1}
		wsin_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "18253610994"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "18253610993"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	select_ln37_1 { ap_none {  { select_ln37_1 in_data 0 31 } } }
	empty_38 { ap_none {  { empty_38 in_data 0 6 } } }
	col_x { ap_memory {  { col_x_address0 mem_address 1 6 }  { col_x_ce0 mem_ce 1 1 }  { col_x_we0 mem_we 1 1 }  { col_x_d0 mem_din 1 32 }  { col_x_address1 MemPortADDR2 1 6 }  { col_x_ce1 MemPortCE2 1 1 }  { col_x_q1 MemPortDOUT2 0 32 } } }
	col_y { ap_memory {  { col_y_address0 mem_address 1 6 }  { col_y_ce0 mem_ce 1 1 }  { col_y_we0 mem_we 1 1 }  { col_y_d0 mem_din 1 32 }  { col_y_address1 MemPortADDR2 1 6 }  { col_y_ce1 MemPortCE2 1 1 }  { col_y_q1 MemPortDOUT2 0 32 } } }
	empty { ap_none {  { empty in_data 0 6 } } }
	wcos_1 { ap_none {  { wcos_1 in_data 0 32 } } }
	wsin_1 { ap_none {  { wsin_1 in_data 0 32 } } }
}
