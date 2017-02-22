module D_flop (Di, Clk, Qa);

	input Di, Clk;
	output reg Qa;
		
	always @ (Clk, Di)
		if(Clk)
			Qa = Di;

endmodule