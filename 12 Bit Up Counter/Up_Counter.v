`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 02:43:47 PM
// Design Name: 
// Module Name: Up_Counter
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


module Up_Counter (
    input clk,
    input rst,
    output reg [11:0] count
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 12'd0;
        else if (count == 12'd4095)
            count <= 12'd0;
        else
            count <= count + 1'b1;
    end
endmodule