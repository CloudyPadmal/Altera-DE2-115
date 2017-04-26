module MULTIPLEXER
(
    input [15:0] REG1,
    input [15:0] REG2,
    input [15:0] REG3,
    input [15:0] REG4,
    input [15:0] REG5,
    input [15:0] REG6,
    input [15:0] REG7,
    input [15:0] REG8,
    input [15:0] REGG,
    input [15:0] DAIN,
    input [9:0] SLCTR,
    output reg [15:0] OUT
);

    always @ (*)
        begin
            case (SLCTR)
                10'b00_0000_0001:
                    begin
                        OUT <= REG1;
                    end
                10'b00_0000_0010:
                    begin
                        OUT <= REG2;
                    end
                10'b00_0000_0100:
                    begin
                        OUT <= REG3;
                    end
                10'b00_0000_1000:
                    begin
                        OUT <= REG4;
                    end
                10'b00_0001_0000:
                    begin
                        OUT <= REG5;
                    end
                10'b00_0010_0000:
                    begin
                        OUT <= REG6;
                    end
                10'b00_0100_0000:
                    begin
                        OUT <= REG7;
                    end
                10'b00_1000_0000:
                    begin
                        OUT <= REG8;
                    end
                10'b01_0000_0000:
                    begin
                        OUT <= REGG;
                    end
                10'b10_0000_0000:
                    begin
                        OUT <= DAIN;
                    end
                default:
                    begin
                        OUT <= 16'b0000_0000_0000_0000;
                    end
            endcase
        end

endmodule

module testMULTIPLEXER;

    reg [15:0] A, B, C, D, E, F, G, H, DI, RG;
    reg [9:0] S;
    wire [15:0] O;
    
    initial begin
        A = 16'b0000_0000_0000_0001;
        B = 16'b0000_0000_0000_0010;
        C = 16'b0000_0000_0000_0100;
        D = 16'b0000_0000_0000_1000;
        E = 16'b0000_0000_0001_0000;
        F = 16'b0000_0000_0010_0000;
        G = 16'b0000_0000_0100_0000;
        H = 16'b0000_0000_1000_0000;
        DI = 16'b0000_0001_0000_0000;
        RG = 16'b0000_0010_0000_0000;
        S = 10'b00_0000_0000;
    end
    
    MULTIPLEXER UUT(
        .REG1(A),
        .REG2(B),
        .REG3(C),
        .REG4(D),
        .REG5(E),
        .REG6(F),
        .REG7(G),
        .REG8(H),
        .REGG(RG),
        .DAIN(DI),
        .SLCTR(S),
        .OUT(O)
    );
    
    initial begin
        #1
        S = 10'b00_0000_0001;
        #1
        S = 10'b00_0000_0010;
        #1
        S = 10'b00_0000_0100;
        #1
        S = 10'b00_0000_1000;
        #1
        S = 10'b00_0001_0000;
        #1
        S = 10'b00_0010_0000;
        #1
        S = 10'b00_0100_0000;
        #1
        S = 10'b00_1000_0000;
        #1
        S = 10'b01_0000_0000;
        #1
        S = 10'b10_0000_0000;
        #1
        S = 10'b00_1010_0000;
        #1
        S = 10'b00_0000_0000;
        #1
        S = 10'b00_0000_0010;
    end

endmodule
