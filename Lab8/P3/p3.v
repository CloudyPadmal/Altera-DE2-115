module p3
(
    input [7:0] data, 
    input [4:0] address,
    output reg [7:0] q, 
    input we, 
    input clk
);
    // Initiate RAM block
    reg [7:0] RAM[31:0];
    
    always @(posedge clk) 
        begin
            if (we)
                begin
                    RAM[address] <= data;
                end
            q <= RAM[address];
        end

endmodule


module testp3;

    reg [7:0] data;
    reg [4:0] address;
    reg we, clk;
    wire [7:0] q;
    
    // Initiate Clock for test bench
    initial begin
        clk = 1'b0;
        forever begin
            #1 clk = ~clk;
        end    
    end
    
    // Initiate Memory module
    p3 RAM(
        .data(data),
        .address(address),
        .q(q),
        .we(we),
        .clk(clk)
    );
    
    // Initiate registers with values
    initial begin
        data = 8'b0000_0000;
        address = 7'b0_0000;
        we = 1'b0;
    end
    
    // Test
    initial begin
        #5
        we = 1'b1;
        data = 8'b1001_1010;
        address = 5'b1_0010;
        #5
        we = 1'b0;
        address = 5'b1_0110;
        #5
        we = 1'b1;
        data = 8'b1011_1001;
        address = 5'b1_0110;
        #5
        we = 1'b0;
        data = 8'b1001_1010;
        address = 5'b1_0010;
        #5
        we = 1'b0;
        data = 8'b1001_1010;
        address = 5'b1_0110;
        #5
        $finish;
    
    end

endmodule
