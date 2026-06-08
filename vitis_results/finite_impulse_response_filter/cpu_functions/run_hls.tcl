open_project proj_fir
set_top vector_convolution
add_files cpu_functions.cpp -cflags "-DFLOAT"
open_solution "fsolution"
set_part xc7z020clg484-1
create_clock -period 10.0 -name default
csynth_design
exit
