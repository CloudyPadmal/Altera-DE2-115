module Converter(lineIns, lineOuts);

	// Define inputs and outputs
	input [2:0] lineIns;
	output [2:0] lineOuts;
	
	// Assign output
	assign lineOuts[2] = lineIns[2] & lineIns[1];
	assign lineOuts[1] = lineIns[2] & ~lineIns[1];
	assign lineOuts[0] = lineIns[0];

endmodule