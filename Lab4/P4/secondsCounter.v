module secondsCounter(clkIn, clkOut);

	// Define inputs and outputs
	input clkIn;
	output reg clkOut;
	
	reg [26:0] seconds;
	
	always @ (posedge clkIn)
		begin
			if (seconds < 50000000)
				begin
					seconds <= seconds + 1;
					clkOut <= 0;
				end
			else
				begin
					seconds <= 0;
					clkOut <= 1;
				end
		end

endmodule