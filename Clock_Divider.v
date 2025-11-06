`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2025 03:43:35 PM
// Design Name: 
// Module Name: Clock_Divider
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

module Clock_Divider #(parameter DIVIDE = 49_999) (
    input clock_in,  // Input clock (100 MHz)
    input rst,  // Active-high reset
    output reg clock_out  // Divided output clock
);

    reg [31:0] counter = 0;  // Safe 32-bit counter for any divide value

    always @(posedge clock_in or posedge rst) begin
        if (rst) begin
            counter   <= 0;
            clock_out <= 1'b0;
        end
        else if (counter == DIVIDE) begin  // Can also use ">="
            counter   <= 0;
            clock_out <= ~clock_out;  // Toggle output when count reached
        end
        else begin
            counter <= counter + 1'b1;  // Increment counter each clock
        end
    end
endmodule
