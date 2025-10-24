`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 02:46:34 PM
// Design Name: 
// Module Name: Up_Counter_tb
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

module Up_Counter_tb();
    reg clk, rst;  // Inputs
    wire [11:0] count;  // Output
    
    Up_Counter DUT (.clk(clk), .rst(rst), .count(count));  // Non-overlapping (1101)
    
    //Generate Clock
    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end
    
    //Test Cases
    initial begin
        #2 rst=0; #2 rst=1; #2 rst=0;
        
        #4100 rst=1; #10 rst=0;
    end
endmodule