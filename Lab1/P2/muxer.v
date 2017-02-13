module muxer(line1, line2, selector, lineout);

	// Define input lines
	input line1, line2, selector;
	output lineout;
	// Select the output
	assign lineout = (~selector & line1) | (selector & line2);

endmodule