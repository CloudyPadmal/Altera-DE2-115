module bcd(lineIn, lineOut);

	// Define inputs and outputs
	input [3:0] lineIn;
	output [6:0] lineOut;
	
	wire A = lineIn[3];
	wire B = lineIn[2];
	wire C = lineIn[1];
	wire D = lineIn[0];
	
	// Assign logic
	assign lineOut[0] = (~A & B & ~C & ~D) | (~A & ~B & ~C & D);
	assign lineOut[1] = (~A & B & ~C & D) | (~A & B & C & ~D);
	assign lineOut[2] = (~A & ~B & C & ~D);
	assign lineOut[3] = (~A & B & ~C & ~D) | (~A & ~B & ~C & D) | (~A & B & C & D);
	assign lineOut[4] = (~A & B & ~C & ~D) | (A & ~B & ~C & D) | (~A & D);
	assign lineOut[5] = (~A & ~B & ~C & D) | (~A & ~B & C & ~D) | (~A & C & D);
	assign lineOut[6] = (~A & B & C & D) | (~A & ~B & ~C);

endmodule