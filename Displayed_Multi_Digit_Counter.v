`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 03:38:03 PM
// Design Name: 
// Module Name: Displayed_Multi_Digit_Counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Displayed_Multi_Digit_Counter (
    input clk,                // 100 MHz Basys3 clock input
    input rst,                // active-high reset
    output [3:0] seg_anode,   // 4 anode signals (active-low)
    output [6:0] seg_cathode  // 7 cathode signals (active-low)
);





    // Internal Signal Declarations
    wire clk_slow;  // 1 Hz clock for counter
    wire clk_display;  // 1 kHz clock for display refresh
    wire [11:0] count_wire;  // 12-bit counter output (0â€“4095)
    wire [15:0] bcd_wire;  // 16-bit BCD output from converter





    // Clock Divider Instantiations
    // Display refresh (FAST updating)
    Clock_Divider #(.DIVIDE(299)) DIV_DISPLAY (
        .clock_in(clk),
        .rst(rst),
        .clock_out(clk_display)
    );

    // Up-counter  (SLOWER updating)
    Clock_Divider #(.DIVIDE(999_999)) DIV_COUNT (
        .clock_in(clk),
        .rst(rst),
        .clock_out(clk_slow)
    );
    




    // 12-Bit Up Counter
    // Increments once per second using the slow divided clock
    Up_Counter COUNTER (
        .clk(clk_slow),
        .rst(rst),
        .count(count_wire)
    );


    // Binary-to-BCD Converter
    // Converts 12-bit binary input to 16-bit BCD for display
    Binary_To_BCD_Converter CONVERTER (
        .clk(clk_display),
        .rst(rst),
        .binary_in(count_wire),
        .bcd_out(bcd_wire)
    );


    // Multi-Digit Seven-Segment Display Driver
    // Refreshes display at ~1 kHz for stable human-visible output
    Multi_Digit_7_Segment_Display_Driver DISPLAY (
        .clk(clk_display),
        .bcd_in(bcd_wire),
        .seg_anode(seg_anode),
        .seg_cathode(seg_cathode)
    );
endmodule
