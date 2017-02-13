module muxer_3_5_1(A, B, C, D, E, Selectors, LEDs);

	// Define inputs and outputs
	input [2:0] A;
	input [2:0] B;
	input [2:0] C;
	input [2:0] D;
	input [2:0] E;
	input [2:0] Selectors;
	output [2:0] LEDs;
	
	// Create 3 5-1 Muxes
	muxer_5_1 muxA(
		.lineA(A[0]),
		.lineB(B[0]),
		.lineC(C[0]),
		.lineD(D[0]),
		.lineE(E[0]),
		.Selectors(Selectors),
		.lineout(LEDs[0])
	);
	
	muxer_5_1 muxB(
		.lineA(A[1]),
		.lineB(B[1]),
		.lineC(C[1]),
		.lineD(D[1]),
		.lineE(E[1]),
		.Selectors(Selectors),
		.lineout(LEDs[1])
	);
	
	muxer_5_1 muxC(
		.lineA(A[2]),
		.lineB(B[2]),
		.lineC(C[2]),
		.lineD(D[2]),
		.lineE(E[2]),
		.Selectors(Selectors),
		.lineout(LEDs[2])
	);

endmodule