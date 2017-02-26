module p5(CLK, LEDs);

	// Define inputs and outputs
	input CLK;
	output [34:0] LEDs;
	
	wire ClockConnector;
	wire [2:0] muxSelector, l1, l2, l3, l4, l5;
	reg [2:0] s1, s2, s3, s4, s5;
	
	initial begin
		s1 = 3'b000;
		s2 = 3'b001;
		s3 = 3'b010;
		s4 = 3'b010;
		s5 = 3'b011;
	end
	
	bcdDecoder bcd0(
		.lineIns(l1), 
		.lineOuts(LEDs[6:0])
	);
	bcdDecoder bcd1(
		.lineIns(l2), 
		.lineOuts(LEDs[13:7])
	);
	bcdDecoder bcd2(
		.lineIns(l3), 
		.lineOuts(LEDs[20:14])
	);
	bcdDecoder bcd3(
		.lineIns(l4), 
		.lineOuts(LEDs[27:21])
	);
	bcdDecoder bcd4(
		.lineIns(l5), 
		.lineOuts(LEDs[34:28])
	);
	
	muxer_3_5_1 mux0(
		.A(s1), 
		.B(s2), 
		.C(s3), 
		.D(s4), 
		.E(s5), 
		.Selectors(muxSelector), 
		.LEDs(l1)
	);
	
	muxer_3_5_1 mux1(
		.A(s5), 
		.B(s1), 
		.C(s2), 
		.D(s3), 
		.E(s4), 
		.Selectors(muxSelector), 
		.LEDs(l2)
	);
	
	muxer_3_5_1 mux2(
		.A(s4), 
		.B(s5), 
		.C(s1), 
		.D(s2), 
		.E(s3), 
		.Selectors(muxSelector), 
		.LEDs(l3)
	);
	
	muxer_3_5_1 mux3(
		.A(s3), 
		.B(s4), 
		.C(s5), 
		.D(s1), 
		.E(s2), 
		.Selectors(muxSelector), 
		.LEDs(l4)
	);
	
	muxer_3_5_1 mux4(
		.A(s2), 
		.B(s3), 
		.C(s4), 
		.D(s5), 
		.E(s1), 
		.Selectors(muxSelector), 
		.LEDs(l5)
	);
	
	secondsCounter(
		.clkIn(CLK), 
		.clkOut(ClockConnector)
	);
	
	bcdCounter counter(
		.clkIn(ClockConnector), 
		.BCD(muxSelector)
	);	

endmodule