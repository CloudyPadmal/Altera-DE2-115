module p2(D, Clk, Qa, Qb);

	input D, Clk;
	output Qa, Qb;
	
	wire R, S_g, R_g; /* synthesis keep */
	
	nand(S_g, D, Clk);
	not(R, D);
	nand(R_g, R, Clk);
	nand(Qa, Qb, S_g);
	nand(Qb, Qa, R_g);

endmodule