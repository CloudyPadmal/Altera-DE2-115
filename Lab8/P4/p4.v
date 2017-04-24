module p4
(
    input [7:0] DATA,
    input [4:0] ADDRESS,
    input WE,
    input CLK,
    output reg [7:0] Q,
    output SRAMWE, UB, LB, CE, OE, SRAME,
    output [19:0] SRAMADDRESS,
    inout wire [15:0] SRAMDATA,
    output [13:0] LEDs
);

    reg [15:0] TEMP;
    
    // Instantiate 7Segments
    BCD address1(
        .lineIn({3'b000, ADDRESS[4]}),
        .lineOut(LEDs[13:7])
    );
    
    BCD address2(
        .lineIn(ADDRESS[3:0]),
        .lineOut(LEDs[6:0])
    );

    // SRAM Data line for input for SRAM
    always @ (*)
        begin
            if (WE)
                begin
                    TEMP <= {8'b0000_0000, DATA};
                end
            else
                begin
                    Q <= SRAMDATA[7:0];
                end
        end

    assign SRAMDATA = TEMP;
    // SRAM Address line
    assign SRAMADDRESS = {15'b000_0000_0000_0000, ADDRESS};
    // Write enable
    assign SRAMWE = ~WE;
    assign OE = WE;
    // Default values
    assign CE = 1'b0;
    assign UB = 1'b0;
    assign LB = 1'b0;
    
endmodule


module testSRAM;

    reg [7:0] DATA;
    reg [4:0] ADDRESS;
    reg WE;
    reg CLK;
    wire [7:0] Q;
    wire SRAMWE, UB, LB, CE, OE, SRAME;
    wire [19:0] SRAMADDRESS;
    wire [15:0] SRAMDATA;
    wire [13:0] LEDs;
    
    // Instantiate SRAM Module
    p4 UUT(
        .DATA(DATA),
        .ADDRESS(ADDRESS),
        .WE(WE),
        .CLK(CLK),
        .Q(Q),
        .SRAMWE(SRAMWE),
        .UB(UB),
        .LB(LB),
        .CE(CE),
        .OE(OE),
        .SRAME(SRAME),
        .SRAMADDRESS(SRAMADDRESS),
        .SRAMDATA(SRAMDATA),
        .LEDs(LEDs)
    );
    
    // Clock for simulation
    initial begin
        CLK = 1'b0;
        forever begin
            #1
            CLK = ~CLK;
        end
    end
    
    // Initiate registers
    initial begin
        DATA = 8'b0000_0000;
        ADDRESS = 5'b0_0000;
        WE = 1'b0;
    end
    
    // Test
    initial begin
        #10 // Write data to address A
        DATA = 8'b1101_0100;
        ADDRESS = 5'b0_0101;
        WE = 1'b1;
        #10 // Read data from address B
        DATA = 8'b0000_0000;
        ADDRESS = 5'b0_1011;
        WE = 1'b0;
        #10 // Write data to address B
        DATA = 8'b0100_0011;
        ADDRESS = 5'b0_1011;
        WE = 1'b1;
        #10 // Read data from address A
        DATA = 8'b0000_0000;
        ADDRESS = 5'b0_0101;
        WE = 1'b0;
        #10 // Read data from address B
        DATA = 8'b0000_0000;
        ADDRESS = 5'b0_1011;
        WE = 1'b0;
        #10 // Read data from address C
        DATA = 8'b0000_0000;
        ADDRESS = 5'b0_1111;
        WE = 1'b0;
        #5 $finish;
    end

endmodule
