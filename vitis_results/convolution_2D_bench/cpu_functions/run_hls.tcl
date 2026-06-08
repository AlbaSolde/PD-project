open_project matrix_convolution_hls

set_top matrix_convolution

add_files cpu_functions.cpp -cflags "-DDOUBLE"

open_solution "solution1" -flow_target vivado

set_part {xc7z020clg400-1}

create_clock -period 10 -name default

csynth_design

export_design -format ip_catalog

exit
