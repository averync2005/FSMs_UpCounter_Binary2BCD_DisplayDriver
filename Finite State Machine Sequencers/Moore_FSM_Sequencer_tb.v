`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 01:49:48 PM
// Design Name: 
// Module Name: Moore_FSM_Sequencer_tb
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

module Moore_FSM_Sequencer_tb();
    reg clk, rst, in_bit;  // Inputs
    wire Y;  // Output
    
    Moore_FSM_Sequencer DUT (.clk(clk), .rst(rst), .in_bit(in_bit), .Y(Y));  // Non-overlapping (1100)
    
    //Generate Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    //Test Cases
    initial begin
        rst=0; in_bit=0; #5;
        #10; rst=0; in_bit=1;
        #10; rst=0; in_bit=1;
        #10; rst=0; in_bit=0;
        #10; rst=0; in_bit=0;
        #10; rst=0; in_bit=0;
        #10; rst=0; in_bit=1;
        #10; rst=0; in_bit=1;
        #10; rst=1; in_bit=0;
    end
endmodule