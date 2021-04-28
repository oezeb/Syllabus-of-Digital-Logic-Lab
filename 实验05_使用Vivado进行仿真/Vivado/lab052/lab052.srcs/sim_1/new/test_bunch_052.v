`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/17 18:45:47
// Design Name: 
// Module Name: test_bunch_052
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

module test_bunch_052( );
reg clk,rst_n,d;
initial clk = 0;
always #5 clk = ~clk;
initial
begin
    rst_n =0;
    d=0;
    #13 d=1;
    #15 rst_n=1;
    #10 d=0;
    #17 $finish;
end
endmodule

