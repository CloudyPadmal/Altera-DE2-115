module FA(a, b, ci, s, co);

	// Define inputs and outputs
	input a, b, ci;
	output s, co;
	
	// Assign adding
	assign s = (~a & ~b & ci) | (~a & b & ~ci) | (a & b & ci) | (a & ~b & ~ci);
	assign co = (~a & b & ci) | (a & b & ~ci) | (a & ci);

endmodule