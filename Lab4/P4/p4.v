module p4(CLK, EN, LEDs);

	// Define inputs and outputs
	input CLK, EN;
	output [6:0] LEDs;
	
	wire [3:0] connectors;
	wire clockConnector;
	
	BCD bcd(
		.lineIn(connectors),
		.lineOut(LEDs)
	);
	
	secondsCounter(
		.clkIn(CLK), 
		.clkOut(ClockConnector)
	);
	
	bcdCounter counter(
		.clkIn(ClockConnector), 
		.BCD(connectors)
	);

endmodule