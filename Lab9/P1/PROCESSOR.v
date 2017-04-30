module PROCESSOR
(
    input CLK, RUN, RESET,
    input [15:0] DIN,
    output [15:0] BUS,
    output [15:0] DEMO1, DEMO2, DEMO3, DEMO4, DEMO5, DEMO6, DEMO7, DEMO8,
    output DONE,
    output [1:0] COUNTtoCUs,
    output [9:0] MUXSELECTORSs, REGSELECTORSs
);

    // Internal Wiring
    wire [15:0] R0toMUX, R1toMUX, R2toMUX, R3toMUX, R4toMUX, R5toMUX, R6toMUX, R7toMUX;
    wire [15:0] RGtoMUX, MUXtoRN, RAtoALU, ALUtoRG;
    wire [9:0] MUXSELECTORS, REGSELECTORS;
    wire ADDSUB, COUNTCLR;
    wire [1:0] COUNTtoCU;
    
    assign COUNTtoCUs = COUNTtoCU;
    assign MUXSELECTORSs = MUXSELECTORS;
    assign REGSELECTORSs = REGSELECTORS;
    assign DEMO1 = R0toMUX;
    assign DEMO2 = R1toMUX;
    assign DEMO3 = R2toMUX;
    assign DEMO4 = R3toMUX;
    assign DEMO5 = R4toMUX;
    assign DEMO6 = R5toMUX;
    assign DEMO7 = R6toMUX;
    assign DEMO8 = R7toMUX;

    // Instantiate CU
    CONTROLUNIT CU(
        .CLK(CLK),
        .RUN(RUN),
        .COUNTERLINE(COUNTtoCU),
        .IRLINE(DIN[8:0]),
        .MUXLINE(MUXSELECTORS),
        .REGSELECTORS(REGSELECTORS),
        .ADDSUB(ADDSUB),
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
        .CLR(RESET),
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
    
    assign BUS = MUXtoRN;

endmodule

module tP;

    reg CLK;
    reg RUN;
    reg RESET;
    reg [15:0] DIN;
    wire [15:0] BUS;
    wire [15:0] DEMO1, DEMO2, DEMO3, DEMO4, DEMO5, DEMO6, DEMO7, DEMO8;
    wire DONE;
    wire [1:0] COUNTtoCUs;
    wire [9:0] MUXSELECTORSs, REGSELECTORSs;
    
    // Instantiate the Processor
    PROCESSOR UUT(
        .CLK(CLK),
        .RUN(RUN),
        .RESET(RESET),
        .DIN(DIN),
        .DEMO1(DEMO1),
        .DEMO2(DEMO2),
        .DEMO3(DEMO3),
        .DEMO4(DEMO4),
        .DEMO5(DEMO5),
        .DEMO6(DEMO6),
        .DEMO7(DEMO7),
        .DEMO8(DEMO8),
        .BUS(BUS),
        .DONE(DONE),
        .COUNTtoCUs(COUNTtoCUs),
        .MUXSELECTORSs(MUXSELECTORSs),
        .REGSELECTORSs(REGSELECTORSs)
    );
    
    // Instantiate Registers
    initial begin
        CLK = 1'b0;
        RUN = 1'b1; 
        RESET = 1'b0;
    end
    
    // Test I1 (RX <- DIN)
    initial begin
        #1
        CLK = 1'b1;
        RESET = 1'b1;
        DIN = {7'b000_0000, 3'b010, 3'b001, 3'b010};
        #1
        CLK = 1'b0;
        RESET = 1'b0;       
        #1
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        DIN = {7'b111_0111, 3'b010, 3'b101, 3'b110};
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        DIN = {7'b000_1100, 3'b011, 3'b011, 3'b110};
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        DIN = {7'b010_1100, 3'b100, 3'b001, 3'b100};
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
    end

endmodule

