`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2020 00:01:50
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
reg clk, start;
reg [1:0]sw;
wire [3:0]out;
wire [2:0]an;
count count(.clk(clk),.start(start),.sw(sw),.out(out),.an(an));
initial clk = 0;
always #5 clk = ~clk;
initial
begin
    start = 0; sw = 2'b10;
    #10 sw = 2'b00;
    #3 start = 1;
    #100 start = 0;
    #7 start = 1;
    #3 start = 0;
    #7 start = 1;
    #11 start = 0;
    #7 start = 1;
    #3 start = 0;
    #5 $finish;
end
endmodule
