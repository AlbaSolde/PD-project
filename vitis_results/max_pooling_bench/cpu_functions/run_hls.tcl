open_project proj_maxpool
set_top max_pooling
add_files cpu_functions.cpp -cflags "-DDOUBLE"
open_solution "fsolution"
set_part xc7z020clg484-1
create_clock -period 10.0 -name default
csynth_design
exit
