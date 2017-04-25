module REGISTER
(
    input [15:0] IN,
    input CLK, WE,
    output reg [15:0] OUT
);
    // Register Size
    parameter DATA_WIDTH = 16;
    // Temp Holder
    reg [15:0] CURRENT = 16'b0000_0000_0000_0000;

    always @ (posedge CLK)
        begin
            if (WE)
                begin
                    OUT <= IN;
                    CURRENT <= IN;
                end
            else
                begin
                    OUT <= CURRENT;
                end
        end

endmodule

/*****************************************************************************/
/************************ Test Bench for REGISTER ****************************/
/*****************************************************************************/
module testREGISTER;

    reg [15:0] IN;
    reg CLK, WE;
    wire [15:0] OUT;
    
    // Initiate registers
    initial begin
        IN = 16'b0000_0000_0000_0000;
        CLK = 1'b0;
        WE = 1'b0;
    end
    
    // Initiate Register
    REGISTER UUT(
        .IN(IN),
        .CLK(CLK),
        .WE(WE),
        .OUT(OUT)
    );
    
    // Test
    initial begin
        #10 // Set a value for REG
        IN = 16'b0110_0011_0000_1110;
        CLK = 1'b1;
        WE = 1'b1;
        #10
        CLK = 1'b0;
        #10 // Keep a value on DATA with WE - 0
        IN = 16'b0011_0000_1110_0001;
        CLK = 1'b1;
        WE = 1'b0;
        #10
        CLK = 1'b0;
        #10 // Set a new value for REG
        IN = 16'b0011_0010_1110_1101;
        CLK = 1'b1;
        WE = 1'b1;
        #10
        CLK = 1'b0;
        #10 // Try Read value
        IN = 16'b0011_0000_1110_0001;
        CLK = 1'b1;
        WE = 1'b0;
        #10
        CLK = 1'b0;
        #10 // Set a new value
        IN = 16'b0011_1110_1110_0001;
        CLK = 1'b1;
        WE = 1'b1;
        
    end

endmodule
