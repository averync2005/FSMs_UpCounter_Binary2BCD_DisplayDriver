`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 03:17:53 PM
// Design Name: 
// Module Name: Binary_To_BCD_Converter_tb
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

module Binary_To_BCD_Converter_tb();
    reg clk, rst;  // Inputs
    reg [11:0] binary_in;  // Inputs
    wire [15:0] bcd_out;  // Output    
    
    Binary_To_BCD_Converter DUT (.clk(clk), .rst(rst), .binary_in(binary_in), .bcd_out(bcd_out));
    
    //Generate Clock
    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end
    
    //Test Cases
    initial begin
        #1 binary_in = 12'b010010110100;
        
        #4000 binary_in = 12'b000011110111;
        
        #4000 binary_in = 12'b001010010010;
        #5 rst=1; #5 rst = 0;
    end
endmodule