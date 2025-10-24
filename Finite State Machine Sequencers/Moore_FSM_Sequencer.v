`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 01:46:13 PM
// Design Name: 
// Module Name: Moore_FSM_Sequencer
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

module Moore_FSM_Sequencer (  // Non-overlapping (1100)
    input clk,
    input rst,
    input in_bit,
    output reg Y
);
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;
    reg [1:0] PS, NS;

    //Initialize State
    always @(posedge clk or posedge rst) begin
        if (rst)
            PS <= S0;
        else
            PS <= NS;
    end

    //State Transition
    always @(*) begin
        case (PS)
            S0: NS <= in_bit ? S1 : S0;  // 1
            S1: NS <= in_bit ? S2 : S0;  // 1
            S2: NS <= ~in_bit ? S3 : S0;  // 0
            default: NS <= S0;  // 0
        endcase
    end

    //Output State
    always @(*) begin
        case (PS)
            S3: Y <= 1'b1;  // '1100' recognized, one-cycle-late pulse
            default: Y <= 1'b0;
        endcase
    end
endmodule