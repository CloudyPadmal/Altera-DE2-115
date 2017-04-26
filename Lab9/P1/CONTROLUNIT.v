module CONTROLUNIT
(
    input RUN, RESET,
    input [1:0] COUNTERLINE,
    input [8:0] IRLINE,
    output [9:0] MUXLINE,
    output [9:0] REGSELECTORS,
    output ADDSUB,
    output IREN,
    output COUNTERCLR,
    output DONE    
);

    // Instruction will be in the format IIIXXXYYY
    
    // Fetch instruction
    reg [2:0] INSTRUCTION;
    assign INSTRUCTION = IRLINE[8:6];
    
    // Fetch registers
    reg [7:0] REG1, REG2;
    // Get IR Decoded
    DECODER DEC1(
        .LINEIN(IRLINE[5:3]),
        .EN(1'b1),
        .LINEOUT(REG1)
    );
    DECODER DEC2(
        .LINEIN(IRLINE[2:0]),
        .EN(1'b1),
        .LINEOUT(REG2)
    );
    
    


endmodule

module testCONTROLUNIT;

endmodule
