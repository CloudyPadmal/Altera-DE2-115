module IREGISTER
(
    input [8:0] IN,
    input CLK, WE,
    output reg [8:0] OUT
);

    always @ (negedge CLK)
        begin
            if (WE)
                begin
                    OUT <= IN;
                end
        end

endmodule

/*****************************************************************************/
/************************ Test Bench for IREGISTER ***************************/
/*****************************************************************************/
module testIREGISTER;

    reg [8:0] IN;
    reg CLK, WE;
    wire [8:0] OUT;
    
    // Initiate registers
    initial begin
        IN = 9'b0_0000_0000;
        CLK = 1'b0;
        WE = 1'b0;
    end
    
    // Initiate Register
    IREGISTER UUT(
        .IN(IN),
        .CLK(CLK),
        .WE(WE),
        .OUT(OUT)
    );
    
    // Test
    initial begin
        #10 // Set a value for REG
        IN = 9'b1_0000_1110;
        CLK = 1'b1;
        WE = 1'b1;
        #10
        CLK = 1'b0;
        #10 // Keep a value on DATA with WE - 0
        IN = 9'b0_1110_0001;
        CLK = 1'b1;
        WE = 1'b0;
        #10
        CLK = 1'b0;
        #10 // Set a new value for REG
        IN = 9'b0_1110_1101;
        CLK = 1'b1;
        WE = 1'b1;
        #10
        CLK = 1'b0;
        #10 // Try Read value
        IN = 9'b0_1110_0001;
        CLK = 1'b1;
        WE = 1'b0;
        #10
        CLK = 1'b0;
        #10 // Set a new value
        IN = 9'b0_1110_0001;
        CLK = 1'b1;
        WE = 1'b1;        
    end

endmodule
