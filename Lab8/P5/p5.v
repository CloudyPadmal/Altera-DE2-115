module p5
(
    input [7:0] DATA,
    input [4:0] ADDRESS,
    input WE,
    input CLK,
    output [13:0] DISPA,
    output [13:0] DISPD,
    output [5:0] RADDRESS,
    output [7:0] QD,
    input RESET
);
    // This will tick every one second
    wire Seconders;
    reg [4:0] AddressCounter = 5'b0_0000;
    

    // Initiate the Seconds counter
    secondsCounter #(10) COUNTER(
        .clkIn(CLK),
        .clkOut(Seconders)
    );
    
    // Initiate RAM
    ramlpm RAM(
        .clock(CLK),
        .data(DATA),
        .rdaddress(AddressCounter),
        .wraddress(ADDRESS),
        .wren(WE),
        .q(QD)
    );
    
    // 7 Segments
    HexaBCD ADDRESS1(
        .lineIns(ADDRESS[3:0]),
        .lineOuts(DISPA[6:0])
    );
    HexaBCD ADDRESS2(
        .lineIns({3'b000, ADDRESS[4]}),
        .lineOuts(DISPA[13:7])
    );
    
    HexaBCD DATA1(
        .lineIns(QD[3:0]),
        .lineOuts(DISPD[6:0])
    );
    HexaBCD DATA2(
        .lineIns(QD[7:4]),
        .lineOuts(DISPD[13:7])
    );
    
    // Display Data on HEXs
    always @ (posedge Seconders)
        begin
            if (RESET)
                begin
                    AddressCounter = 0;
                end
            else
                begin
                    // Increase Address counter by one
                    AddressCounter <= AddressCounter + 1;
                end
        end
    
    assign RADDRESS = AddressCounter;

endmodule


`timescale 1 ps / 1 ps
module testp5;

    reg CLK;
    reg [7:0] DATA;
    reg [4:0] ADDRESS;
    reg WE;
    wire [7:0] QD;
    wire [13:0] DISPA;
    wire [13:0] DISPD;
    wire [5:0] RADDRESS;
    reg RESET;
    
    // Create the test bench clock
    initial begin
        CLK = 1'b0;
        forever begin
            #1 CLK = ~CLK;
        end
    end
    
    // Initialize main module
    p5 UUT(
        .DATA(DATA),
        .ADDRESS(ADDRESS),
        .RADDRESS(RADDRESS),
        .WE(WE),
        .CLK(CLK),
        .DISPA(DISPA),
        .DISPD(DISPD),
        .RESET(RESET),
        .QD(QD)
    );
    
    // Stop after 10 x 32 + 10 times
    initial begin
        #700 $finish;
    end
    
    // Initiate Registers
    initial begin
        DATA = 0;
        ADDRESS = 0;
        WE = 0;
        RESET = 1;
        #1 RESET = 0;
    end


endmodule
