module p1
(
    input [4:0] address,
	input clock,
	input [7:0] data,
	input wren,
	output [7:0] q
);

    // Instantiate the RAM
    ramlpm RAM(
        .address(address),
        .clock(clock),
        .data(data),
        .wren(wren),
        .q(q)
    );

endmodule

`timescale 1 ns / 1 ns
module testp1;

    reg clock;
    reg [4:0] address;
    reg [7:0] data;
    reg wren;
    wire [7:0] q;
    
    // Clock for the test bench
    initial begin
        clock = 1'b0;
        forever begin
            #1 clock = ~clock;
        end
    end
    
    // Initiate Main module
    p1 UUT(
        .address(address),
        .clock(clock),
        .data(data),
        .wren(wren),
        .q(q)
    );
    
    // Initiate registers
    initial begin
        address = 5'b0_0000;
        data = 8'b0000_0000;
        wren = 1'b0;
    end
    
    // Test
    initial begin
        #10
        wren = 1'b1;
        address = 5'b0_0100;
        data = 8'b1001_1011;
        #10
        wren = 1'b0;
        #10
        address = 5'b0_0101;
        #10
        address = 5'b0_0100;
        data = 8'b1001_0011;
        #10
        $finish;
    end

endmodule

/*
Instantiation of 'altsyncram' failed. The design unit was not found error

1. Compile the testbench code <testbench.v> , it gets included in your 'work' library.
2. Select 'Simulate' -> 'Start Simulation' from the menu.
3. Click on the 'Libraries' tab in the new popup window and press 'Add' to include the 'altera_mf_ver' library 
   to the 'Search Libraries First (-Lf)'
4. Finally, select your testbench from the 'Design' tab.
*/