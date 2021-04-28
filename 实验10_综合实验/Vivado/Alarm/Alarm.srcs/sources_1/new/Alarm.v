`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2020 21:05:50
// Design Name: 
// Module Name: Alarm
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


module Alarm(
    input clk,
    input [1:0] sw,
    output [3:0] out,
    output [2:0] an
    );
    
    wire clk_1hz;
    clk_wiz_1hz clk_wiz_1hz(.clk_100mhz(clk),.out(clk_1hz));
    
    reg [7:0]sec;
    always@(posedge clk_1hz) sec <= sec + 8'h1;
    
    wire [1:0] sel = sw;
    display display(.clk(clk),.h(8'h0),.min(8'h0),.sec(sec),.sel(sel),.out(out),.an(an));
    
endmodule
