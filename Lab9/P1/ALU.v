module ALU
(
    input [15:0] LINEA, LINEB,
    input ADD,
    output reg [15:0] LINEOUT,
    output ADDs
);

    assign ADDs = ADD;
    
    always @ (*)
        begin
            if (ADD)
                begin
                    LINEOUT <= LINEA + LINEB;
                end
            else
                begin
                    LINEOUT <= LINEA - LINEB;
                end
        end
    
endmodule

module testALU;

    reg [15:0] LINEA, LINEB;
    reg ADD;
    wire [15:0] LINEOUT;
    
    ALU UUT(
        .LINEA(LINEA),
        .LINEB(LINEB),
        .LINEOUT(LINEOUT),
        .ADD(ADD)
    );
    
    initial begin
        LINEA = 16'b0000_0000_0000_0000;
        LINEB = 16'b0000_0000_0000_0000;
        ADD = 1'b0;
    end    
    
    initial begin
        #1
        LINEA = 16'b0000_0000_0110_0000;
        LINEB = 16'b0100_1100_0000_0000;
        ADD = 1'b1;
        #1
        LINEA = 16'b0000_0111_0000_0000;
        LINEB = 16'b0000_0001_0000_0000;
        ADD = 1'b0;
        #1
        LINEA = 16'b1111_0000_0000_0000;
        LINEB = 16'b0011_0000_0000_0000;
        ADD = 1'b0;
        #1
        LINEA = 16'b1111_0000_0111_0000;
        LINEB = 16'b0000_1111_0000_0111;
        ADD = 1'b0;
    end
    
endmodule
