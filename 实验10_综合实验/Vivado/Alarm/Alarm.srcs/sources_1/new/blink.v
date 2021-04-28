`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2020 21:08:28
// Design Name: 
// Module Name: blink
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

module blink(
    input clk, enable,
    input [7:0] in_blink, in1, in2,
    input [2:0] an_blink, an1, an2,
    output reg [3:0] out,
    output reg [2:0] an
    );
    wire clk_10mhz, clk_1hz;
    clk_wiz_10mhz clk_wiz_10mhz(.clk_in1(clk),.reset(0),.clk_out1(clk_10mhz));
    clk_wiz_1hz clk_wiz_1hz(.clk_100mhz(clk),.out(clk_1hz));
     
    reg [2:0]count;
    always@(posedge clk_10mhz)
    begin
        if(count >= 3'h5) count <= 3'h0;
        else count <= count + 3'h1;
    end
    
    always@(*)
    begin
        if(count == 3'h0 && (clk_1hz == 1'h1 ||  count == 3'h0 && enable == 1'h0))
        begin
            an <= an_blink;
            out <= in_blink[3:0];
        end
        else if(count == 3'h1 && (clk_1hz == 1'h1 || count == 3'h1 && enable == 1'h0))
        begin
            an <= an_blink + 3'h1;
            out <= in_blink[7:4];
        end
        else if(count == 3'h2)
        begin
                an <= an1;
                out <= in1[3:0];
        end
        else if(count == 3'h3)
        begin
            an <= an1 + 3'h1;
            out <= in1[7:4];
        end
        else if(count == 3'h4)
        begin
            an <= an2;
            out <= in2[3:0];
        end
        else
        begin
            an <= an2 + 3'h1;
            out <= in2[7:4];
        end
    end
endmodule