`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.12.2020 13:37:01
// Design Name: 
// Module Name: pulse_wiz_1hz
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


module pulse_wiz_1hz(
    input clk,
    output reg out
    );
    reg [27:0]count;
    always@(posedge clk)
    begin
        if(count >= 28'd49_999_999)
        begin
            count <= 28'h0;
            out <= 1'h1;
        end
        else
        begin
            count <= count + 28'h1;
            out <= 1'h0;
        end
    end
endmodule
