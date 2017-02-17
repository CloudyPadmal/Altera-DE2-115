module Multiplexer_4_1 (selector, lineOuts);

	// selector will decide whether to release 0 or 10
	input selector;
	output [3:0] lineOuts;
	
	assign lineOuts[0] = 0;
	assign lineOuts[2] = 0;
	Multiplexer mux1(.line1(1'b0), .line2(1'b1), .lineout(lineOuts[1]), .selector(selector));
	Multiplexer mux3(.line1(1'b0), .line2(1'b1), .lineout(lineOuts[3]), .selector(selector));

endmodule