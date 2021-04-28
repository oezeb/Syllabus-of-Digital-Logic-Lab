`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.12.2020 14:20:18
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
reg [7:0]sw;
reg clk;
wire clk_out1;
wire [3:0]out;
wire [2:0]an;
rom rom(.clk(clk),.sw(sw),.out(out),.an(an));
initial clk =0;
always #2 clk = ~clk;
initial
begin
    sw=4'h0;
    #200;
    #100 sw=4'h1;
    #100 sw=4'h2;
    #100 sw=4'h3;
    #100 sw=4'h4;
    #100 sw=4'h5;
    #100 sw=4'h6;
    #100 sw=4'h7;
    #100 sw=4'h8;
    #100 sw=4'h9;
    #100 sw=4'h10;
    #100 sw=4'h11;
    #100 sw=4'h12;
    #100 sw=4'h13;
    #100 sw=4'h14;
    #100 sw=4'h115;
    #100 sw=4'h116;
    #200 $finish;
end
    
endmodule
