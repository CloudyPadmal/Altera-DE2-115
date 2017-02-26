module bcdDecoder(lineIns, lineOuts);

	// Define inputs and outputs
	input [2:0] lineIns;
	output [6:0] lineOuts;
	
	// Make assignments
	assign lineOuts[0] = (~lineIns[2] & ~lineIns[0]) | lineIns[2];
	assign lineOuts[1] = ((~lineIns[2] & ~lineIns[1] & lineIns[0]) | (~lineIns[2] & lineIns[1] & ~lineIns[0])) | lineIns[2];
	assign lineOuts[2] = ((~lineIns[2] & ~lineIns[1] & lineIns[0]) | (~lineIns[2] & lineIns[1] & ~lineIns[0])) | lineIns[2];
	assign lineOuts[3] = (~lineIns[2] & ~lineIns[1] & ~lineIns[0]) | lineIns[2];
	assign lineOuts[4] = (lineIns[1] & ~lineIns[1]) | lineIns[2];
	assign lineOuts[5] = (lineIns[1] & ~lineIns[1]) | lineIns[2];
	assign lineOuts[6] = (~lineIns[2] & lineIns[1]) | lineIns[2];
	
endmodule