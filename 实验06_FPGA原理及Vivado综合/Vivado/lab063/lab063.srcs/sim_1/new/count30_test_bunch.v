`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/20 12:01:20
// Design Name: 
// Module Name: count30_test_bunch
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


module count30_test_bunch( );
reg clk,rst;
wire [7:0] out;
count30 count(.clk(clk),.rst(rst),.out(out));
initial clk = 0;
always #5 clk = ~clk;
initial
begin
    rst = 1;
    #1 rst = 0;
    //#500;
    #200000 $finish;
end
endmodule
