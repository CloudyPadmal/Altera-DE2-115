module counter_4(bits, CLK, EN, RST);

	// Define inputs and outputs
	input CLK, EN, RST;
	output [3:0] bits;
	
	wire a, b, c;
	
	T_Flop T0(
		.T(EN), 
		.CLK(CLK), 
		.Qa(bits[0]),
		.RST(RST)
	);
	
	and(a, EN, bits[0]);
	
	T_Flop T1(
		.T(a), 
		.CLK(CLK), 
		.Qa(bits[1]),
		.RST(RST)
	);
	
	and(b, a, bits[1]);
	
	T_Flop T2(
		.T(b), 
		.CLK(CLK), 
		.Qa(bits[2]),
		.RST(RST)
	);
	
	and(c, b, bits[2]);
	
	T_Flop T3(
		.T(c), 
		.CLK(CLK), 
		.Qa(bits[3]),
		.RST(RST)
	);

endmodule