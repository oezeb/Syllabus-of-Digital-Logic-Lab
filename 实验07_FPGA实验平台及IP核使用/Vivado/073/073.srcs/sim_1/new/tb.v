`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.12.2020 16:31:47
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
reg clk,rst;
wire [7:0]tenth_sec,sec,min;
count_time c_time(.clk_100m(clk),.rst(rst),.tenth_sec(tenth_sec),.sec(sec),.min(min));
initial clk = 0;
always #1 clk = ~clk;
initial
begin
    rst = 1;
    #5 rst = 0;
    #13000 $finish;
end
endmodule
