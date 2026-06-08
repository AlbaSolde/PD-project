open_project proj_softmax
set_top softmax
add_files cpu_functions.cpp -cflags "-DFLOAT"
open_solution "solution1"
set_part xc7z020clg484-1
create_clock -period 10.0 -name default
csynth_design
exit
