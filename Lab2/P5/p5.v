module p5 (A, B, Ci, Co, LEDs);

	// Define inputs and outputs
	input [7:0] A, B;
	input Ci;
	output Co;
	wire [7:0] S;
	output [48:0] LEDs;
	
	// Wires to carry internal Co's
	wire a, b, c, d, e, f, g;
	
	// Create 8 FAs
	FA f0(.a(A[0]), .b(B[0]), .ci(Ci), .s(S[0]), .co(a));
	FA f1(.a(A[1]), .b(B[1]), .ci(a), .s(S[1]), .co(b));
	FA f2(.a(A[2]), .b(B[2]), .ci(b), .s(S[2]), .co(c));
	FA f3(.a(A[3]), .b(B[3]), .ci(c), .s(S[3]), .co(d));
	FA f4(.a(A[4]), .b(B[4]), .ci(d), .s(S[4]), .co(e));
	FA f5(.a(A[5]), .b(B[5]), .ci(e), .s(S[5]), .co(f));
	FA f6(.a(A[6]), .b(B[6]), .ci(f), .s(S[6]), .co(g));
	FA f7(.a(A[7]), .b(B[7]), .ci(g), .s(S[7]), .co(Co));
	
	// Since A & B are less than 99, there won't be a carry out
	// So a digitizer is made with 8 inputs with Sum bits to it.
	Digitizer3 digitizerS(.lineIns(S), .LEDs(LEDs[20:0]));
	// To display A and B
	Digitizer2 digitizerA(.lineIns(A), .LEDs(LEDs[34:21]));
	Digitizer2 digitizerB(.lineIns(B), .LEDs(LEDs[48:35]));

endmodule