`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 03:46:31 PM
// Design Name: 
// Module Name: Anode_Generator
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

module Anode_Generator(clk, bcd_in, seg_anode, bcd_val);
input clk;
input [15:0] bcd_in;

output reg [3:0] seg_anode = 4'b1110;  // Active low representation
output reg [3:0] bcd_val = 4'd0;

reg [9:0] g_count = 10'd0;

always@(posedge clk)
    begin
        g_count <= g_count+1;  // Non-blocking condition because we want it to update every clock cycle

        if (g_count == 10'd1023) begin
            seg_anode <= {seg_anode[0], seg_anode[3:1]};
            case (seg_anode)
//                4'b1110: bcd_val <= bcd_in[3:0];
//                4'b1101: bcd_val <= bcd_in[7:4];
//                4'b1011: bcd_val <= bcd_in[11:8];
//                4'b0111: bcd_val <= bcd_in[15:12];
                
                4'b1101: bcd_val <= bcd_in[3:0];
                4'b1011: bcd_val <= bcd_in[7:4];
                4'b0111: bcd_val <= bcd_in[11:8];
                4'b1110: bcd_val <= bcd_in[15:12];
            endcase
        end
end
endmodule