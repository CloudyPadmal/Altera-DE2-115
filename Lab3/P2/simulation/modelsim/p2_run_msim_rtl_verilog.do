transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab3/P2 {F:/Work/FPGA/Board/Lab3/P2/p2.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab3/P2 {F:/Work/FPGA/Board/Lab3/P2/p2_tb.v}

