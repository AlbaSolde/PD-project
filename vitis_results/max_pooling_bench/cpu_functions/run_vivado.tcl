create_project vivado_maxpool ./vivado_maxpool -part xc7z020clg484-1 -force
file mkdir vivado_reports
foreach ip_tcl [glob -nocomplain ./proj_maxpool/fsolution/syn/verilog/*_ip.tcl] {
    source $ip_tcl
}
read_verilog [glob ./proj_maxpool/fsolution/syn/verilog/*.v]
synth_design -top max_pooling -part xc7z020clg484-1
create_clock -period 10.0 -name default [get_ports ap_clk]
report_utilization -file vivado_reports/utilization_synth.rpt
report_timing_summary -file vivado_reports/timing_synth.rpt
exit
