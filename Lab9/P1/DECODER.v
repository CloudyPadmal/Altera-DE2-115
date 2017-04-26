module DECODER
(
    input [2:0] LINEIN,
    input EN,
    output reg [7:0] LINEOUT
);

    localparam REGISTER_A = 3'b000;
    localparam REGISTER_B = 3'b001;
    localparam REGISTER_C = 3'b010;
    localparam REGISTER_D = 3'b011;
    localparam REGISTER_E = 3'b100;
    localparam REGISTER_F = 3'b101;
    localparam REGISTER_G = 3'b110;
    localparam REGISTER_H = 3'b111;

    always @ (*)
        begin
            if (EN)
                begin
                    case (LINEIN)
                        REGISTER_A:
                            begin
                                LINEOUT <= 8'b0000_0001;
                            end
                        REGISTER_B:
                            begin
                                LINEOUT <= 8'b0000_0010;
                            end
                        REGISTER_C:
                            begin
                                LINEOUT <= 8'b0000_0100;
                            end
                        REGISTER_D:
                            begin
                                LINEOUT <= 8'b0000_1000;
                            end
                        REGISTER_E:
                            begin
                                LINEOUT <= 8'b0001_0000;
                            end
                        REGISTER_F:
                            begin
                                LINEOUT <= 8'b0010_0000;
                            end
                        REGISTER_G:
                            begin
                                LINEOUT <= 8'b0100_0000;
                            end
                        REGISTER_H:
                            begin
                                LINEOUT <= 8'b1000_0000;
                            end
                    endcase
                end
            else
                begin
                    LINEOUT <= 8'b0000_0000;
                end
        end

endmodule

module testDECODER;

    reg [2:0] LINEIN;
    reg EN;
    wire [7:0] LINEOUT;
    
    initial begin
        LINEIN = 3'b000;
        EN = 1'b0;
    end
    
    DECODER UUT(
        .LINEIN(LINEIN),
        .EN(EN),
        .LINEOUT(LINEOUT)
    );
    
    initial begin
        #1
        EN = 1'b1;
        #1
        LINEIN = 3'b000;
        #1
        LINEIN = 3'b001;
        #1
        LINEIN = 3'b010;
        #1
        LINEIN = 3'b011;
        #1
        LINEIN = 3'b100;
        #1
        LINEIN = 3'b101;
        #1
        LINEIN = 3'b110;
        #1
        LINEIN = 3'b111;
        #1
        LINEIN = 3'b010;
    end


endmodule
