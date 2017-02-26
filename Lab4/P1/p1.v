module p1(LEDs, CLK, EN, RST);
	
	// Define inputs and outputs
	output [27:0] LEDs;
	input CLK, EN, RST;
	
	wire [15:0] counters;
	
	counter_16 Counter(
		.bits(counters),
		.CLK(CLK),
		.EN(EN),
		.RST(RST)
	);
	
	HexaBCD bcd0(
		.lineIns(counters[3:0]),
		.lineOuts(LEDs[6:0])
	);
	
	HexaBCD bcd1(
		.lineIns(counters[7:4]),
		.lineOuts(LEDs[13:7])
	);
	
	HexaBCD bcd2(
		.lineIns(counters[11:8]),
		.lineOuts(LEDs[20:14])
	);
	
	HexaBCD bcd3(
		.lineIns(counters[15:12]),
		.lineOuts(LEDs[27:21])
	);

endmodule