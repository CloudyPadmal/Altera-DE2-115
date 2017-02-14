module p2(lineIns, lineOuts);

	// Define inputs and outputs
	input [3:0] lineIns;
	output [13:0] lineOuts;
	
	wire [3:0] M;
	wire Z;
	wire [2:0] Mwires;
	
	// Create the converter
	Converter converter(
		.lineIns(lineIns[2:0]),
		.lineOuts(Mwires)
	);
	
	// Create the comparator
	Comparator comparator(
		.lineIn(lineIns),
		.result(Z)
	);
	
	// Create 4 Mux
	Multiplexer mux0(
		.line1(lineIns[0]),
		.line2(Mwires[0]),
		.lineout(M[0]),
		.selector(Z)
	);
	
	Multiplexer mux1(
		.line1(lineIns[1]),
		.line2(Mwires[1]),
		.lineout(M[1]),
		.selector(Z)
	);
	
	Multiplexer mux2(
		.line1(lineIns[2]),
		.line2(Mwires[2]),
		.lineout(M[2]),
		.selector(Z)
	);
	
	Multiplexer mux3(
		.line1(lineIns[3]),
		.line2(1'b0),
		.lineout(M[3]),
		.selector(Z)
	);
	
	// Create Tenth place Segment
	Oner oner(
		.lineIn(Z),
		.lineOuts(lineOuts[13:7])
	);
	
	// Create Oneth place segment
	BCD bcd(
		.lineIn(M),
		.lineOut(lineOuts[6:0])
	);

endmodule