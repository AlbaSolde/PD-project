set moduleName aux_fft_function_Pipeline_VITIS_LOOP_21_2
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
set cdfgNum 13
set C_modelName {aux_fft_function_Pipeline_VITIS_LOOP_21_2}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ j int 64 regular  }
	{ nn int 64 regular  }
	{ j_1_out int 64 regular {pointer 1}  }
	{ m_out int 63 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "j", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "nn", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "j_1_out", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_out", "interface" : "wire", "bitwidth" : 63, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 12
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ j sc_in sc_lv 64 signal 0 } 
	{ nn sc_in sc_lv 64 signal 1 } 
	{ j_1_out sc_out sc_lv 64 signal 2 } 
	{ j_1_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ m_out sc_out sc_lv 63 signal 3 } 
	{ m_out_ap_vld sc_out sc_logic 1 outvld 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "j", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "j", "role": "default" }} , 
 	{ "name": "nn", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "nn", "role": "default" }} , 
 	{ "name": "j_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "j_1_out", "role": "default" }} , 
 	{ "name": "j_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "j_1_out", "role": "ap_vld" }} , 
 	{ "name": "m_out", "direction": "out", "datatype": "sc_lv", "bitwidth":63, "type": "signal", "bundle":{"name": "m_out", "role": "default" }} , 
 	{ "name": "m_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	aux_fft_function_Pipeline_VITIS_LOOP_21_2 {
		j {Type I LastRead 0 FirstWrite -1}
		nn {Type I LastRead 0 FirstWrite -1}
		j_1_out {Type O LastRead -1 FirstWrite 1}
		m_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	j { ap_none {  { j in_data 0 64 } } }
	nn { ap_none {  { nn in_data 0 64 } } }
	j_1_out { ap_vld {  { j_1_out out_data 1 64 }  { j_1_out_ap_vld out_vld 1 1 } } }
	m_out { ap_vld {  { m_out out_data 1 63 }  { m_out_ap_vld out_vld 1 1 } } }
}
