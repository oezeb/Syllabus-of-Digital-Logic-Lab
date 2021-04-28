`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.12.2020 03:11:17
// Design Name: 
// Module Name: rom
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


module rom(
input clk,
input [7:0]sw,
output reg [3:0]out,
output reg [2:0]an
    );
    wire clk_out1;
    wire [3:0]spo0,spo1;
    image_rom rom0(.a(sw[3:0]),.spo(spo0));
    image_rom rom1(.a(sw[7:4]),.spo(spo1));
    clk_10m clk_10m(.clk_in1(clk),.reset(1'b0),.clk_out1(clk_out1));
    always@(*)
    begin
        case(clk_out1)
        0:  begin
                an = 3'b0;
                out = spo0;
            end
        1:  begin
                an = 3'b1;
                out = spo1;
            end
        endcase
    end
endmodule
