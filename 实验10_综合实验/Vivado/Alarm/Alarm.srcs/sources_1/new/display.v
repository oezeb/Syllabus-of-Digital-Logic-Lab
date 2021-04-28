`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2020 21:07:08
// Design Name: 
// Module Name: display
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


module display(
    input clk,
    input [7:0] h, min, sec,
    input [1:0] sel, //0->disable, 1-> sec blink, 2->min blink, 3->h blink
    output [3:0] out,
    output [2:0] an
    );
    reg [7:0] in_blink,in1,in2;
    reg [2:0] an_blink, an1, an2;
    wire enable = |sel;
  
   always@(*)
    begin
        case(sel)
            2'h0,2'h1 : begin
                in_blink <= sec;
                an_blink <= 3'h0;
                
                in1 <= min;
                an1 <= 3'h2;
                
                in2 <= h;
                an2 <= 3'h4;
                end
            2'h2 : begin
                in_blink <= min;
                an_blink <= 3'h2;
                
                in1 <= sec;
                an1 <= 3'h0;
                
                in2 <= h;
                an2 <= 3'h4;
                end
            2'h3 : begin
                in_blink <= h;
                an_blink <= 3'h4;
                
                in1 <= sec;
                an1 <= 3'h0;
                
                in2 <= min;
                an2 <= 3'h2;
                end
        endcase
    end
        
    blink blink(
        .clk(clk),
        .enable(enable),
        .in_blink(in_blink),.in1(in1),.in2(in2),
        .an_blink(an_blink),.an1(an1),.an2(an2),
        .out(out),.an(an));
endmodule

