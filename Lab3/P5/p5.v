module p5(In, LEDs, RST, CLK);

	// Define inputs and outputs
	input [15:0] In;
	input RST, CLK;
	output [55:0] LEDs;
	
	wire [3:0] A, B, C, D, E, F, G, H;
	
	D_flop_p DA1(.Di(In[0]), .Clk(CLK), .Qa(A[0]), .Rst(RST));
	D_flop_p DA2(.Di(In[1]), .Clk(CLK), .Qa(A[1]), .Rst(RST));
	D_flop_p DA3(.Di(In[2]), .Clk(CLK), .Qa(A[2]), .Rst(RST));
	D_flop_p DA4(.Di(In[3]), .Clk(CLK), .Qa(A[3]), .Rst(RST));
	D_flop_p DA5(.Di(In[4]), .Clk(CLK), .Qa(B[0]), .Rst(RST));
	D_flop_p DA6(.Di(In[5]), .Clk(CLK), .Qa(B[1]), .Rst(RST));
	D_flop_p DA7(.Di(In[6]), .Clk(CLK), .Qa(B[2]), .Rst(RST));
	D_flop_p DA8(.Di(In[7]), .Clk(CLK), .Qa(B[3]), .Rst(RST));
	D_flop_p DA9(.Di(In[8]), .Clk(CLK), .Qa(C[0]), .Rst(RST));
	D_flop_p DA10(.Di(In[9]), .Clk(CLK), .Qa(C[1]), .Rst(RST));
	D_flop_p DA11(.Di(In[10]), .Clk(CLK), .Qa(C[2]), .Rst(RST));
	D_flop_p DA12(.Di(In[11]), .Clk(CLK), .Qa(C[3]), .Rst(RST));
	D_flop_p DA13(.Di(In[12]), .Clk(CLK), .Qa(D[0]), .Rst(RST));
	D_flop_p DA14(.Di(In[13]), .Clk(CLK), .Qa(D[1]), .Rst(RST));
	D_flop_p DA15(.Di(In[14]), .Clk(CLK), .Qa(D[2]), .Rst(RST));
	D_flop_p DA16(.Di(In[15]), .Clk(CLK), .Qa(D[3]), .Rst(RST));
	
	D_flop_n DB1(.Di(In[0]), .Clk(CLK), .Qa(E[0]), .Rst(RST));
	D_flop_n DB2(.Di(In[1]), .Clk(CLK), .Qa(E[1]), .Rst(RST));
	D_flop_n DB3(.Di(In[2]), .Clk(CLK), .Qa(E[2]), .Rst(RST));
	D_flop_n DB4(.Di(In[3]), .Clk(CLK), .Qa(E[3]), .Rst(RST));
	D_flop_n DB5(.Di(In[4]), .Clk(CLK), .Qa(F[0]), .Rst(RST));
	D_flop_n DB6(.Di(In[5]), .Clk(CLK), .Qa(F[1]), .Rst(RST));
	D_flop_n DB7(.Di(In[6]), .Clk(CLK), .Qa(F[2]), .Rst(RST));
	D_flop_n DB8(.Di(In[7]), .Clk(CLK), .Qa(F[3]), .Rst(RST));
	D_flop_n DB9(.Di(In[8]), .Clk(CLK), .Qa(G[0]), .Rst(RST));
	D_flop_n DB10(.Di(In[9]), .Clk(CLK), .Qa(G[1]), .Rst(RST));
	D_flop_n DB11(.Di(In[10]), .Clk(CLK), .Qa(G[2]), .Rst(RST));
	D_flop_n DB12(.Di(In[11]), .Clk(CLK), .Qa(G[3]), .Rst(RST));
	D_flop_n DB13(.Di(In[12]), .Clk(CLK), .Qa(H[0]), .Rst(RST));
	D_flop_n DB14(.Di(In[13]), .Clk(CLK), .Qa(H[1]), .Rst(RST));
	D_flop_n DB15(.Di(In[14]), .Clk(CLK), .Qa(H[2]), .Rst(RST));
	D_flop_n DB16(.Di(In[15]), .Clk(CLK), .Qa(H[3]), .Rst(RST));
	
	BCD seg0(.lineIn(A), .lineOut(LEDs[6:0]));
	BCD seg1(.lineIn(B), .lineOut(LEDs[13:7]));
	BCD seg2(.lineIn(C), .lineOut(LEDs[20:14]));
	BCD seg3(.lineIn(D), .lineOut(LEDs[27:21]));
	BCD seg4(.lineIn(E), .lineOut(LEDs[34:28]));
	BCD seg5(.lineIn(F), .lineOut(LEDs[41:35]));
	BCD seg6(.lineIn(G), .lineOut(LEDs[48:42]));
	BCD seg7(.lineIn(H), .lineOut(LEDs[55:49]));

endmodule