open_project proj_wavelet
set_top ccsds_wavelet_transform
add_files cpu_functions.cpp -cflags "-DDOUBLE"
open_solution "solution"
set_part xc7z020clg484-1
create_clock -period 10.0 -name default

set_directive_interface -mode m_axi -bundle gmem0 ccsds_wavelet_transform A
set_directive_interface -mode m_axi -bundle gmem1 ccsds_wavelet_transform B
set_directive_interface -mode s_axilite ccsds_wavelet_transform size
set_directive_interface -mode s_axilite ccsds_wavelet_transform return

csynth_design
exit
