module COUNTER
(
    input CLK, CLR,
    output reg [1:0] COUNT
);

    // Count
    always @ (posedge CLK)
        begin
            if (CLR)
                begin
                    COUNT <= 2'b00;
                end
            else
                begin
                    COUNT <= COUNT + 2'b01;
                end
        end

endmodule

module testCOUNTER;

    reg CLK, CLR;
    wire [1:0] COUNT;
    
    initial begin
        CLK = 1'b0;
        CLR = 1'b0;
    end
    
    COUNTER UUT(
        .CLK(CLK),
        .CLR(CLR),
        .COUNT(COUNT)
    );
    
    initial begin
        #1
        CLK = 1'b1;
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        CLR = 1'b1;
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        CLR = 1'b0;
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
        CLR = 1'b1;
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        CLR = 1'b0;
        #1
        CLK = 1'b0;
        #1
        CLK = 1'b1;
        #1
        CLK = 1'b0;       
    end

endmodule
