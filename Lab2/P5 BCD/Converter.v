module Converter(lineIns, lineOuts);

	// Define inputs and outputs
	input [3:0] lineIns;
	output [3:0] lineOuts;
	
	// Assign output
	assign lineOuts[3] = ~lineIns[3] & ~lineIns[2] & lineIns[1];
	assign lineOuts[2] = (~lineIns[3] & ~lineIns[2] & ~lineIns[1]) | (lineIns[3] & lineIns[2] & lineIns[1]);
	assign lineOuts[1] = (~lineIns[3] & ~lineIns[2] & ~lineIns[1]) | (lineIns[3] & lineIns[2] & ~lineIns[1]);
	assign lineOuts[0] = (~lineIns[3] & ~lineIns[2] & lineIns[0]) | (lineIns[3] & lineIns[2] & lineIns[0]) | (lineIns[3] & ~lineIns[2] & lineIns[1] & lineIns[0]);

endmodule