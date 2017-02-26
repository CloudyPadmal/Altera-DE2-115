module HexaBCD(lineIns, lineOuts);

	// Define inputs and outputs
	input [3:0] lineIns;
	output [6:0] lineOuts;
	
	wire A = lineIns[3];
	wire B = lineIns[2];
	wire C = lineIns[1];
	wire D = lineIns[0];
		
	assign lineOuts[0] = (~A & ~B & ~C & D) | (~A & B & ~C & ~D) | (A & B & ~C & D) | (A & ~B & C & D);
	assign lineOuts[1] = (B & C & ~D) | (A & C & D) | (~A & B & ~C & D) | (A & B & ~C & ~D);
	assign lineOuts[2] = (A & B & ~C & ~D) | (~A & ~B & C & ~D) | (A & B & C);
	assign lineOuts[3] = (B & C & D) | (A & ~B & C & ~D) | (~A & B & ~C & ~D) | (~A & ~B & ~C & D);
	assign lineOuts[4] = (~A & C & D) | (~B & ~C & D) | (~A & B & ~C);
	assign lineOuts[5] = (A & B & ~C & D) | (~A & ~B & D) | (~A & B & C & D) | (~A & ~B & C & ~D);
	assign lineOuts[6] = (~A & ~B & ~C) | (A & B & ~C & ~D) | (~A & B & C & D);
	
endmodule