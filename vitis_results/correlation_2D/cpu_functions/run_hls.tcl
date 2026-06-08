open_project proj_correlation_2D
set_top correlation_2D
add_files cpu_functions.cpp -cflags "-DFLOAT"
open_solution "fsolution"
set_part xc7z020clg484-1
create_clock -period 10.0 -name default
csynth_design
exit
