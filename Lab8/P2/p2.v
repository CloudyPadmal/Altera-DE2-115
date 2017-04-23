module p2
(
    input [4:0] address,
	input clock,
	input [7:0] data,
	input wren,
	output [7:0] q,
    output [13:0] LEDs,
    output [7:0] outs
);

    // Instantiate RAM
    rammo RAM(
        .address(address),
        .clock(clock),
        .data(data),
        .wren(wren),
        .q(q)
    );
    
    
    // Instantiate 7Segments
    BCD address1(
        .lineIn({3'b000, address[4]}),
        .lineOut(LEDs[13:7])
    );
    
    BCD address2(
        .lineIn(address[3:0]),
        .lineOut(LEDs[6:0])
    );
    
    assign outs = data;    

endmodule
