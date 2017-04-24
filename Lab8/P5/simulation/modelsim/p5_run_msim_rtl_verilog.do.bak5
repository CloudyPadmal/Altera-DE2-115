transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab8/P5 {F:/Work/FPGA/Board/Lab8/P5/ramlpm.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab8/P5 {F:/Work/FPGA/Board/Lab8/P5/p5.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab8/P5 {F:/Work/FPGA/Board/Lab8/P5/secondsCounter.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab8/P5 {F:/Work/FPGA/Board/Lab8/P5/HexaBCD.v}

