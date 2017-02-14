module Comparator(lineIn, result);

	// Define inputs and outputs
	input [3:0] lineIn;
	output result;
	
	// Assign result
	assign result = (lineIn[3] & lineIn[2]) + (lineIn[3] & ~lineIn[2] & lineIn[1]);

endmodule