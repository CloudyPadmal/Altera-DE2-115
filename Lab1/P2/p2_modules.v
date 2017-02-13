module p2_modules(X, Y, LEDs, selector);

	// Define inputs outputs
	input [7:0] X, Y;
	input selector;
	output [7:0] LEDs;
	
	// Create 8 muxers
	muxer mux0(
		.line1(X[0]),
		.line2(Y[0]),
		.selector(selector),
		.lineout(LEDs[0])
	);
	
	muxer mux1(
		.line1(X[1]),
		.line2(Y[1]),
		.selector(selector),
		.lineout(LEDs[1])
	);
	
	muxer mux2(
		.line1(X[2]),
		.line2(Y[2]),
		.selector(selector),
		.lineout(LEDs[2])
	);
	
	muxer mux3(
		.line1(X[3]),
		.line2(Y[3]),
		.selector(selector),
		.lineout(LEDs[3])
	);
	
	muxer mux4(
		.line1(X[4]),
		.line2(Y[4]),
		.selector(selector),
		.lineout(LEDs[4])
	);
	
	muxer mux5(
		.line1(X[5]),
		.line2(Y[5]),
		.selector(selector),
		.lineout(LEDs[5])
	);
	
	muxer mux6(
		.line1(X[6]),
		.line2(Y[6]),
		.selector(selector),
		.lineout(LEDs[6])
	);
	
	muxer mux7(
		.line1(X[7]),
		.line2(Y[7]),
		.selector(selector),
		.lineout(LEDs[7])
	);

endmodule