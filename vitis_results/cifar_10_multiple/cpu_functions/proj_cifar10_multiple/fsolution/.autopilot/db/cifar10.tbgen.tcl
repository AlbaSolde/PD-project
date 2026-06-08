set moduleName cifar10
set isTopModule 1
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
set cdfgNum 20
set C_modelName {cifar10}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ output_data int 32 regular {pointer 2}  }
	{ conv_1_output int 32 regular {pointer 2}  }
	{ pooling_1_output int 32 regular {pointer 2}  }
	{ conv_2_output int 32 regular {pointer 2}  }
	{ pooling_2_output int 32 regular {pointer 2}  }
	{ dense_layer_1_output int 32 regular {pointer 2}  }
	{ dense_layer_2_output int 32 regular {pointer 1}  }
	{ input_data int 32 regular {pointer 0}  }
	{ kernel_1_data int 32 regular {pointer 0}  }
	{ kernel_2_data int 32 regular {pointer 0}  }
	{ weights_1 int 32 regular {pointer 0}  }
	{ weights_2 int 32 regular {pointer 0}  }
	{ input_data_size int 32 regular  }
	{ output_data_size int 32 unused  }
	{ kernel_1_size int 32 regular  }
	{ kernel_2_size int 32 regular  }
	{ stride_1_size int 32 regular  }
	{ stride_2_size int 32 regular  }
	{ neurons_dense_1_size int 32 regular  }
	{ neurons_dense_2_size int 32 regular  }
	{ number_of_images int 32 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "output_data", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "conv_1_output", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "pooling_1_output", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "conv_2_output", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "pooling_2_output", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "dense_layer_1_output", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "dense_layer_2_output", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "input_data", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "kernel_1_data", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "kernel_2_data", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weights_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "input_data_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "output_data_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "kernel_1_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "kernel_2_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "stride_1_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "stride_2_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "neurons_dense_1_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "neurons_dense_2_size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "number_of_images", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 40
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ output_data_i sc_in sc_lv 32 signal 0 } 
	{ output_data_o sc_out sc_lv 32 signal 0 } 
	{ output_data_o_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ conv_1_output_i sc_in sc_lv 32 signal 1 } 
	{ conv_1_output_o sc_out sc_lv 32 signal 1 } 
	{ conv_1_output_o_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ pooling_1_output_i sc_in sc_lv 32 signal 2 } 
	{ pooling_1_output_o sc_out sc_lv 32 signal 2 } 
	{ pooling_1_output_o_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ conv_2_output_i sc_in sc_lv 32 signal 3 } 
	{ conv_2_output_o sc_out sc_lv 32 signal 3 } 
	{ conv_2_output_o_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ pooling_2_output_i sc_in sc_lv 32 signal 4 } 
	{ pooling_2_output_o sc_out sc_lv 32 signal 4 } 
	{ pooling_2_output_o_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ dense_layer_1_output_i sc_in sc_lv 32 signal 5 } 
	{ dense_layer_1_output_o sc_out sc_lv 32 signal 5 } 
	{ dense_layer_1_output_o_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ dense_layer_2_output sc_out sc_lv 32 signal 6 } 
	{ dense_layer_2_output_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ input_data sc_in sc_lv 32 signal 7 } 
	{ kernel_1_data sc_in sc_lv 32 signal 8 } 
	{ kernel_2_data sc_in sc_lv 32 signal 9 } 
	{ weights_1 sc_in sc_lv 32 signal 10 } 
	{ weights_2 sc_in sc_lv 32 signal 11 } 
	{ input_data_size sc_in sc_lv 32 signal 12 } 
	{ output_data_size sc_in sc_lv 32 signal 13 } 
	{ kernel_1_size sc_in sc_lv 32 signal 14 } 
	{ kernel_2_size sc_in sc_lv 32 signal 15 } 
	{ stride_1_size sc_in sc_lv 32 signal 16 } 
	{ stride_2_size sc_in sc_lv 32 signal 17 } 
	{ neurons_dense_1_size sc_in sc_lv 32 signal 18 } 
	{ neurons_dense_2_size sc_in sc_lv 32 signal 19 } 
	{ number_of_images sc_in sc_lv 32 signal 20 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "output_data_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_data", "role": "i" }} , 
 	{ "name": "output_data_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_data", "role": "o" }} , 
 	{ "name": "output_data_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "output_data", "role": "o_ap_vld" }} , 
 	{ "name": "conv_1_output_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "conv_1_output", "role": "i" }} , 
 	{ "name": "conv_1_output_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "conv_1_output", "role": "o" }} , 
 	{ "name": "conv_1_output_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "conv_1_output", "role": "o_ap_vld" }} , 
 	{ "name": "pooling_1_output_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pooling_1_output", "role": "i" }} , 
 	{ "name": "pooling_1_output_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pooling_1_output", "role": "o" }} , 
 	{ "name": "pooling_1_output_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pooling_1_output", "role": "o_ap_vld" }} , 
 	{ "name": "conv_2_output_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "conv_2_output", "role": "i" }} , 
 	{ "name": "conv_2_output_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "conv_2_output", "role": "o" }} , 
 	{ "name": "conv_2_output_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "conv_2_output", "role": "o_ap_vld" }} , 
 	{ "name": "pooling_2_output_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pooling_2_output", "role": "i" }} , 
 	{ "name": "pooling_2_output_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pooling_2_output", "role": "o" }} , 
 	{ "name": "pooling_2_output_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pooling_2_output", "role": "o_ap_vld" }} , 
 	{ "name": "dense_layer_1_output_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dense_layer_1_output", "role": "i" }} , 
 	{ "name": "dense_layer_1_output_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dense_layer_1_output", "role": "o" }} , 
 	{ "name": "dense_layer_1_output_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dense_layer_1_output", "role": "o_ap_vld" }} , 
 	{ "name": "dense_layer_2_output", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dense_layer_2_output", "role": "default" }} , 
 	{ "name": "dense_layer_2_output_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dense_layer_2_output", "role": "ap_vld" }} , 
 	{ "name": "input_data", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "input_data", "role": "default" }} , 
 	{ "name": "kernel_1_data", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "kernel_1_data", "role": "default" }} , 
 	{ "name": "kernel_2_data", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "kernel_2_data", "role": "default" }} , 
 	{ "name": "weights_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_1", "role": "default" }} , 
 	{ "name": "weights_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_2", "role": "default" }} , 
 	{ "name": "input_data_size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "input_data_size", "role": "default" }} , 
 	{ "name": "output_data_size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_data_size", "role": "default" }} , 
 	{ "name": "kernel_1_size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "kernel_1_size", "role": "default" }} , 
 	{ "name": "kernel_2_size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "kernel_2_size", "role": "default" }} , 
 	{ "name": "stride_1_size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stride_1_size", "role": "default" }} , 
 	{ "name": "stride_2_size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "stride_2_size", "role": "default" }} , 
 	{ "name": "neurons_dense_1_size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "neurons_dense_1_size", "role": "default" }} , 
 	{ "name": "neurons_dense_2_size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "neurons_dense_2_size", "role": "default" }} , 
 	{ "name": "number_of_images", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "number_of_images", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	cifar10 {
		output_data {Type IO LastRead 121 FirstWrite 119}
		conv_1_output {Type IO LastRead 80 FirstWrite 6}
		pooling_1_output {Type IO LastRead 83 FirstWrite 85}
		conv_2_output {Type IO LastRead 92 FirstWrite 5}
		pooling_2_output {Type IO LastRead 94 FirstWrite 96}
		dense_layer_1_output {Type IO LastRead 102 FirstWrite 101}
		dense_layer_2_output {Type O LastRead -1 FirstWrite 121}
		input_data {Type I LastRead 78 FirstWrite -1}
		kernel_1_data {Type I LastRead 78 FirstWrite -1}
		kernel_2_data {Type I LastRead 75 FirstWrite -1}
		weights_1 {Type I LastRead 94 FirstWrite -1}
		weights_2 {Type I LastRead 102 FirstWrite -1}
		input_data_size {Type I LastRead 0 FirstWrite -1}
		output_data_size {Type I LastRead -1 FirstWrite -1}
		kernel_1_size {Type I LastRead 75 FirstWrite -1}
		kernel_2_size {Type I LastRead 75 FirstWrite -1}
		stride_1_size {Type I LastRead 0 FirstWrite -1}
		stride_2_size {Type I LastRead 36 FirstWrite -1}
		neurons_dense_1_size {Type I LastRead 74 FirstWrite -1}
		neurons_dense_2_size {Type I LastRead 74 FirstWrite -1}
		number_of_images {Type I LastRead 75 FirstWrite -1}
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
		pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_array {Type I LastRead -1 FirstWrite -1}}
	convolution {
		A_read {Type I LastRead 4 FirstWrite -1}
		A {Type I LastRead 4 FirstWrite -1}
		B {Type O LastRead -1 FirstWrite 6}
		kernel_read {Type I LastRead 4 FirstWrite -1}
		n {Type I LastRead 0 FirstWrite -1}
		kernel_size {Type I LastRead 0 FirstWrite -1}}
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
		sum_out {Type O LastRead -1 FirstWrite 47}}
	cifar10_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_47_2 {
		conv_1_output_load {Type I LastRead 0 FirstWrite -1}
		mul_ln155 {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 1}}
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
		pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_array {Type I LastRead -1 FirstWrite -1}}
	cifar10_Pipeline_VITIS_LOOP_94_3_VITIS_LOOP_96_4 {
		max_value {Type I LastRead 0 FirstWrite -1}
		mul_ln155_1 {Type I LastRead 0 FirstWrite -1}
		p_reload {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		max_value_6_out {Type O LastRead -1 FirstWrite 1}}
	convolution_1 {
		A_read {Type I LastRead 3 FirstWrite -1}
		B {Type O LastRead -1 FirstWrite 5}
		kernel_read {Type I LastRead 3 FirstWrite -1}
		n {Type I LastRead 0 FirstWrite -1}
		kernel_size {Type I LastRead 0 FirstWrite -1}}
	convolution_1_Pipeline_VITIS_LOOP_21_1_VITIS_LOOP_26_2 {
		mul_ln12 {Type I LastRead 0 FirstWrite -1}
		squared_kernel_size {Type I LastRead 0 FirstWrite -1}
		n {Type I LastRead 0 FirstWrite -1}
		kernel_size {Type I LastRead 0 FirstWrite -1}
		kernel_rad {Type I LastRead 0 FirstWrite -1}
		add_ln31 {Type I LastRead 0 FirstWrite -1}
		value_r {Type I LastRead 0 FirstWrite -1}
		bitcast_ln35 {Type I LastRead 0 FirstWrite -1}
		sum_out {Type O LastRead -1 FirstWrite 45}}
	cifar10_Pipeline_VITIS_LOOP_45_1_VITIS_LOOP_47_21 {
		bitcast_ln45 {Type I LastRead 0 FirstWrite -1}
		mul_ln155_2 {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 1}}
	cifar10_Pipeline_VITIS_LOOP_109_1_VITIS_LOOP_111_22 {
		p_reload72 {Type I LastRead 0 FirstWrite -1}
		mul_ln155_2 {Type I LastRead 0 FirstWrite -1}
		p_phi_out {Type O LastRead -1 FirstWrite 1}
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
		pow_reduce_anonymous_namespace_table_f_Z2_ap_ufixed_array {Type I LastRead -1 FirstWrite -1}}
	cifar10_Pipeline_VITIS_LOOP_94_3_VITIS_LOOP_96_43 {
		max_value_7 {Type I LastRead 0 FirstWrite -1}
		mul_ln155_3 {Type I LastRead 0 FirstWrite -1}
		conv_2_output_load_1 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		max_value_9_out {Type O LastRead -1 FirstWrite 1}}
	cifar10_Pipeline_VITIS_LOOP_121_1_VITIS_LOOP_126_3 {
		mul_ln155_4 {Type I LastRead 0 FirstWrite -1}
		mul_ln161 {Type I LastRead 0 FirstWrite -1}
		mul13_i {Type I LastRead 0 FirstWrite -1}
		acumulated_out {Type O LastRead -1 FirstWrite 1}}
	cifar10_Pipeline_VITIS_LOOP_72_1 {
		acumulated_reload {Type I LastRead 0 FirstWrite -1}
		neurons_dense_1_size {Type I LastRead 0 FirstWrite -1}
		p_phi39_out {Type O LastRead -1 FirstWrite 1}}
	cifar10_Pipeline_VITIS_LOOP_121_1_VITIS_LOOP_126_34 {
		mul_ln155_5 {Type I LastRead 0 FirstWrite -1}
		neurons_dense_1_size {Type I LastRead 0 FirstWrite -1}
		mul13_i1 {Type I LastRead 0 FirstWrite -1}
		acumulated_2_out {Type O LastRead -1 FirstWrite 1}}
	cifar10_Pipeline_VITIS_LOOP_72_15 {
		acumulated_2_reload {Type I LastRead 0 FirstWrite -1}
		neurons_dense_2_size {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 1}
		p_phi44_out {Type O LastRead -1 FirstWrite 1}}
	cifar10_Pipeline_VITIS_LOOP_141_1 {
		neurons_dense_2_size {Type I LastRead 0 FirstWrite -1}
		value_r {Type I LastRead 0 FirstWrite -1}
		sum_values_out {Type O LastRead -1 FirstWrite 0}}
	cifar10_Pipeline_VITIS_LOOP_148_2 {
		bitcast_ln148 {Type I LastRead 0 FirstWrite -1}
		neurons_dense_2_size {Type I LastRead 0 FirstWrite -1}
		sum_values_0_lcssa_i {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 0}}
	pow_generic_double_s {
		base_r {Type I LastRead 0 FirstWrite -1}
		exp {Type I LastRead 0 FirstWrite -1}
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
]}

set Spec2ImplPortList { 
	output_data { ap_ovld {  { output_data_i in_data 0 32 }  { output_data_o out_data 1 32 }  { output_data_o_ap_vld out_vld 1 1 } } }
	conv_1_output { ap_ovld {  { conv_1_output_i in_data 0 32 }  { conv_1_output_o out_data 1 32 }  { conv_1_output_o_ap_vld out_vld 1 1 } } }
	pooling_1_output { ap_ovld {  { pooling_1_output_i in_data 0 32 }  { pooling_1_output_o out_data 1 32 }  { pooling_1_output_o_ap_vld out_vld 1 1 } } }
	conv_2_output { ap_ovld {  { conv_2_output_i in_data 0 32 }  { conv_2_output_o out_data 1 32 }  { conv_2_output_o_ap_vld out_vld 1 1 } } }
	pooling_2_output { ap_ovld {  { pooling_2_output_i in_data 0 32 }  { pooling_2_output_o out_data 1 32 }  { pooling_2_output_o_ap_vld out_vld 1 1 } } }
	dense_layer_1_output { ap_ovld {  { dense_layer_1_output_i in_data 0 32 }  { dense_layer_1_output_o out_data 1 32 }  { dense_layer_1_output_o_ap_vld out_vld 1 1 } } }
	dense_layer_2_output { ap_vld {  { dense_layer_2_output out_data 1 32 }  { dense_layer_2_output_ap_vld out_vld 1 1 } } }
	input_data { ap_none {  { input_data in_data 0 32 } } }
	kernel_1_data { ap_none {  { kernel_1_data in_data 0 32 } } }
	kernel_2_data { ap_none {  { kernel_2_data in_data 0 32 } } }
	weights_1 { ap_none {  { weights_1 in_data 0 32 } } }
	weights_2 { ap_none {  { weights_2 in_data 0 32 } } }
	input_data_size { ap_none {  { input_data_size in_data 0 32 } } }
	output_data_size { ap_none {  { output_data_size in_data 0 32 } } }
	kernel_1_size { ap_none {  { kernel_1_size in_data 0 32 } } }
	kernel_2_size { ap_none {  { kernel_2_size in_data 0 32 } } }
	stride_1_size { ap_none {  { stride_1_size in_data 0 32 } } }
	stride_2_size { ap_none {  { stride_2_size in_data 0 32 } } }
	neurons_dense_1_size { ap_none {  { neurons_dense_1_size in_data 0 32 } } }
	neurons_dense_2_size { ap_none {  { neurons_dense_2_size in_data 0 32 } } }
	number_of_images { ap_none {  { number_of_images in_data 0 32 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
