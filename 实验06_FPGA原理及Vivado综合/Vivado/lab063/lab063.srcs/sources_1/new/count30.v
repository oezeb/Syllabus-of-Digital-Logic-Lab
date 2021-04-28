`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/20 11:55:22
// Design Name: 
// Module Name: count30
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


module count30(
    input clk,
    output reg [7:0] out
    );
    reg [29:0]tmp;
    always@(posedge clk)
    begin
        tmp = tmp + 30'b1;
        out = tmp[29:22];
    end
endmodule
