open_project proj_fft_window
set_top fft_function
add_files cpu_functions.cpp -cflags "-DFLOAT"
open_solution "fsolution"
set_part xc7z020clg484-1
create_clock -period 10.0 -name default
csynth_design
exit
