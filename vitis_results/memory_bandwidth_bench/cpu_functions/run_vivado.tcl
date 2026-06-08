create_project vivado_membw ./vivado_membw -part xc7z020clg484-1 -force
file mkdir vivado_reports

foreach ip_tcl [glob -nocomplain ./proj_membw/fsolution/syn/verilog/*_ip.tcl] {
    source $ip_tcl
}

read_verilog [glob ./proj_membw/fsolution/syn/verilog/*.v]

synth_design -top copy_array -part xc7z020clg484-1

if {[llength [get_ports ap_clk]] > 0} {
    create_clock -period 10.0 -name default [get_ports ap_clk]
}

report_utilization -file vivado_reports/utilization_synth.rpt
report_timing_summary -file vivado_reports/timing_synth.rpt

exit
