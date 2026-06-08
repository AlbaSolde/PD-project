# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
output_data { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
conv_1_output { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
pooling_1_output { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
conv_2_output { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
pooling_2_output { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
dense_layer_1_output { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 56
	offset_end 63
}
dense_layer_2_output { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 64
	offset_end 71
}
input_data { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 72
	offset_end 79
}
kernel_1_data { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 80
	offset_end 87
}
kernel_2_data { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 88
	offset_end 95
}
weights_1 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 96
	offset_end 103
}
weights_2 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 104
	offset_end 111
}
input_data_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 112
	offset_end 119
}
output_data_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 120
	offset_end 127
}
kernel_1_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 128
	offset_end 135
}
kernel_2_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 136
	offset_end 143
}
stride_1_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 144
	offset_end 151
}
stride_2_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 152
	offset_end 159
}
neurons_dense_1_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 160
	offset_end 167
}
neurons_dense_2_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 168
	offset_end 175
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


