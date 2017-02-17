module Digitizer2(lineIns, LEDs);

	// Inputs and outputs
	input [7:0] lineIns;
	output [13:0] LEDs;
	
	reg [3:0] bcd0In;
	reg [3:0] bcd1In;
	
	// Create two BCDs
	BCD bcd0(.lineIn(bcd0In), .lineOut(LEDs[6:0]));
	BCD bcd1(.lineIn(bcd1In), .lineOut(LEDs[13:7]));
	
	always @ *
		case (lineIns)
			8'b00000000 : begin bcd0In = 4'b0000; bcd1In = 4'b0000; end // 00
			8'b00000001 : begin bcd0In = 4'b0001; bcd1In = 4'b0000; end // 01
			8'b00000010 : begin bcd0In = 4'b0010; bcd1In = 4'b0000; end // 02
			8'b00000011 : begin bcd0In = 4'b0011; bcd1In = 4'b0000; end // 03
			8'b00000100 : begin bcd0In = 4'b0100; bcd1In = 4'b0000; end // 04
			8'b00000101 : begin bcd0In = 4'b0101; bcd1In = 4'b0000; end // 05
			8'b00000110 : begin bcd0In = 4'b0110; bcd1In = 4'b0000; end // 06
			8'b00000111 : begin bcd0In = 4'b0111; bcd1In = 4'b0000; end // 07
			8'b00001000 : begin bcd0In = 4'b1000; bcd1In = 4'b0000; end // 08
			8'b00001001 : begin bcd0In = 4'b1000; bcd1In = 4'b0000; end // 09
			8'b00001010 : begin bcd0In = 4'b0000; bcd1In = 4'b0001; end // 10
			8'b00001011 : begin bcd0In = 4'b0001; bcd1In = 4'b0001; end // 11
			8'b00001100 : begin bcd0In = 4'b0010; bcd1In = 4'b0001; end // 12
			8'b00001101 : begin bcd0In = 4'b0011; bcd1In = 4'b0001; end // 13
			8'b00001110 : begin bcd0In = 4'b0100; bcd1In = 4'b0001; end // 14
			8'b00001111 : begin bcd0In = 4'b0101; bcd1In = 4'b0001; end // 15
			8'b00010000 : begin bcd0In = 4'b0110; bcd1In = 4'b0001; end // 16
			8'b00010001 : begin bcd0In = 4'b0111; bcd1In = 4'b0001; end // 17
			8'b00010010 : begin bcd0In = 4'b1000; bcd1In = 4'b0001; end // 18
			8'b00010011 : begin bcd0In = 4'b1001; bcd1In = 4'b0001; end // 19
			8'b00010100 : begin bcd0In = 4'b0000; bcd1In = 4'b0010; end // 20
			8'b00010101 : begin bcd0In = 4'b0001; bcd1In = 4'b0010; end // 21
			8'b00010110 : begin bcd0In = 4'b0010; bcd1In = 4'b0010; end // 22
			8'b00010111 : begin bcd0In = 4'b0011; bcd1In = 4'b0010; end // 23
			8'b00011000 : begin bcd0In = 4'b0100; bcd1In = 4'b0010; end // 24
			8'b00011001 : begin bcd0In = 4'b0101; bcd1In = 4'b0010; end // 25
			8'b00011010 : begin bcd0In = 4'b0110; bcd1In = 4'b0010; end // 26
			8'b00011011 : begin bcd0In = 4'b0111; bcd1In = 4'b0010; end // 27
			8'b00011100 : begin bcd0In = 4'b1000; bcd1In = 4'b0010; end // 28
			8'b00011101 : begin bcd0In = 4'b1001; bcd1In = 4'b0010; end // 29
			8'b00011110 : begin bcd0In = 4'b0000; bcd1In = 4'b0011; end // 30
			8'b00011111 : begin bcd0In = 4'b0001; bcd1In = 4'b0011; end // 31
			8'b00100000 : begin bcd0In = 4'b0010; bcd1In = 4'b0011; end // 32
			8'b00100001 : begin bcd0In = 4'b0011; bcd1In = 4'b0011; end // 33
			8'b00100010 : begin bcd0In = 4'b0100; bcd1In = 4'b0011; end // 34
			8'b00100011 : begin bcd0In = 4'b0101; bcd1In = 4'b0011; end // 35
			8'b00100100 : begin bcd0In = 4'b0110; bcd1In = 4'b0011; end // 36
			8'b00100101 : begin bcd0In = 4'b0111; bcd1In = 4'b0011; end // 37
			8'b00100110 : begin bcd0In = 4'b1000; bcd1In = 4'b0011; end // 38
			8'b00100111 : begin bcd0In = 4'b1001; bcd1In = 4'b0011; end // 39
			8'b00101000 : begin bcd0In = 4'b0000; bcd1In = 4'b0100; end // 40
			8'b00101001 : begin bcd0In = 4'b0001; bcd1In = 4'b0100; end // 41
			8'b00101010 : begin bcd0In = 4'b0010; bcd1In = 4'b0100; end // 42
			8'b00101011 : begin bcd0In = 4'b0011; bcd1In = 4'b0100; end // 43
			8'b00101100 : begin bcd0In = 4'b0100; bcd1In = 4'b0100; end // 44
			8'b00101101 : begin bcd0In = 4'b0101; bcd1In = 4'b0100; end // 45
			8'b00101110 : begin bcd0In = 4'b0110; bcd1In = 4'b0100; end // 46
			8'b00101111 : begin bcd0In = 4'b0111; bcd1In = 4'b0100; end // 47
			8'b00110000 : begin bcd0In = 4'b1000; bcd1In = 4'b0100; end // 48
			8'b00110001 : begin bcd0In = 4'b1001; bcd1In = 4'b0100; end // 49
			8'b00110010 : begin bcd0In = 4'b0000; bcd1In = 4'b0101; end // 50
			8'b00110011 : begin bcd0In = 4'b0001; bcd1In = 4'b0101; end // 51
			8'b00110100 : begin bcd0In = 4'b0010; bcd1In = 4'b0101; end // 52
			8'b00110101 : begin bcd0In = 4'b0011; bcd1In = 4'b0101; end // 53
			8'b00110110 : begin bcd0In = 4'b0100; bcd1In = 4'b0101; end // 54
			8'b00110111 : begin bcd0In = 4'b0101; bcd1In = 4'b0101; end // 55
			8'b00111000 : begin bcd0In = 4'b0110; bcd1In = 4'b0101; end // 56
			8'b00111001 : begin bcd0In = 4'b0111; bcd1In = 4'b0101; end // 57
			8'b00111010 : begin bcd0In = 4'b1000; bcd1In = 4'b0101; end // 58
			8'b00111011 : begin bcd0In = 4'b1001; bcd1In = 4'b0101; end // 59
			8'b00111100 : begin bcd0In = 4'b0000; bcd1In = 4'b0110; end // 60
			8'b00111101 : begin bcd0In = 4'b0001; bcd1In = 4'b0110; end // 61
			8'b00111110 : begin bcd0In = 4'b0010; bcd1In = 4'b0110; end // 62
			8'b00111111 : begin bcd0In = 4'b0011; bcd1In = 4'b0110; end // 63
			8'b01000000 : begin bcd0In = 4'b0100; bcd1In = 4'b0110; end // 64
			8'b01000001 : begin bcd0In = 4'b0101; bcd1In = 4'b0110; end // 65
			8'b01000010 : begin bcd0In = 4'b0110; bcd1In = 4'b0110; end // 66
			8'b01000011 : begin bcd0In = 4'b0111; bcd1In = 4'b0110; end // 67
			8'b01000100 : begin bcd0In = 4'b1000; bcd1In = 4'b0110; end // 68
			8'b01000101 : begin bcd0In = 4'b1001; bcd1In = 4'b0110; end // 69
			8'b01000110 : begin bcd0In = 4'b0000; bcd1In = 4'b0111; end // 70
			8'b01000111 : begin bcd0In = 4'b0001; bcd1In = 4'b0111; end // 71
			8'b01001000 : begin bcd0In = 4'b0010; bcd1In = 4'b0111; end // 72
			8'b01001001 : begin bcd0In = 4'b0011; bcd1In = 4'b0111; end // 73
			8'b01001010 : begin bcd0In = 4'b0100; bcd1In = 4'b0111; end // 74
			8'b01001011 : begin bcd0In = 4'b0101; bcd1In = 4'b0111; end // 75
			8'b01001100 : begin bcd0In = 4'b0110; bcd1In = 4'b0111; end // 76
			8'b01001101 : begin bcd0In = 4'b0111; bcd1In = 4'b0111; end // 77
			8'b01001110 : begin bcd0In = 4'b1000; bcd1In = 4'b0111; end // 78
			8'b01001111 : begin bcd0In = 4'b1001; bcd1In = 4'b0111; end // 79
			8'b01010000 : begin bcd0In = 4'b0000; bcd1In = 4'b1000; end // 80
			8'b01010001 : begin bcd0In = 4'b0001; bcd1In = 4'b1000; end // 81
			8'b01010010 : begin bcd0In = 4'b0010; bcd1In = 4'b1000; end // 82
			8'b01010011 : begin bcd0In = 4'b0011; bcd1In = 4'b1000; end // 83
			8'b01010100 : begin bcd0In = 4'b0100; bcd1In = 4'b1000; end // 84
			8'b01010101 : begin bcd0In = 4'b0101; bcd1In = 4'b1000; end // 85
			8'b01010110 : begin bcd0In = 4'b0110; bcd1In = 4'b1000; end // 86
			8'b01010111 : begin bcd0In = 4'b0111; bcd1In = 4'b1000; end // 87
			8'b01011000 : begin bcd0In = 4'b1000; bcd1In = 4'b1000; end // 88
			8'b01011001 : begin bcd0In = 4'b1001; bcd1In = 4'b1000; end // 89
			8'b01011010 : begin bcd0In = 4'b0000; bcd1In = 4'b1001; end // 90
			8'b01011011 : begin bcd0In = 4'b0001; bcd1In = 4'b1001; end // 91
			8'b01011100 : begin bcd0In = 4'b0010; bcd1In = 4'b1001; end // 92
			8'b01011101 : begin bcd0In = 4'b0011; bcd1In = 4'b1001; end // 93
			8'b01011110 : begin bcd0In = 4'b0100; bcd1In = 4'b1001; end // 94
			8'b01011111 : begin bcd0In = 4'b0101; bcd1In = 4'b1001; end // 95
			8'b01100000 : begin bcd0In = 4'b0110; bcd1In = 4'b1001; end // 96
			8'b01100001 : begin bcd0In = 4'b0111; bcd1In = 4'b1001; end // 97
			8'b01100010 : begin bcd0In = 4'b1000; bcd1In = 4'b1001; end // 98
			8'b01100011 : begin bcd0In = 4'b1001; bcd1In = 4'b1001; end // 99		
			default 		: begin bcd0In = 4'b0000; bcd1In = 4'b0000; end
		endcase
	
endmodule