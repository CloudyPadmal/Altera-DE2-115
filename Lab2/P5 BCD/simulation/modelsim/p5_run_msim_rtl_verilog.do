transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab2/P5\ BCD {F:/Work/FPGA/Board/Lab2/P5 BCD/BCD.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab2/P5\ BCD {F:/Work/FPGA/Board/Lab2/P5 BCD/Comparator.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab2/P5\ BCD {F:/Work/FPGA/Board/Lab2/P5 BCD/Converter.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab2/P5\ BCD {F:/Work/FPGA/Board/Lab2/P5 BCD/Digitizer.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab2/P5\ BCD {F:/Work/FPGA/Board/Lab2/P5 BCD/FA.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab2/P5\ BCD {F:/Work/FPGA/Board/Lab2/P5 BCD/Multiplexer.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab2/P5\ BCD {F:/Work/FPGA/Board/Lab2/P5 BCD/Oner.v}
vlog -vlog01compat -work work +incdir+F:/Work/FPGA/Board/Lab2/P5\ BCD {F:/Work/FPGA/Board/Lab2/P5 BCD/p5.v}

