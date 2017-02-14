module Oner(lineIn, lineOuts);

	// Define inputs and outputs
	input lineIn;
	output [6:0] lineOuts;
	
	// Assign 1 on 7 segment
	assign lineOuts[0] = 1;
	assign lineOuts[1] = ~lineIn;
	assign lineOuts[2] = ~lineIn;
	assign lineOuts[3] = 1;
	assign lineOuts[4] = 1;
	assign lineOuts[5] = 1;
	assign lineOuts[6] = 1;

endmodule