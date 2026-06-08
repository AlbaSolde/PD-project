set moduleName FFT2D_flat_Pipeline_VITIS_LOOP_69_4
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
set C_modelName {FFT2D_flat_Pipeline_VITIS_LOOP_69_4}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict col_x { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict col_y { MEM_WIDTH 32 MEM_SIZE 256 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ nx int 32 regular  }
	{ col_x float 32 regular {array 64 { 0 3 } 0 1 }  }
	{ col_y float 32 regular {array 64 { 0 3 } 0 1 }  }
	{ bitcast_ln70 float 32 regular  }
	{ bitcast_ln70_1 float 32 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "nx", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "col_x", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "col_y", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bitcast_ln70", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "bitcast_ln70_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 17
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
	{ col_x_we0 sc_out sc_logic 1 signal 1 } 
	{ col_x_d0 sc_out sc_lv 32 signal 1 } 
	{ col_y_address0 sc_out sc_lv 6 signal 2 } 
	{ col_y_ce0 sc_out sc_logic 1 signal 2 } 
	{ col_y_we0 sc_out sc_logic 1 signal 2 } 
	{ col_y_d0 sc_out sc_lv 32 signal 2 } 
	{ bitcast_ln70 sc_in sc_lv 32 signal 3 } 
	{ bitcast_ln70_1 sc_in sc_lv 32 signal 4 } 
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
 	{ "name": "col_x_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "col_x", "role": "we0" }} , 
 	{ "name": "col_x_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "col_x", "role": "d0" }} , 
 	{ "name": "col_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "col_y", "role": "address0" }} , 
 	{ "name": "col_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "col_y", "role": "ce0" }} , 
 	{ "name": "col_y_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "col_y", "role": "we0" }} , 
 	{ "name": "col_y_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "col_y", "role": "d0" }} , 
 	{ "name": "bitcast_ln70", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bitcast_ln70", "role": "default" }} , 
 	{ "name": "bitcast_ln70_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bitcast_ln70_1", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	FFT2D_flat_Pipeline_VITIS_LOOP_69_4 {
		nx {Type I LastRead 0 FirstWrite -1}
		col_x {Type O LastRead -1 FirstWrite 1}
		col_y {Type O LastRead -1 FirstWrite 1}
		bitcast_ln70 {Type I LastRead 0 FirstWrite -1}
		bitcast_ln70_1 {Type I LastRead 0 FirstWrite -1}}}

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
	col_x { ap_memory {  { col_x_address0 mem_address 1 6 }  { col_x_ce0 mem_ce 1 1 }  { col_x_we0 mem_we 1 1 }  { col_x_d0 mem_din 1 32 } } }
	col_y { ap_memory {  { col_y_address0 mem_address 1 6 }  { col_y_ce0 mem_ce 1 1 }  { col_y_we0 mem_we 1 1 }  { col_y_d0 mem_din 1 32 } } }
	bitcast_ln70 { ap_none {  { bitcast_ln70 in_data 0 32 } } }
	bitcast_ln70_1 { ap_none {  { bitcast_ln70_1 in_data 0 32 } } }
}
