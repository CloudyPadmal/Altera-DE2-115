transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab9/P1 {F:/Work/FPGA/Board/Lab9/P1/ALU.v}

