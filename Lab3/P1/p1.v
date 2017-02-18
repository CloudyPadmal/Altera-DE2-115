module p1(Clk, R, S, Q);

	input Clk, R, S;
	output Q;
	
	wire R_g, S_g, Qa, Qb;
	
	and(R_g, R, Clk);
	and(S_g, S, Clk);
	nor(Qa, R_g, Qb);
	nor(Qb, S_g, Qa);
	
	assign Q = Qa;

endmodule