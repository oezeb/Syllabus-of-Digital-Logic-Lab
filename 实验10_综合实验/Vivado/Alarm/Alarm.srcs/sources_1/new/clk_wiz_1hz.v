`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2020 21:09:52
// Design Name: 
// Module Name: clk_wiz_1hz
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


module clk_wiz_1hz(
    input clk_100mhz,
    output reg out
    );
    reg [27:0]count;
    always@(posedge clk_100mhz)
    begin
        if(count >= 28'd100_000_000)
        begin
            count <= 28'h0;
            out <= ~out;
        end
        else
            count <= count + 28'h1;
    end
endmodule

