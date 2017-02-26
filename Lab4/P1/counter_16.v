module counter_16(bits, CLK, EN, RST);

	// Define inputs and outputs
	input CLK, EN, RST;
	output [15:0] bits;
	
	wire [14:0] connectors;
	
	T_Flop T0(
		.T(EN), 
		.CLK(CLK), 
		.Qa(bits[0]),
		.RST(RST)
	);
	
	and(connectors[0], EN, bits[0]);
	
	T_Flop T1(
		.T(connectors[0]), 
		.CLK(CLK), 
		.Qa(bits[1]),
		.RST(RST)
	);
	
	and(connectors[1], connectors[0], bits[1]);
	
	T_Flop T2(
		.T(connectors[1]), 
		.CLK(CLK), 
		.Qa(bits[2]),
		.RST(RST)
	);
	
	and(connectors[2], connectors[1], bits[2]);
	
	T_Flop T3(
		.T(connectors[2]), 
		.CLK(CLK), 
		.Qa(bits[3]),
		.RST(RST)
	);
	
	and(connectors[3], connectors[2], bits[3]);
	
	T_Flop T4(
		.T(connectors[3]), 
		.CLK(CLK), 
		.Qa(bits[4]),
		.RST(RST)
	);
	
	and(connectors[4], connectors[3], bits[4]);
	
	T_Flop T5(
		.T(connectors[4]), 
		.CLK(CLK), 
		.Qa(bits[5]),
		.RST(RST)
	);
	
	and(connectors[5], connectors[4], bits[5]);
	
	T_Flop T6(
		.T(connectors[5]), 
		.CLK(CLK), 
		.Qa(bits[6]),
		.RST(RST)
	);
	
	and(connectors[6], connectors[5], bits[6]);
	
	T_Flop T7(
		.T(connectors[6]), 
		.CLK(CLK), 
		.Qa(bits[7]),
		.RST(RST)
	);
	
	and(connectors[7], connectors[6], bits[7]);
	
	T_Flop T8(
		.T(connectors[7]), 
		.CLK(CLK), 
		.Qa(bits[8]),
		.RST(RST)
	);
	
	and(connectors[8], connectors[7], bits[8]);
	
	T_Flop T9(
		.T(connectors[8]), 
		.CLK(CLK), 
		.Qa(bits[9]),
		.RST(RST)
	);
	
	and(connectors[9], connectors[8], bits[9]);
	
	T_Flop T10(
		.T(connectors[9]), 
		.CLK(CLK), 
		.Qa(bits[10]),
		.RST(RST)
	);
	
	and(connectors[10], connectors[9], bits[10]);
	
	T_Flop T11(
		.T(connectors[10]), 
		.CLK(CLK), 
		.Qa(bits[11]),
		.RST(RST)
	);
	
	and(connectors[11], connectors[10], bits[11]);
	
	T_Flop T12(
		.T(connectors[11]), 
		.CLK(CLK), 
		.Qa(bits[12]),
		.RST(RST)
	);
	
	and(connectors[12], connectors[11], bits[12]);
	
	T_Flop T13(
		.T(connectors[12]), 
		.CLK(CLK), 
		.Qa(bits[13]),
		.RST(RST)
	);
	
	and(connectors[13], connectors[12], bits[13]);
	
	T_Flop T14(
		.T(connectors[13]), 
		.CLK(CLK), 
		.Qa(bits[14]),
		.RST(RST)
	);
	
	and(connectors[14], connectors[13], bits[14]);
	
	T_Flop T15(
		.T(connectors[14]), 
		.CLK(CLK), 
		.Qa(bits[15]),
		.RST(RST)
	);

endmodule