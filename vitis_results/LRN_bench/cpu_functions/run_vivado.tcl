set part_name xc7z020clg484-1
set top_name lrn
set clk_period 9.66

set rtl_dir "./proj_lrn/fsolution/syn/verilog"
set out_dir "./vivado_reports"

file mkdir $out_dir

create_project vivado_lrn ./vivado_lrn -part $part_name -force

foreach ip_tcl [glob -nocomplain $rtl_dir/*_ip.tcl] {
    puts "Sourcing IP script: $ip_tcl"
    source $ip_tcl
}

read_verilog [glob $rtl_dir/*.v]

generate_target all [get_ips]

synth_design -top $top_name -part $part_name

create_clock -period $clk_period -name default [get_ports ap_clk]

report_utilization -file $out_dir/utilization_synth.rpt
report_timing_summary -file $out_dir/timing_synth.rpt

opt_design
place_design
route_design

report_utilization -file $out_dir/utilization_impl.rpt
report_timing_summary -file $out_dir/timing_impl.rpt

exit
