`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2020 23:19:27
// Design Name: 
// Module Name: clock
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

/*

    input clk, button,
    input  [7:0] led, sw,
    output [3:0] out,
    output [2:0] an
    */
module clock(
    input clk,
    output reg [7:0] hour,min,sec,
    output [3:0] out,
    output [2:0] an
    );
    wire pulse_1hz;
    pulse_wiz_1hz pulse_wiz_1hz(.clk(clk),.out(pulse_1hz));
    
    always@(posedge pulse_1hz)
    begin
        //handle sec
        if(sec >= 8'h59) 
        begin
            sec <= 8'h0;
            min <= min + 8'h1;
        end
        else if(sec[3:0] >= 8'h9)
        begin
            sec[3:0] <= 4'h0;
            sec[7:4] <= sec[7:4] + 4'h1;
        end
        else
            sec <= sec + 8'h1;
            
        //handle min
        if(min >= 8'h59)
        begin
            min <= 8'h0;
            hour <= hour + 8'h1;
        end
        else if(min[3:0] >= 8'h9)
        begin
            min[3:0] <= 4'h0;
            min[7:4] <= min[7:4] + 4'h1;
        end
        
        //handle hour
        if(hour >= 8'h24)
        begin
            hour <= 8'h0;
        end
        else if(hour[3:0] >= 8'h9)
        begin
            hour[3:0] <= 4'h0;
            hour[7:4] <= hour[7:4] + 4'h1;
        end
    end
    
    //display
    blink blink(
        .clk(clk),.enable(1'b0),
        .in_blink(sec),.in1(min),.in2(hour),
        .an_blink(3'h0),.an1(3'h2),.an2(3'h4),
        .out(out),.an(an)
        );
endmodule
