transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab3/P4 {F:/Work/FPGA/Board/Lab3/P4/p4.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab3/P4 {F:/Work/FPGA/Board/Lab3/P4/D_flop.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab3/P4 {F:/Work/FPGA/Board/Lab3/P4/D_flop_p.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab3/P4 {F:/Work/FPGA/Board/Lab3/P4/D_flop_n.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab3/P4 {F:/Work/FPGA/Board/Lab3/P4/p4_tb.v}

