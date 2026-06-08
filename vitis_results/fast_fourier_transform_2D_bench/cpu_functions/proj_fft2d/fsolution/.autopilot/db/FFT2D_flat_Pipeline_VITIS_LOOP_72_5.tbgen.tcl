set moduleName FFT2D_flat_Pipeline_VITIS_LOOP_72_5
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
set C_modelName {FFT2D_flat_Pipeline_VITIS_LOOP_72_5}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict col_x { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict col_y { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ nx int 32 regular  }
	{ col_x float 32 regular {array 64 { 1 3 } 1 1 }  }
	{ col_y float 32 regular {array 64 { 1 3 } 1 1 }  }
	{ p_phi_out int 64 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "nx", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "col_x", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "col_y", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_phi_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ nx sc_in sc_lv 32 signal 0 } 
	{ col_x_address0 sc_out sc_lv 6 signal 1 } 
	{ col_x_ce0 sc_out sc_logic 1 signal 1 } 
	{ col_x_q0 sc_in sc_lv 32 signal 1 } 
	{ col_y_address0 sc_out sc_lv 6 signal 2 } 
	{ col_y_ce0 sc_out sc_logic 1 signal 2 } 
	{ col_y_q0 sc_in sc_lv 32 signal 2 } 
	{ p_phi_out sc_out sc_lv 64 signal 3 } 
	{ p_phi_out_ap_vld sc_out sc_logic 1 outvld 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "nx", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "nx", "role": "default" }} , 
 	{ "name": "col_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "col_x", "role": "address0" }} , 
 	{ "name": "col_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "col_x", "role": "ce0" }} , 
 	{ "name": "col_x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "col_x", "role": "q0" }} , 
 	{ "name": "col_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "col_y", "role": "address0" }} , 
 	{ "name": "col_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "col_y", "role": "ce0" }} , 
 	{ "name": "col_y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "col_y", "role": "q0" }} , 
 	{ "name": "p_phi_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p_phi_out", "role": "default" }} , 
 	{ "name": "p_phi_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_phi_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	FFT2D_flat_Pipeline_VITIS_LOOP_72_5 {
		nx {Type I LastRead 0 FirstWrite -1}
		col_x {Type I LastRead 0 FirstWrite -1}
		col_y {Type I LastRead 0 FirstWrite -1}
		p_phi_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	nx { ap_none {  { nx in_data 0 32 } } }
	col_x { ap_memory {  { col_x_address0 mem_address 1 6 }  { col_x_ce0 mem_ce 1 1 }  { col_x_q0 mem_dout 0 32 } } }
	col_y { ap_memory {  { col_y_address0 mem_address 1 6 }  { col_y_ce0 mem_ce 1 1 }  { col_y_q0 mem_dout 0 32 } } }
	p_phi_out { ap_vld {  { p_phi_out out_data 1 64 }  { p_phi_out_ap_vld out_vld 1 1 } } }
}
