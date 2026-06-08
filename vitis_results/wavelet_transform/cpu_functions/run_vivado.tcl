create_project vivado_wavelet ./vivado_wavelet -part xc7z020clg484-1 -force
file mkdir vivado_reports

foreach ip_tcl [glob -nocomplain ./proj_wavelet/solution/syn/verilog/*_ip.tcl] {
    source $ip_tcl
}

read_verilog [glob ./proj_wavelet/solution/syn/verilog/*.v]
generate_target all [get_ips]

synth_design -top ccsds_wavelet_transform -part xc7z020clg484-1

create_clock -period 10.0 -name default [get_ports ap_clk]

report_utilization -file vivado_reports/utilization_synth.rpt
report_timing_summary -file vivado_reports/timing_synth.rpt
exit
