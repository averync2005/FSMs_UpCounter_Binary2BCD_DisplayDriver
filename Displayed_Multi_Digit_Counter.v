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
    input clk,
    input rst,
    output [3:0] seg_anode,
    output [6:0] seg_cathode
);
    wire [11:0] count_wire;
    wire [15:0] bcd_wire;
    wire slow_clk;

    // Clock Divider
    Clock_Divider CLOCK (
        .clock_in(clk),
        .clock_out(slow_clk)
    );

    // 12-bit Counter
    Up_Counter COUNTER (
        .clk(slow_clk),
        .rst(rst),
        .count(count_wire)
    );

    // Binary-to-BCD Conversion
    Binary_To_BCD_Converter CONVERTER (
        .clk(clk),
        .rst(rst),
        .binary_in(count_wire),
        .bcd_out(bcd_wire)
    );

    // Multi-Digit Seven-Segment Display Driver
    Multi_Digit_7_Segment_Display_Driver DISPLAY (
        .clk(clk),
        .bcd_in(bcd_wire),
        .seg_anode(seg_anode),
        .seg_cathode(seg_cathode)
    );
endmodule