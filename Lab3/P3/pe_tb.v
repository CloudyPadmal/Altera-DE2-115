module pe_tb();

	reg Di, Clk;
	wire Qa, Qb;
	
	p3 ut(
		.Di(Di),
		.Clk(Clk),
		.Qa(Qa),
		.Qb(Qb)
	);
	
	initial begin
		Di = 1'b0;
		Clk = 1'b0;
		repeat(11) #20 Clk = ~Clk;
		#20
		Di = 1'b1;
		#20
		Di = 1'b0;
		#20
		Di = 1'b1;
		#20
		Di = 1'b1;
		#20
		Di = 1'b0;
		#20
		Di = 1'b0;
		#20
		Di = 1'b1;
		#20
		Di = 1'b0;
		#20
		Di = 1'b1;
		#20
		Di = 1'b1;
		#20
		Di = 1'b0;
		#20
		$finish;
	
	end

endmodule