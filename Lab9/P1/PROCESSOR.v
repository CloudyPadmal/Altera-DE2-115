module PROCESSOR
(
    input CLK, RUN, RESET,
    input [15:0] DIN,
    output [15:0] BUS,
    output DONE
);

    // Internal Wiring
    wire [15:0] R0toMUX, R1toMUX, R2toMUX, R3toMUX, R4toMUX, R5toMUX, R6toMUX, R7toMUX;
    wire [15:0] RGtoMUX, MUXtoRN, RAtoALU, ALUtoRG;
    wire [9:0] MUXSELECTORS, REGSELECTORS;
    wire ADDSUB, IREN, COUNTCLR;
    wire [8:0] IRtoCU;
    wire [1:0] COUNTtoCU;

    // Instantiate CU
    CONTROLUNIT CU(
        .RUN(RUN),
        .RESET(RESET),
        .COUNTERLINE(COUNTtoCU),
        .IRLINE(IRtoCU),
        .MUXLINE(MUXSELECTORS),
        .REGSELECTORS(REGSELECTORS),
        .ADDSUB(ADDSUB),
        .IREN(IREN),
        .COUNTERCLR(COUNTCLR),
        .DONE(DONE)
    );
    
    // Instantiate REGISTERS
    REGISTER REG_0(
        .IN(MUXtoRN),
        .CLK(CLK),
        .WE(REGSELECTORS[0]),
        .OUT(R0toMUX)
    );
    REGISTER REG_1(
        .IN(MUXtoRN),
        .CLK(CLK),
        .WE(REGSELECTORS[1]),
        .OUT(R1toMUX)
    );
    REGISTER REG_2(
        .IN(MUXtoRN),
        .CLK(CLK),
        .WE(REGSELECTORS[2]),
        .OUT(R2toMUX)
    );
    REGISTER REG_3(
        .IN(MUXtoRN),
        .CLK(CLK),
        .WE(REGSELECTORS[3]),
        .OUT(R3toMUX)
    );
    REGISTER REG_4(
        .IN(MUXtoRN),
        .CLK(CLK),
        .WE(REGSELECTORS[4]),
        .OUT(R4toMUX)
    );
    REGISTER REG_5(
        .IN(MUXtoRN),
        .CLK(CLK),
        .WE(REGSELECTORS[5]),
        .OUT(R5toMUX)
    );
    REGISTER REG_6(
        .IN(MUXtoRN),
        .CLK(CLK),
        .WE(REGSELECTORS[6]),
        .OUT(R6toMUX)
    );
    REGISTER REG_7(
        .IN(MUXtoRN),
        .CLK(CLK),
        .WE(REGSELECTORS[7]),
        .OUT(R7toMUX)
    );
    REGISTER REG_A(
        .IN(MUXtoRN),
        .CLK(CLK),
        .WE(REGSELECTORS[8]),
        .OUT(RAtoALU)
    );
    REGISTER REG_G(
        .IN(ALUtoRG),
        .CLK(CLK),
        .WE(REGSELECTORS[9]),
        .OUT(RGtoMUX)
    );
    
    // Instantiate IREGISTER
    IREGISTER IREG(
        .IN(DIN[8:0]),
        .CLK(CLK),
        .WE(IREN),
        .OUT(IRtoCU)
    );
    
    // Instantiate ALU
    ALU ALUUNIT(
        .LINEA(RAtoALU),
        .LINEB(MUXtoRN),
        .ADD(ADDSUB),
        .LINEOUT(ALUtoRG)
    );
    
    // Instantiate Counter
    COUNTER COUNT(
        .CLK(CLK),
        .CLR(COUNTCLR),
        .COUNT(COUNTtoCU)
    );
    
    // Instantiate MULTIPLEXER
    MULTIPLEXER MUX(
        .REG1(R0toMUX),
        .REG2(R1toMUX),
        .REG3(R2toMUX),
        .REG4(R3toMUX),
        .REG5(R4toMUX),
        .REG6(R5toMUX),
        .REG7(R6toMUX),
        .REG8(R7toMUX),
        .REGG(RGtoMUX),
        .DAIN(DIN),
        .SLCTR(MUXSELECTORS),
        .OUT(MUXtoRN)
    );

endmodule
