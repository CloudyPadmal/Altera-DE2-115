module Comparator(lineIn, result);

	// Define inputs and outputs
	input [4:0] lineIn;
	output result;
	
	// Simplify this to wires
	wire A = lineIn[4];
	wire B = lineIn[3];
	wire C = lineIn[2];
	wire D = lineIn[1];
	wire E = lineIn[0];
	
	// Assign result
	assign result = ~((~A & ~C & ~D) | (~A & ~B & D) | (~A & ~B & C & ~D));

endmodule