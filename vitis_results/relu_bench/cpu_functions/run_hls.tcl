open_project proj_relu
set_top relu
add_files cpu_functions.cpp -cflags "-DDOUBLE"
open_solution "fsolution"
set_part xc7z020clg484-1
create_clock -period 10.0 -name default
csynth_design
exit
