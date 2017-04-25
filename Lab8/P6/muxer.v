module muxer(lineA, lineB, lineOut, S);

    input [4:0] lineA, lineB;
    input S;
    output reg [4:0] lineOut;
    
    always @ (*)
        begin
            if (S)
                begin
                    lineOut = lineA;
                end
            else
                begin
                    lineOut = lineB;
                end
        end
    
endmodule
