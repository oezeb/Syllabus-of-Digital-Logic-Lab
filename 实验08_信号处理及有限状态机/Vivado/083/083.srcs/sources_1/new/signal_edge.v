`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2020 23:44:29
// Design Name: 
// Module Name: signal_edge
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


module signal_edge(
    input clk,
    input button,
    output button_edge,
    output reg button_r1,button_r2);
    always@(posedge clk) button_r1 <= button;
    always@(posedge clk) button_r2 <= button_r1;
    assign button_edge = button_r1 & (~button_r2);
endmodule

    