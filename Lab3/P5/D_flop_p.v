module D_flop_p (Di, Clk, Qa, Rst);

	input Di, Clk, Rst;
	output reg Qa;
	
	always @ (posedge Clk)
		if (Rst)
			Qa = 1'b0;
		else
			Qa = Di;
	
endmodule