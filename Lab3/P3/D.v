module D(Di, Clk, Qa, Qb);

	input Di, Clk;
	output Qa, Qb;
	
	wire R, S_g, R_g; /* synthesis keep */
	
	nand(S_g, Di, Clk);
	not(R, Di);
	nand(R_g, R, Clk);
	nand(Qa, Qb, S_g);
	nand(Qb, Qa, R_g);

endmodule