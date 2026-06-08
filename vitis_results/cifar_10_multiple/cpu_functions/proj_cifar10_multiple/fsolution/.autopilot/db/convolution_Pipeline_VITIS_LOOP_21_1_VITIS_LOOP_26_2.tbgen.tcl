set moduleName convolution_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_26_2
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
set C_modelName {convolution_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_26_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ mul_ln12 int 64 regular  }
	{ squared_kernel_size int 32 regular  }
	{ n int 32 regular  }
	{ kernel_size int 32 regular  }
	{ kernel_rad int 31 regular  }
	{ add_ln31 int 32 regular  }
	{ empty int 29 regular  }
	{ A_read int 32 regular  }
	{ bitcast_ln35 float 32 regular  }
	{ sum_out float 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "mul_ln12", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "squared_kernel_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "n", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "kernel_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "kernel_rad", "interface" : "wire", "bitwidth" : 31, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln31", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 29, "direction" : "READONLY"} , 
 	{ "Name" : "A_read", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "bitcast_ln35", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sum_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 30
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ mul_ln12 sc_in sc_lv 64 signal 0 } 
	{ squared_kernel_size sc_in sc_lv 32 signal 1 } 
	{ n sc_in sc_lv 32 signal 2 } 
	{ kernel_size sc_in sc_lv 32 signal 3 } 
	{ kernel_rad sc_in sc_lv 31 signal 4 } 
	{ add_ln31 sc_in sc_lv 32 signal 5 } 
	{ empty sc_in sc_lv 29 signal 6 } 
	{ A_read sc_in sc_lv 32 signal 7 } 
	{ bitcast_ln35 sc_in sc_lv 32 signal 8 } 
	{ sum_out sc_out sc_lv 32 signal 9 } 
	{ sum_out_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ grp_fu_270_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_270_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_270_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_270_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_270_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_274_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_274_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_274_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_274_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_102_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_102_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_102_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_102_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mul_ln12", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mul_ln12", "role": "default" }} , 
 	{ "name": "squared_kernel_size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "squared_kernel_size", "role": "default" }} , 
 	{ "name": "n", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "n", "role": "default" }} , 
 	{ "name": "kernel_size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "kernel_size", "role": "default" }} , 
 	{ "name": "kernel_rad", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "kernel_rad", "role": "default" }} , 
 	{ "name": "add_ln31", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "add_ln31", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":29, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "A_read", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_read", "role": "default" }} , 
 	{ "name": "bitcast_ln35", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bitcast_ln35", "role": "default" }} , 
 	{ "name": "sum_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sum_out", "role": "default" }} , 
 	{ "name": "sum_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "sum_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_270_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_270_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_270_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_270_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_270_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_270_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_270_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_270_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_270_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_270_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_274_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_274_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_274_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_274_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_274_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_274_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_274_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_274_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_102_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_102_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_102_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_102_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_102_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_102_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_102_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_102_p_ce", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	convolution_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_26_2 {
		mul_ln12 {Type I LastRead 0 FirstWrite -1}
		squared_kernel_size {Type I LastRead 0 FirstWrite -1}
		n {Type I LastRead 0 FirstWrite -1}
		kernel_size {Type I LastRead 0 FirstWrite -1}
		kernel_rad {Type I LastRead 0 FirstWrite -1}
		add_ln31 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		A_read {Type I LastRead 0 FirstWrite -1}
		bitcast_ln35 {Type I LastRead 0 FirstWrite -1}
		sum_out {Type O LastRead -1 FirstWrite 47}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	mul_ln12 { ap_none {  { mul_ln12 in_data 0 64 } } }
	squared_kernel_size { ap_none {  { squared_kernel_size in_data 0 32 } } }
	n { ap_none {  { n in_data 0 32 } } }
	kernel_size { ap_none {  { kernel_size in_data 0 32 } } }
	kernel_rad { ap_none {  { kernel_rad in_data 0 31 } } }
	add_ln31 { ap_none {  { add_ln31 in_data 0 32 } } }
	empty { ap_none {  { empty in_data 0 29 } } }
	A_read { ap_none {  { A_read in_data 0 32 } } }
	bitcast_ln35 { ap_none {  { bitcast_ln35 in_data 0 32 } } }
	sum_out { ap_vld {  { sum_out out_data 1 32 }  { sum_out_ap_vld out_vld 1 1 } } }
}
