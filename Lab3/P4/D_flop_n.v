module D_flop_n (Di, Clk, Qa);

	input Di, Clk;
	output reg Qa;
	
	always @ (negedge Clk)
		Qa = Di;
	
endmodule