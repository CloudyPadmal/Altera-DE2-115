module bcdCounter(clkIn, BCD);

	// Define inputs and outputs
	input clkIn;
	output reg [2:0] BCD;
	
	reg [2:0] count;
	
	initial 
		begin
			count = 0;
		end
	
	always @ (posedge clkIn)
		begin
			if (count < 6)
				begin
					BCD <= count;
					count <= count + 1;
				end
			else
				begin
					BCD <= 6;
					count <= 0;
				end
		end

endmodule