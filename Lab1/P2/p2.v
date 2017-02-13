module p2 (selector, X, Y, LEDs);
	
	// Define SW17 as the selector
	input selector;
	// Define two bus lines
	input [7:0] X;
	input [7:0] Y;
	// Define output with LEDs
	output [7:0] LEDs;
	
	// Create the MUX
	assign LEDs[0] = (~selector & X[0]) | (selector & Y[0]);
	assign LEDs[1] = (~selector & X[1]) | (selector & Y[1]);
	assign LEDs[2] = (~selector & X[2]) | (selector & Y[2]);
	assign LEDs[3] = (~selector & X[3]) | (selector & Y[3]);
	assign LEDs[4] = (~selector & X[4]) | (selector & Y[4]);
	assign LEDs[5] = (~selector & X[5]) | (selector & Y[5]);
	assign LEDs[6] = (~selector & X[6]) | (selector & Y[6]);
	assign LEDs[7] = (~selector & X[7]) | (selector & Y[7]);

endmodule