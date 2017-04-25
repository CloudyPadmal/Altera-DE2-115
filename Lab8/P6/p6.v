module p6
(
    input [7:0] DATA,
    input [4:0] ADDRESS,
    input WE,
    input CLK,
    input RESET,
    input SCROLL,
    output [13:0] DISP,
    output [7:0] Q
);
    
    wire [7:0] RAMDATA;
    wire Ticker;
    wire [4:0] AddressSelector;
    reg [4:0] AddressCounter;
    
    // Instantiate the RAM
    ramlpm RAM(
        .address(AddressSelector),
        .clock(CLK),
        .data(DATA),
        .wren(WE),
        .q(RAMDATA)
    );
    
    // Initiate Selector
    muxer RamSelect(
        .lineA(AddressCounter),
        .lineB(ADDRESS),
        .lineOut(AddressSelector),
        .S(SCROLL)
    );
    
    // Display for Data
    HexaBCD DISPD1(
        .lineIns(RAMDATA[3:0]),
        .lineOuts(DISP[6:0])
    );    
    HexaBCD DISPD2(
        .lineIns(RAMDATA[7:4]),
        .lineOuts(DISP[13:7])
    );
    
    // Clock to Scroll thru RAM data
    secondsCounter #(5) Scroller(
        .clkIn(CLK),
        .clkOut(Ticker)
    );
    
    // Scroll through each memory address per one second
    always @ (posedge Ticker)
        begin
            if (RESET)
                begin
                    AddressCounter = 0;
                end
            else
                begin
                    AddressCounter = AddressCounter + 1;
                end
        end

    assign Q = RAMDATA;

endmodule

`timescale 1 ps / 1 ps
module testRam;
    
    reg [7:0] DATA;
    reg [4:0] ADDRESS;
    reg WE;
    reg CLK;
    reg RESET, SCROLL;
    wire [13:0] DISP;
    wire [7:0] Q;
    
    // Clock for test bench
    initial begin
        CLK = 1'b0;
        forever begin
            #1 CLK = ~CLK;
        end
    end
    
    // Initiate RAM
    p6 UUT(
        .DATA(DATA),
        .ADDRESS(ADDRESS),
        .WE(WE),
        .CLK(CLK),
        .RESET(RESET),
        .SCROLL(SCROLL),
        .DISP(DISP),
        .Q(Q)
    );
    
    // Initiate Registers
    initial begin
        DATA = 8'b0000_0000;
        ADDRESS = 5'b0_0000;
        WE = 1'b0;
        RESET = 1'b0;
        SCROLL = 1'b1;
    end
    
    // Test
    initial begin
        #1 // Reset the circuit
        RESET = 1'b1; #1 RESET = 1'b0;
        #600 $finish;
    end
    
endmodule
