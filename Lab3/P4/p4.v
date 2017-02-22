module p4(D, Clk, Qa, Qb, Qc);

	input D, Clk;
	output Qa, Qb, Qc;
	
	D_flop D1(.Di(D), .Clk(Clk), .Qa(Qa));
	D_flop_p D2(.Di(D), .Clk(Clk), .Qa(Qb));
	D_flop_n D3(.Di(D), .Clk(Clk), .Qa(Qc));

endmodule