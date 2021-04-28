`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 11:12:21
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


module test_bunch(

    );
    reg clk,rst;
    wire [3:0]count;
    wire pulse, led;
    clk_10 clk_10(.clk(clk),.rst(rst),.led(led),.count(count),.pulse(pulse));
    initial clk = 1'b0;
    always #5 clk = ~clk;
    initial 
    begin 
        rst = 1'b1;
        #6 rst = 1'b0;
        #1000 $finish;
    end
endmodule
