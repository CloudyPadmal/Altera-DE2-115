module D_flop_n (Di, Clk, Qa, Rst);

	input Di, Clk, Rst;
	output reg Qa;
	
	always @ (negedge Clk)
		if (Rst)
			Qa = 1'b0;
		else
			Qa = Di;
	
endmodule