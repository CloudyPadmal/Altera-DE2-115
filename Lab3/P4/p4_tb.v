module p4_tb;

	reg D, Clk;
	wire Qa, Qb, Qc;
	
	p4 uut(
		.D(D),
		.Clk(Clk),
		.Qa(Qa),
		.Qb(Qb),
		.Qc(Qc)
	);
	
	initial begin
		D = 1'b0;
		Clk = 1'b0;
	end
	
	initial begin
		#2
		D = 1'b1;
		#2
		Clk = 1'b1;
		D = 1'b1;
		#2
		D = 1'b0;
		#2
		D = 1'b1;
		#2
		D = 1'b0;
		#1
		Clk = 1'b0;
		#2
		D = 1'b1;
		#2
		D = 1'b0;
		#2
		D = 1'b1;
		#2
		D = 1'b0;
		#1
		Clk = 1'b1;
		#2
		D = 1'b1;
		#2
		D = 1'b0;
		#2
		D = 1'b1;
		#2
		Clk = 1'b0;
		#2
		D = 1'b0;
		#2
		$finish;
	end

endmodule