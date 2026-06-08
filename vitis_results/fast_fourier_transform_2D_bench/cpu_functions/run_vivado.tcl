create_project vivado_fft2d ./vivado_fft2d -part xc7z020clg484-1 -force

file mkdir vivado_reports

foreach ip_tcl [glob ./proj_fft2d/fsolution/syn/verilog/*_ip.tcl] {
    source $ip_tcl
}

read_verilog [glob ./proj_fft2d/fsolution/syn/verilog/*.v]

synth_design -top FFT2D_flat -part xc7z020clg484-1

create_clock -period 10.0 -name default [get_ports ap_clk]

report_utilization -file vivado_reports/utilization_synth.rpt
report_timing_summary -file vivado_reports/timing_synth.rpt

exit
