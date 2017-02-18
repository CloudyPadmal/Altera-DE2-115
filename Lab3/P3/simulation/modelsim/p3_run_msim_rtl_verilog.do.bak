transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab3/P3 {F:/Work/FPGA/Board/Lab3/P3/p3.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab3/P3 {F:/Work/FPGA/Board/Lab3/P3/D.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab3/P3 {F:/Work/FPGA/Board/Lab3/P3/p3_tb.v}

