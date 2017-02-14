module p1(switches, lines);

	// Define inputs and outputs
	input [15:0] switches;
	output [27:0] lines;
	
	// Create 4 seven segments
	bcd s1(
		.lineIn(switches[3:0]),
		.lineOut(lines[6:0])
	);
	
	bcd s2(
		.lineIn(switches[7:4]),
		.lineOut(lines[13:7])
	);
	
	bcd s3(
		.lineIn(switches[11:8]),
		.lineOut(lines[20:14])
	);
	
	bcd s4(
		.lineIn(switches[15:12]),
		.lineOut(lines[27:21])
	);

endmodule