module p3(Di, Clk, Qa, Qb);

	input Di, Clk;
	output Qa, Qb;
	
	wire Qm, T;

	D d1(.Di(Di), .Clk(~Clk), .Qa(Qm), .Qb(T));
	D d2(.Di(Qm), .Clk(Clk), .Qa(Qa), .Qb(Qb));

endmodule