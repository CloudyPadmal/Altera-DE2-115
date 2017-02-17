module p6(A, B, LEDs, Ci, Co, LEDA, LEDB);

	// Define inputs and outputs
	input [7:0] A, B;
	output [20:0] LEDs;
	input Ci;
	output Co;
	output [13:0] LEDA, LEDB;
	
	wire [3:0] T0, T1;
	wire T0_C, T1_C, C1, C2;
	wire [3:0] A0, A1, B0, B1, S0, S1, S2, Z0, Z1;
	
	assign A0 = A[3:0];
	assign A1 = A[7:4];
	
	assign B0 = B[3:0];
	assign B1 = B[7:4];
	
	assign T0 = A0 + B0;
	
	Comparator Comp_T0(.lineIn(T0), .result(T0_C));
	Multiplexer_4_1 mux_z0(.selector(T0_C), .lineOuts(Z0));
	Multiplexer mux_c1(.line1(1'b0), .line2(1'b1), .lineout(C1), .selector(T0_C));
	
	assign S0 = T0 - Z0;
	
	assign T1 = A1 + B1 + C1;
		
	Comparator Comp_T1(.lineIn(T1), .result(T1_C));
	Multiplexer_4_1 mux_z1(.selector(T1_C), .lineOuts(Z1));
	Multiplexer mux_c2(.line1(1'b0), .line2(1'b1), .lineout(C2), .selector(T1_C));
	
	assign S1 = T1 - Z1;
	assign S2 = C2;
	
	// Display A1A0
	BCD bcdA0(.lineIn(A0), .lineOut(LEDA[6:0]));
	BCD bcdA1(.lineIn(A1), .lineOut(LEDA[13:7]));
	
	// Display B1B0
	BCD bcdB0(.lineIn(B0), .lineOut(LEDB[6:0]));
	BCD bcdB1(.lineIn(B1), .lineOut(LEDB[13:7]));
	
	BCD bcdS0(.lineIn(S0), .lineOut(LEDs[6:0]));
	BCD bcdS1(.lineIn(S1), .lineOut(LEDs[13:7]));
	BCD bcdS2(.lineIn(S2), .lineOut(LEDs[20:14]));

endmodule