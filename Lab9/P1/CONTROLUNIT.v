module CONTROLUNIT
(
    input RUN, CLK,
    input [1:0] COUNTERLINE,
    input [8:0] IRLINE,
    output reg [9:0] MUXLINE,
    output reg [9:0] REGSELECTORS,
    output reg ADDSUB,
    output reg COUNTERCLR,
    output reg DONE
);

    // Instruction will be in the format IIIXXXYYY
    localparam I0 = 3'b001;
    localparam I1 = 3'b010;
    localparam I2 = 3'b011;
    localparam I3 = 3'b100;
        
    // Fetch instruction
    wire [2:0] INSTRUCTION;
    reg IREN;
    reg [8:0] IRtoCU;
    assign INSTRUCTION = IRtoCU[8:6];
    
    // REGSELECTORS 10'bGA_HGFE_DCBA
    
    // Fetch registers
    wire [7:0] REG1, REG2;
    // Get IR Decoded
    DECODER DEC1(
        .LINEIN(IRtoCU[5:3]),
        .EN(1'b1),
        .LINEOUT(REG1)
    );
    DECODER DEC2(
        .LINEIN(IRtoCU[2:0]),
        .EN(1'b1),
        .LINEOUT(REG2)
    );
    
    always @ (*)
        begin
            if (IREN)
                begin
                    if (COUNTERLINE == 2'b00)
                        begin
                            IRtoCU = IRLINE;
                        end
                end
        end
    
    always @ (*)
        begin
            if (RUN)
                begin
                    case (COUNTERLINE)
                        2'b00: // Fetch Instruction to IR
                            begin
                                IREN = 1'b1;
                                DONE = 1'b0;
                                // Clear MUX Line;
                                MUXLINE = 10'b00_0000_0000;
                                // Clear REG Line;
                                REGSELECTORS = 10'b00_0000_0000;
                            end
                        2'b01: // Time Step One
                            begin
                                IREN = 1'b0;
                                case (INSTRUCTION)
                                    I0: // RX <- RY; DONE;
                                        begin
                                            // Open RY REG from MUX;
                                            MUXLINE = {2'b00, REG2};
                                            // Open RX REG from CU;
                                            REGSELECTORS = {2'b00, REG1};
                                            // Assert Done;
                                            DONE = 1'b1;
                                            COUNTERCLR <= 1'b1;
                                        end
                                    I1: // RX <- DIN; DONE;
                                        begin
                                            // Open RX REG from CU;
                                            REGSELECTORS = {2'b00, REG1};
                                            // Open DIN Line from MUX;
                                            MUXLINE = 10'b10_0000_0000;
                                            // Assert Done;
                                            DONE = 1'b1;
                                            COUNTERCLR <= 1'b1;
                                        end
                                    I2: // REGA <- RX;
                                        begin
                                            // Open RX REG from MUX;
                                            MUXLINE = {2'b00, REG1};
                                            // Enable ALU Accumulator;
                                            REGSELECTORS = 10'b01_0000_0000;
                                            DONE = 1'b0;
                                        end
                                    I3: // REGA <- RX;
                                        begin
                                            // Open RX REG from CU;
                                            MUXLINE = {2'b00, REG1};
                                            // Enable ALU Accumulator;
                                            REGSELECTORS = 10'b01_0000_0000;
                                            DONE = 1'b0;
                                        end
                                endcase
                            end
                        2'b10: // Time Step Two
                            begin
                                case (INSTRUCTION)
                                    I2: // REGG <- RY; ADD = 1;
                                        begin
                                            // Open RY from MUX;
                                            MUXLINE = {2'b00, REG2};
                                            // Open REGG from CU;
                                            REGSELECTORS = 10'b10_0000_0000;
                                            // Add;
                                            ADDSUB = 1'b1;
                                        end
                                    I3: // REGG <- RY; ADD = 0;
                                        begin
                                            // Open RY from MUX;
                                            MUXLINE = {2'b00, REG2};
                                            // Open REGG from CU;
                                            REGSELECTORS = 10'b10_0000_0000;
                                            // Substract;
                                            ADDSUB = 1'b0;
                                        end
                                endcase
                            end
                        2'b11: // Time Step Three
                            begin
                                case (INSTRUCTION)
                                    I2: // RX <- REGG; DONE;
                                        begin
                                            // Open REGG from MUX;
                                            MUXLINE = 10'b010_0000_0000;
                                            // Open REGX from CU;
                                            REGSELECTORS = {2'b00, REG1};
                                            // Assert Done;
                                            DONE = 1'b1;
                                            COUNTERCLR <= 1'b1;
                                        end
                                    I3: // RX <- REGG; DONE;
                                        begin
                                            // Open REGG from MUX;
                                            MUXLINE = 10'b010_0000_0000;
                                            // Open REGX from CU;
                                            REGSELECTORS = {2'b00, REG1};
                                            // Assert Done;
                                            DONE = 1'b1;
                                            COUNTERCLR <= 1'b1;
                                        end
                                endcase
                            end
                    endcase
                end
        end


endmodule

module tC;

    reg RUN, CLK;
    reg [1:0] COUNTERLINE;
    reg [8:0] IRLINE;
    wire [9:0] MUXLINE, REGSELECTORS;
    wire ADDSUB, COUNTERCLR, DONE;
    
    // Initiate CU
    CONTROLUNIT UUT(
        .CLK(CLK),
        .RUN(RUN),
        .COUNTERLINE(COUNTERLINE),
        .IRLINE(IRLINE),
        .MUXLINE(MUXLINE),
        .REGSELECTORS(REGSELECTORS),
        .ADDSUB(ADDSUB),
        .COUNTERCLR(COUNTERCLR),
        .DONE(DONE)
    );
    
    // Initiate Registers
    initial begin
        RUN = 1'b0;
        CLK = 1'b0;
    end
    
    // Test
    initial begin
    
        #1 // Initiate Circuit by resetting
        RUN = 1'b1;
        CLK = 1'b1;
        /******************************** I0 *********************************/
        #0 // Time Step 1 -> I0
        COUNTERLINE = 2'b00;
        IRLINE = 9'b001_001_011;
        #1
        CLK = 1'b0;
        
        #1 // Time Step 2 -> I0
        CLK = 1'b1;
        COUNTERLINE = 2'b01;
        #1
        CLK = 1'b0;
        
        /******************************** I1 *********************************/
        #1 // Time Step 1 -> I1
        COUNTERLINE = 2'b00;
        IRLINE = 9'b010_001_000;
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        
        #1 // Time Step 2 -> I1
        COUNTERLINE = 2'b01;
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        
        /******************************** I2 *********************************/
        #1 // Time Step 1 -> I2
        COUNTERLINE = 2'b00;
        IRLINE = 9'b011_011_010;
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        
        #1 // Time Step 2 -> I2
        COUNTERLINE = 2'b01;
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        
        #1 // Time Step 3 -> I2
        COUNTERLINE = 2'b10;
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        
        #1 // Time Step 4 -> I2
        COUNTERLINE = 2'b11;
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        
        /******************************** I3 *********************************/
        #1 // Time Step 1 -> I3
        COUNTERLINE = 2'b00;
        IRLINE = 9'b100_101_110;
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        
        #1 // Time Step 2 -> I3
        COUNTERLINE = 2'b01;
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        
        #1 // Time Step 3 -> I3
        COUNTERLINE = 2'b10;
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        
        #1 // Time Step 4 -> I3
        COUNTERLINE = 2'b11;
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        #1
        CLK = 1'b0;
    end

endmodule
