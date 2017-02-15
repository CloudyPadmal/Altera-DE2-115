module p4(A, B, Co, Ci, Ds, Ai, Bi, E);

	// Input values - 4 bits long
	input [3:0] A, B;
	// Input carry in
	input Ci;
	// Output carry out and Error
	output Co, E;
	// Stream for digitizer to display two digits
	output [13:0] Ds;
	// Input A and B values on 7 segments
	output [6:0] Ai;
	output [6:0] Bi;
	// Wires for internal connections
	wire [3:0] S;
	wire a, b, c;
	wire E1, E2;
	// Digitizer input
	wire [4:0] D;
	
	assign D[3:0] = S;
	assign D[4] = Co;
	
	// Create 4 FAs and combine
	FA fa0(
		.a(A[0]),
		.b(B[0]),
		.ci(Ci),
		.s(S[0]),
		.co(a)
	);
	
	FA fa1(
		.a(A[1]),
		.b(B[1]),
		.ci(a),
		.s(S[1]),
		.co(b)
	);
	
	FA fa2(
		.a(A[2]),
		.b(B[2]),
		.ci(b),
		.s(S[2]),
		.co(c)
	);
	
	FA fa3(
		.a(A[3]),
		.b(B[3]),
		.ci(c),
		.s(S[3]),
		.co(Co)
	);
	
	// Create display
	Digitizer digitizer(
		.lineIns(D),
		.lineOuts(Ds)
	);
	
	// Display adding numbers
	BCD bcd0(
		.lineIn(A),
		.lineOut(Ai)
	);
	
	BCD bcd1(
		.lineIn(B),
		.lineOut(Bi)
	);
	
	// Display error if A or B is greater than 9
	Comparator c0(
		.lineIn(A),
		.result(E1)
	);
	
	Comparator c1(
		.lineIn(B),
		.result(E2)
	);

	assign E = E1 | E2;

endmodule