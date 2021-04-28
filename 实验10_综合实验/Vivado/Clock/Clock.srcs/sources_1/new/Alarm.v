`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2020 21:05:50
// Design Name: 
// Module Name: Alarm
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


module Alarm(
    input clk, rst,
    input button, sw1,
    input [7:0] curr_hour, curr_min, curr_sec,
    output reg [7:0] hour, min, sec,
    output confirmed,
    output [3:0] out,
    output [2:0] an
    );
    wire rst_edge, sw1_edge, button_edge;
    reg [7:0] in_blink,in1,in2;
    reg [2:0] an_blink, an1, an2;
    reg [1:0] sel; //blink : 0->disable, 1-> sec blink, 2->min blink, 3->h blink
    wire enable = |sel;
    
    signal_edge signal_edge0(.clk(clk),.button(rst),.button_edge(rst_edge));
    signal_edge signal_edge1(.clk(clk),.button(sw1),.button_edge(sw1_edge));
    signal_edge signal_edge2(.clk(clk),.button(button),.button_edge(button_edge));
    
    //display
   always@(clk)
    begin
        //copy current time
        if(rst_edge)
        begin
            hour <= curr_hour;
            min <= curr_min;
            sec <= curr_sec;
            sel <= 2'h1;
        end
        //setting time
        if(button_edge) in_blink <= in_blink + 8'h1;
         //change target
         if(sw1_edge)
             sel <= sel + 2'b1;
        case(sel)
            2'h0,2'h1 : begin
                in_blink <= sec;
                an_blink <= 3'h0;
                
                in1 <= min;
                an1 <= 3'h2;
                
                in2 <= hour;
                an2 <= 3'h4;
                end
            2'h2 : begin
                in_blink <= min;
                an_blink <= 3'h2;
                
                in1 <= sec;
                an1 <= 3'h0;
                
                in2 <= hour;
                an2 <= 3'h4;
                end
            2'h3 : begin
                in_blink <= hour;
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
        .out(out),.an(an)
        );
        
endmodule
