open_project proj_fft2d
set_top FFT2D_flat
add_files cpu_functions_vitis.cpp -cflags "-DFLOAT"
open_solution "fsolution"
set_part xc7z020clg484-1
create_clock -period 10.0 -name default
csynth_design
exit
