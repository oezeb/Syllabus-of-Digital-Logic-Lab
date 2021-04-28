`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2020 01:11:47
// Design Name: 
// Module Name: tb
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


module tb();
    reg clk;
    wire clk_out1;
    wire clk_out2;
    clk_wiz_0 c0(.clk_in1(clk),.reset(0),.clk_out1(clk_out1));
    custom_clk_wiz_10mhz c1(.clk(clk),.out(clk_out2));
    initial clk <= 0;
    always #1 clk <= ~clk; 
endmodule
