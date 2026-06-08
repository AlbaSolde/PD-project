create_project vivado_matrix_convolution ./vivado_matrix_convolution -part xc7z020clg484-1 -force

file mkdir vivado_reports

# Load HLS-generated IPs
foreach ip_tcl [glob ./matrix_convolution_hls/solution1/syn/verilog/*_ip.tcl] {
    source $ip_tcl
}

# Load RTL
read_verilog [glob ./matrix_convolution_hls/solution1/syn/verilog/*.v]

# Synthesis
synth_design -top matrix_convolution -part xc7z020clg484-1

# Clock constraint
create_clock -period 10.0 -name default [get_ports ap_clk]

# Reports after synthesis
report_utilization -file vivado_reports/utilization_synth.rpt
report_timing_summary -file vivado_reports/timing_synth.rpt

exit
