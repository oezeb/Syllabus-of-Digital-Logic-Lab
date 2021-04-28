`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2020 22:07:20
// Design Name: 
// Module Name: count
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


module count(
input clk, start,
input [1:0] sw,
output reg [3:0]out,
output reg [2:0]an
    );
    wire start_edge;
    signal_edge signal_edge(.clk(clk),.button(start),.button_edge(start_edge));
    reg [7:0]tmp;
    wire clk_10mz;
    clk_wiz_0 clk_wiz(.clk_in1(clk),.reset(0),.clk_out1(clk_10mz));
    always@(posedge clk)
    begin
        if(sw[1]) tmp <= 8'h1f;
        else if(start_edge)
        begin
            if(sw) tmp <= tmp + 8'h1;
            else   tmp <= tmp - 8'h1;
        end
    end
    always@(*)
    begin
        if(clk_10mz)
        begin
            an <= 3'b0;
            out <= tmp[3:0];
        end
        else
        begin
            an <= 3'b1;
            out <= tmp[7:4];
        end
    end
endmodule
