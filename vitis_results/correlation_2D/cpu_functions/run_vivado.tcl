create_project vivado_correlation_2D ./vivado_correlation_2D -part xc7z020clg484-1 -force

file mkdir vivado_reports

foreach ip_tcl [glob ./proj_correlation_2D/fsolution/syn/verilog/*_ip.tcl] {
    source $ip_tcl
}

read_verilog [glob ./proj_correlation_2D/fsolution/syn/verilog/*.v]

synth_design -top correlation_2D -part xc7z020clg484-1

create_clock -period 10.0 -name default [get_ports ap_clk]

report_utilization -file vivado_reports/utilization_synth.rpt
report_timing_summary -file vivado_reports/timing_synth.rpt

exit
