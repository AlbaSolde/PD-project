# run_hls.tcl
open_project proj_lrn
set_top lrn
add_files /home/albasg/Documentos/semestre-2/pd/project/GPU4S_Bench/gpu4s_benchmark/LRN_bench/cpu_functions/cpu_functions.cpp -cflags "-DFLOAT"
open_solution "fsolution"
set_part xc7z020clg484-1
create_clock -period 9.66 -name default
csynth_design
export_design -format verilog 
exit
