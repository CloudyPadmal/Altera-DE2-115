module counter_16(CLK, RST, EN, Count);

	// Define inputs and outputs
	input CLK, RST, EN;
	output reg [15:0] Count;
	
	initial begin
		Count = 16'b0000000000000000;
	end
	
	always @ (posedge CLK)
		begin
			if (RST)
				begin
					Count = 16'b0000000000000000;
				end
			else if (EN)
				begin
					if (Count < 16'b1111111111111111)
						begin
							Count <= Count + 1;
						end
					else 
						begin
							Count = 16'b0000000000000000;
						end
				end
		end	

endmodule