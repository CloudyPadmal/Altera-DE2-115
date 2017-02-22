module D_flop_p (Di, Clk, Qa);

	input Di, Clk;
	output reg Qa;
	
	always @ (posedge Clk)
		Qa = Di;
	
endmodule