module muxer(line1, line2, lineout, selector);

	// Define inputs and outputs
	input line1, line2, selector;
	output lineout;
	
	// Select output
	assign lineout = (~selector & line1) | (selector & line2);

endmodule