`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2020 01:59:56
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
reg clk, rst, sw, start;
wire [3:0] count, last;
wire [1:0] curr_state;
counter c(.clk(clk),.rst(rst),.start(start),.sw(sw),.curr_state(curr_state),.count(count),.last(last));
initial clk <= 0;
always #2 clk = ~clk;
initial
begin
    sw = 0; start = 0; rst = 1;
    #5 sw = 0; rst = 0;
    #2 start = 1;
    #4 start = 0;
    #5 sw = 1;
    #2 start = 1;
    #4 start = 0;
    #5 sw = 0;
    #2 start = 1;
    #4 start = 0;
    #5 sw = 0;
    #2 start = 1;
    #4 start = 0;
    #5 sw = 1;
    #2 start = 1;
    #4 start = 0;
    #5 sw = 1;
    #2 start = 1;
    #4 start = 0;
    #5 sw = 1;
    #3 $finish;
end
endmodule
