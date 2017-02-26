module muxer_5_1(lineA, lineB, lineC, lineD, lineE, Selectors, lineout);

	// Define inputs and outputs
	input lineA, lineB, lineC, lineD, lineE;
	input [2:0] Selectors;
	output lineout;
	
	// Interconnecting wires
	wire A, B, C;
	
	// Create 4 instances of 2-1 muxers
	muxer muxA(
		.line1(lineA),
		.line2(lineB),
		.lineout(A),
		.selector(Selectors[0])
	);
	
	muxer muxB(
		.line1(lineC),
		.line2(lineD),
		.lineout(B),
		.selector(Selectors[0])
	);
	
	muxer muxC(
		.line1(A),
		.line2(B),
		.lineout(C),
		.selector(Selectors[1])
	);
	
	muxer muxD(
		.line1(C),
		.line2(lineE),
		.lineout(lineout),
		.selector(Selectors[2])
	);
	
endmodule