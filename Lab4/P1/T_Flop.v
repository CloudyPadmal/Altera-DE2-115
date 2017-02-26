module T_Flop(T, CLK, Qa, RST);

	// Define inputs and outputs
	input T, CLK, RST;
	output reg Qa;
	
	// Qa should be initiated with a value
	initial 
		begin 
			Qa = 1'b1;
		end

	always @ (posedge CLK)
		begin
			if (RST)
				begin
					Qa = 1'b0;
				end
			else if (T)
				begin 
					Qa = ~Qa;
				end
		end

endmodule