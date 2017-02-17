module p5(A, B, LEDs, Ci, Co, LEDA, LEDB);

	// Define inputs and outputs
	input [7:0] A, B;
	input Ci;
	output [20:0] LEDs;
	output [13:0] LEDA, LEDB;
	output Co;
	
	// Define variables in an easy way
	wire [3:0] A0, A1, B0, B1, S0, S1, S2, T;
	// Carry in internally
	wire a, b, c, d, e, f, g;
	
	assign A0 = A[3:0];
	assign A1 = A[7:4];
	
	assign B0 = B[3:0];
	assign B1 = B[7:4];
		
	// Create 8 Full Adders
	FA F01(.a(A0[0]), .b(B0[0]), .ci(Ci), .s(S0[0]), .co(a));
	FA F02(.a(A0[1]), .b(B0[1]), .ci(a), .s(S0[1]), .co(b));
	FA F03(.a(A0[2]), .b(B0[2]), .ci(b), .s(S0[2]), .co(c));
	FA F04(.a(A0[3]), .b(B0[3]), .ci(c), .s(S0[3]), .co(d));
	FA F11(.a(A1[0]), .b(B1[0]), .ci(d), .s(S1[0]), .co(e));
	FA F12(.a(A1[1]), .b(B1[1]), .ci(e), .s(S1[1]), .co(f));
	FA F13(.a(A1[2]), .b(B1[2]), .ci(f), .s(S1[2]), .co(g));
	FA F14(.a(A1[3]), .b(B1[3]), .ci(g), .s(S1[3]), .co(Co));
	
	// Prepare S2
	assign S2 = Co;	
	
	// Display S2S1
	Digitizer digS2S1(.lineIns({S2, S1}), .lineOuts(LEDs[20:7]));
	// Display S0
	Digitizer digS0(.lineIns({d, S0}), .lineOuts({T, LEDs[6:0]}));
	
	// Display A1A0
	BCD bcdA0(.lineIn(A0), .lineOut(LEDA[6:0]));
	BCD bcdA1(.lineIn(A1), .lineOut(LEDA[13:7]));
	
	// Display B1B0
	BCD bcdB0(.lineIn(B0), .lineOut(LEDB[6:0]));
	BCD bcdB1(.lineIn(B1), .lineOut(LEDB[13:7]));

endmodule