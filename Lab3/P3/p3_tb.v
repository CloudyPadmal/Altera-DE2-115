module p3_tb();

	reg Di, Clk;
	wire Qa, Qb;
	
	p3 ut(
		.Di(Di),
		.Clk(Clk),
		.Qa(Qa),
		.Qb(Qb)
	);
	
	initial begin
		Clk = 1'b0;
		Di = 1'b0;
		#2
		Clk = 1'b1;
		Di = 1'b1;
		#2
		Clk = 1'b0;
		Di = 1'b0;
		#2
		Clk = 1'b1;
		Di = 1'b0;
		#2
		Clk = 1'b0;
		Di = 1'b1;
		#2
		Clk = 1'b1;
		Di = 1'b1;
		#2
		Clk = 1'b0;
		Di = 1'b0;
		#2
		Clk = 1'b1;
		Di = 1'b1;
		#2
		Clk = 1'b0;
		Di = 1'b0;
		#2
		$finish;
	
	end

endmodule