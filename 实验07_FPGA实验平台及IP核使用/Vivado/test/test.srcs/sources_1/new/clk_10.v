`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 10:58:12
// Design Name: 
// Module Name: clk_10
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


module clk_10(
    input clk,
    input rst,
    output reg led,
    output reg [3:0]count,
    output pulse
    );
    always@(posedge clk)
    begin
        if(rst || count >= 4'h9) 
            count <= 4'h0;
        else 
            count <= count + 4'h1;
    end
    assign pulse = (count == 4'h1);
    always@(posedge clk)
    begin
        if(rst)
            led <= 1'b0;
        else if(pulse) 
            led <= ~led;
    end
endmodule
