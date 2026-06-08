set part_name xc7z020clg484-1
set top_name cifar10
set clk_period 10.0

set rtl_dir "./proj_cifar10/fsolution/syn/verilog"
set out_dir "./vivado_reports"

file mkdir $out_dir

create_project vivado_cifar10 ./vivado_cifar10 -part $part_name -force

foreach ip_tcl [glob -nocomplain $rtl_dir/*_ip.tcl] {
    source $ip_tcl
}

read_verilog [glob $rtl_dir/*.v]
generate_target all [get_ips]

synth_design -top $top_name -part $part_name -mode out_of_context

create_clock -period $clk_period -name default [get_ports ap_clk]

report_utilization -file $out_dir/utilization_synth.rpt
report_timing_summary -file $out_dir/timing_synth.rpt

exit
