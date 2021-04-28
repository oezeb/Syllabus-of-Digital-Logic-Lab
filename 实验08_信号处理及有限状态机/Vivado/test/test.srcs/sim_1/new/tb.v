`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2020 20:10:59
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
reg clk,button;
wire button_edge;
signal_edge s(
    .clk(clk),
    .button(button),
    .button_edge(button_edge)
    );
    initial clk <= 0;
    always #1 clk<= ~clk;
    initial
    begin
        button = 0;
        #5 button = 1;
        #5 button = 0;
        #5 button = 1;
        #5 button = 0;
        #5 button = 1;
        #5 button = 0;
        #5 button = 1;
        #5 button = 0;
        #5 $finish;
    end
endmodule
/*
module tb();
reg clk,in,button;
wire button_edge;
wire [3:0]bus, tmp;
test t(.clk(clk), .in(in), .button(button),.bus(bus),.tmp(tmp),.button_edge(button_edge));
initial clk = 0;
always #2 clk <= ~clk;
initial
begin
    in = 1; button = 0;
    #5 button = 1;
    #5 button = 0;
    #5 button = 1;
    #5 button = 0;
    #5 button = 1;
    #5 button = 0;
    #5 button = 1;
    #5 button = 0;
    #5 button = 1;
    #5 button = 0;
    #5 button = 1;
    #5 button = 0;
    #5 button = 1;
    #5 button = 0;
    #5 button = 1;
    #5 button = 0;
    #5 button = 1;
    #5 button = 0;
    #5 button = 1;
    #5 button = 0;
    #5 $finish;
end    
endmodule*/
