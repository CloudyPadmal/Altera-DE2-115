module p2(LEDs, CLK, EN, RST);

	// Define inputs and outputs
	input CLK, EN, RST;
	output [27:0] LEDs;
	
	wire [15:0] Counts;
	
	counter_16 Counter(
		.CLK(CLK), 
		.RST(RST), 
		.EN(EN), 
		.Count(Counts)
	);
	
	HexaBCD bcd0(
		.lineIns(Counts[3:0]),
		.lineOuts(LEDs[6:0])
	);
	
	HexaBCD bcd1(
		.lineIns(Counts[7:4]),
		.lineOuts(LEDs[13:7])
	);
	
	HexaBCD bcd2(
		.lineIns(Counts[11:8]),
		.lineOuts(LEDs[20:14])
	);
	
	HexaBCD bcd3(
		.lineIns(Counts[15:12]),
		.lineOuts(LEDs[27:21])
	);

endmodule