module testT;

	reg EN, CLK, RST;
	wire [15:0] bits;
	
	initial begin 
		EN <= 1;
		CLK <= 0;
		RST <= 0;
	end
	
	counter_16 uut(
		.bits(bits),
		.CLK(CLK), 
		.EN(EN), 
		.RST(RST)
	);
	
	initial begin
		#500
		$finish;
	end
	
	always
		#2
		CLK = ~CLK;

endmodule