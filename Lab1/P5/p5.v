module p5(bitLines, Selectors, decOut);

	// Define inputs
	input [14:0] bitLines;
	input [2:0] Selectors;
	// Define wires for decoder
	wire [2:0] wA;
	wire [2:0] wB;
	wire [2:0] wC;
	wire [2:0] wD;
	wire [2:0] wE;
	// Define outputs for 7 segments
	output [34:0] decOut;
	
	// Create 5 muxers
	muxer_3_5_1 seg0(
		.A(bitLines[2:0]), 
		.B(bitLines[5:3]), 
		.C(bitLines[8:6]), 
		.D(bitLines[11:9]), 
		.E(bitLines[14:12]), 
		.Selectors(Selectors), 
		.LEDs(wA)
	);
	
	muxer_3_5_1 seg1(
		.A(bitLines[5:3]), 
		.B(bitLines[8:6]), 
		.C(bitLines[11:9]), 
		.D(bitLines[14:12]), 
		.E(bitLines[2:0]), 
		.Selectors(Selectors), 
		.LEDs(wB)
	);
	
	muxer_3_5_1 seg2(
		.A(bitLines[8:6]), 
		.B(bitLines[11:9]), 
		.C(bitLines[14:12]), 
		.D(bitLines[2:0]), 
		.E(bitLines[5:3]), 
		.Selectors(Selectors), 
		.LEDs(wC)
	);
	
	muxer_3_5_1 seg3(
		.A(bitLines[11:9]), 
		.B(bitLines[14:12]), 
		.C(bitLines[2:0]), 
		.D(bitLines[5:3]), 
		.E(bitLines[8:6]), 
		.Selectors(Selectors), 
		.LEDs(wD)
	);
	
	muxer_3_5_1 seg4(
		.A(bitLines[14:12]), 
		.B(bitLines[2:0]), 
		.C(bitLines[5:3]), 
		.D(bitLines[8:6]), 
		.E(bitLines[11:9]), 
		.Selectors(Selectors), 
		.LEDs(wE)
	);
	
	// Define 5 seven segments
	bcdDecoder s0(
		.lineIns(wA),
		.lineOuts(decOut[6:0])
	);
	
	bcdDecoder s1(
		.lineIns(wB),
		.lineOuts(decOut[13:7])
	);
	
	bcdDecoder s2(
		.lineIns(wC),
		.lineOuts(decOut[20:14])
	);
	
	bcdDecoder s3(
		.lineIns(wD),
		.lineOuts(decOut[27:21])
	);
	
	bcdDecoder s4(
		.lineIns(wE),
		.lineOuts(decOut[34:28])
	);
	
endmodule