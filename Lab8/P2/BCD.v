module BCD(lineIn, lineOut);

	// Define inputs and outputs
	input [3:0] lineIn;
	output [6:0] lineOut;
	
	wire A = lineIn[3];
	wire B = lineIn[2];
	wire C = lineIn[1];
	wire D = lineIn[0];
	
	// Assign logic
	assign lineOut[0] = 1'b1;
	assign lineOut[1] = ~D;
	assign lineOut[2] = ~C;
	assign lineOut[3] = 1'b1;
	assign lineOut[4] = ~B;
	assign lineOut[5] = ~A;
	assign lineOut[6] = 1'b1;
	
endmodule