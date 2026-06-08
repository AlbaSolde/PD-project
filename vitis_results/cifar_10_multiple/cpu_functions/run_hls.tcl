open_project proj_cifar10_multiple
set_top cifar10
add_files cpu_functions.cpp -cflags "-DFLOAT"
open_solution "fsolution"
set_part xc7z020clg484-1
create_clock -period 10.0 -name default
csynth_design
exit
