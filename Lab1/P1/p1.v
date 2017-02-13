module p1(Switch, LED);

	// Define inputs and Outputs
	input [17:0] Switch;
	output [17:0] LED;
	// Assign the input to output directly
	assign LED = Switch;
	
endmodule