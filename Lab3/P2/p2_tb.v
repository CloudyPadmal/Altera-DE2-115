module p2_tb();

	reg D, Clk;
	wire Qa, Qb;
	
	p2 ut(
		.D(D),
		.Qa(Qa),
		.Qb(Qb),
		.Clk(Clk)
	);
	
	initial begin
	
		D = 1'b0;
		Clk = 1'b0;
		#10
		D = 1'b1;
		Clk = 1'b0;
		#10
		D = 1'b0;
		Clk = 1'b1;
		#10
		D = 1'b1;
		Clk = 1'b1;
		#10
		D = 1'b1;
		Clk = 1'b0;
		#10
		D = 1'b0;
		Clk = 1'b1;
		#10
		$finish;
	
	end

endmodule