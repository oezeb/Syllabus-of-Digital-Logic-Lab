`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/17 18:52:59
// Design Name: 
// Module Name: d_ff_r_test_bunch
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

module d_ff_r_test_bunch( );
reg clk,rst_n,d;
wire q;
d_ff_r d_ff_r(.clk(clk),.rst_n(rst_n),.d(d),.q(q));
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

