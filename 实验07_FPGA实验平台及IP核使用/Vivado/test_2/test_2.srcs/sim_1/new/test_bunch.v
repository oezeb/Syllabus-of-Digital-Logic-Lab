`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 11:52:33
// Design Name: 
// Module Name: test_bunch
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


module test_bunch();
wire [7:0]led;
reg clk,rst;
initial
begin
 clk = 0;
 forever
 #5 clk = ~clk;
end
initial
begin
 rst = 1;
 #100 rst = 0;
end
test test(
.clk (clk),
.rst (rst),
.led (led));
endmodule

/*
module test_bunch();
reg clk,rst;
wire [7:0]led;
wire clk_10m,clk_200m,locked;
wire [31:0] cnt_1,cnt_2;
initial
begin
 clk = 0;
 forever
 #5 clk = ~clk;
end
initial
begin
 rst = 1;
 #100 rst = 0;
end
test test(
.clk (clk),
.rst (rst),
.led (led),.clk_10m(clk_10m),.clk_200m(clk_200m),.locked(locked),.cnt_1(cnt_1),.cnt_2(cnt_2));
endmodule*/

