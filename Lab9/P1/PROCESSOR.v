module PROCESSOR
(
    input CLK, RUN, RESET,
    input [15:0] DIN,
    output [15:0] BUS,
    output [15:0] DEMO1, DEMO2, DEMO3, DEMO4, DEMO5, DEMO6, DEMO7, DEMO8, ACCu, RG,
    output DONE, ADDs,
    output [1:0] COUNTtoCUs,
    output [2:0] INSs,
    output [9:0] MUXSELECTORSs, REGSELECTORSs
);

    // Internal Wiring
    wire [15:0] R0toMUX, R1toMUX, R2toMUX, R3toMUX, R4toMUX, R5toMUX, R6toMUX, R7toMUX;
    wire [15:0] RGtoMUX, MUXtoRN, RAtoALU, ALUtoRG;
    wire [9:0] MUXSELECTORS, REGSELECTORS;
    wire ADDSUB, COUNTCLR, ADDw;
    wire [2:0] INS;
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
    assign ACCu = RAtoALU;
    assign RG = ALUtoRG;
    assign INSs = INS;
    assign ADDs = ADDw;

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
        .INS(INS),
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
        .LINEOUT(ALUtoRG),
        .ADDs(ADDw)
    );
    
    // Instantiate Counter
    COUNTER COUNT(
        .CLK(CLK),
        .CLR(RESET | COUNTCLR),
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
    wire [15:0] DEMO1, DEMO2, DEMO3, DEMO4, DEMO5, DEMO6, DEMO7, DEMO8, ACCu, RG;
    wire DONE;
    wire [2:0] INSs;
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
        .ACCu(ACCu),
        .RG(RG),
        .INSs(INSs),
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
        /************************** I1 - 1 ***********************************/
        #1
        CLK = 1'b1;
        RESET = 1'b1;
        DIN = {7'b000_0000, 3'b010, 3'b001, 3'b000}; // I1 : R1 <- DIN
        #1
        CLK = 1'b0;
        RESET = 1'b0;       
        #1
        CLK = 1'b1;
        DIN = {7'b000_0000, 3'b000, 3'b100, 3'b000}; // Provide Data via DIN
        #1
        CLK = 1'b0;
        /************************** I1 - 2 ***********************************/
        #1
        CLK = 1'b1;
        DIN = {7'b000_0000, 3'b010, 3'b010, 3'b000}; // I1 : R2 <- DIN
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        DIN = {7'b000_0000, 3'b000, 3'b000, 3'b100}; // Provide Data via DIN        
        #1
        CLK = 1'b0;
        /************************** I0 - 1 ***********************************/
        #1
        CLK = 1'b1;
        DIN = {7'b000_0000, 3'b001, 3'b011, 3'b001}; // I0 : R3 <- R1
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        /************************** I2 - 1 ***********************************/
        #1
        CLK = 1'b1;
        DIN = {7'b000_0000, 3'b011, 3'b001, 3'b010}; // I2 : R1 <- R1 + R2
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        /************************** I3 - 1 ***********************************/
        #1
        CLK = 1'b1;
        DIN = {7'b000_0000, 3'b100, 3'b001, 3'b010}; // I3 : R1 <- R1 - R2
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
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

