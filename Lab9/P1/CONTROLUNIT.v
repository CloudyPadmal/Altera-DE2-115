module CONTROLUNIT
(
    input RUN, RESET,
    input [1:0] COUNTERLINE,
    input [8:0] IRLINE,
    output reg [9:0] MUXLINE,
    output reg [9:0] REGSELECTORS,
    output reg ADDSUB,
    output reg IREN,
    output reg COUNTERCLR,
    output reg DONE    
);

    // Instruction will be in the format IIIXXXYYY
    localparam I0 = 3'b001;
    localparam I1 = 3'b010;
    localparam I2 = 3'b011;
    localparam I3 = 3'b100;
    
    // REGSELECTORS 10'bGA_HGFE_DCBA    
    
    // Fetch instruction
    wire [2:0] INSTRUCTION;
    assign INSTRUCTION = IRLINE[8:6];
    
    // Fetch registers
    wire [7:0] REG1, REG2;
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
    
    always @ (*)
        begin
            if (RUN)
                begin
                    if (RESET)
                        begin
                            COUNTERCLR <= 1'b1;
                        end
                    case (COUNTERLINE)
                        2'b00: // Fetch Instruction to IR
                            begin
                                IREN = 1'b1;
                                DONE = 1'b0;
                            end
                        2'b01: // Time Step One
                            begin
                                case (INSTRUCTION)
                                    I0: // RX <- RY; DONE;
                                        begin
                                            // Open RY REG from MUX;
                                            MUXLINE = {2'b00, REG2};
                                            // Open RX REG from CU;
                                            REGSELECTORS = {2'b00, REG1};
                                            // Assert Done;
                                            DONE = 1'b1;
                                        end
                                    I1: // RX <- DIN; DONE;
                                        begin
                                            // Open RX REG from CU;
                                            REGSELECTORS = {2'b00, REG1};
                                            // Open DIN Line from MUX;
                                            MUXLINE = 10'b10_0000_0000;
                                            // Assert Done;
                                            DONE = 1'b1;
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
                                    default:
                                        begin
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
                                    default:
                                        begin
                                            DONE = 1'b0;
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
                                        end
                                    I3: // RX <- REGG; DONE;
                                        begin
                                            // Open REGG from MUX;
                                            MUXLINE = 10'b010_0000_0000;
                                            // Open REGX from CU;
                                            REGSELECTORS = {2'b00, REG1};
                                            // Assert Done;
                                            DONE = 1'b1;
                                        end
                                    default:
                                        begin
                                            DONE = 1'b0;
                                        end
                                endcase
                            end
                    endcase
                end
        end


endmodule

module testCONTROLUNIT;

    reg RUN, RESET;
    reg [1:0] COUNTERLINE;
    reg [8:0] IRLINE;
    wire [9:0] MUXLINE, REGSELECTORS;
    wire ADDSUB, IREN, COUNTERCLR, DONE;
    
    // Initiate CU
    CONTROLUNIT UUT(
        .RUN(RUN),
        .RESET(RESET),
        .COUNTERLINE(COUNTERLINE),
        .IRLINE(IRLINE),
        .MUXLINE(MUXLINE),
        .REGSELECTORS(REGSELECTORS),
        .ADDSUB(ADDSUB),
        .IREN(IREN),
        .COUNTERCLR(COUNTERCLR),
        .DONE(DONE)
    );
    
    // Initiate Registers
    initial begin
        RUN = 1'b0;
        RESET = 1'b0;
        COUNTERLINE = 2'b00;
        IRLINE = 9'b0_0000_0000;
    end
    
    // Test
    initial begin
        #1 // Initiate Circuit by resetting
        RUN = 1'b1;
        COUNTERLINE = 2'b00;
        IRLINE = 9'b0_0100_1010;
        #1 // Time Step I -> I0
        COUNTERLINE = 2'b01;
        IRLINE = 9'b0_0100_1010;
        #1 // Time Step 1 -> I1
        COUNTERLINE = 2'b01;
        IRLINE = 9'b0_1000_1010;
        #1 // Time Step 1 -> I2
        COUNTERLINE = 2'b01;
        IRLINE = 9'b0_1100_1010;
        #1 // Time Step 1 -> I3
        COUNTERLINE = 2'b01;
        IRLINE = 9'b1_0000_1010;
        #1 // Time Step 2 -> I2
        COUNTERLINE = 2'b10;
        IRLINE = 9'b0_1100_1010;
        #1 // Time Step 2 -> I3
        COUNTERLINE = 2'b10;
        IRLINE = 9'b1_0000_1010;
        #1 // Time Step 3 -> I2
        COUNTERLINE = 2'b11;
        IRLINE = 9'b0_1100_1010;
        #1 // Time Step 3 -> I3
        COUNTERLINE = 2'b11;
        IRLINE = 9'b1_0000_1010;
        #1 // Time Step 3 -> I3
        COUNTERLINE = 2'b00;
        IRLINE = 9'b1_0000_1010;
    end

endmodule
