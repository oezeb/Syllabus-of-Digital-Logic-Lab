`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2020 00:25:18
// Design Name: 
// Module Name: solution
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


module solution(
    input clk, button,
    input [7:0] sw, [7:0] led,
    output reg [3:0] out,
    output reg [2:0] an
    );
    wire [7:0] clock_hour, clock_min, clock_sec;
    wire [7:0] alarm_hour, alarm_min, alarm_sec;
    wire [3:0] clock_out, alarm_out;
    wire [2:0] clock_an, alarm_an;
    reg alarm_rst = 1'b0;
    
    clock clock(
        .clk(clk),
        .hour(clock_hour),.min(clock_min),.sec(clock_sec),
        .out(clock_out),.an(clock_an)
        );
    
    Alarm alarm(
        .clk(clk), .rst(alarm_rst), .button(button), .sw1(sw[1]),
        .curr_hour(clock_hour), .curr_min(clock_min), .curr_sec(clock_sec),
        .hour(alarm_hour), .min(alarm_min), .sec(alarm_sec),
        .confirmed(confirmed),
        .out(alarm_out),.an(alarm_an)
    );
    
    always@(posedge clk)
    begin
        alarm_rst <= sw[0];
            out <= alarm_out;
            an <= alarm_an;
        /*if(clock_sec >= 8'h5)
        begin
        end
        else
        begin
            out <= clock_out;
            an <= clock_an;
        end*/
    end
    /*assign led = 8'h0;
    reg [7:0] hour, min, sec;
    wire [7:0] c_hour, c_min, c_sec;
    wire [7:0] a_hour, a_min, a_sec;
    wire sel = 1'h1;
    wire confirmed;
    
    always@(*)
    begin
        if(c_sec <= 8'h5 || c_sec > 8'ha)
        begin
            hour <= c_hour;
            min <= c_min;
            sec <= c_sec;
        end
        else 
        begin
            hour <= a_hour;
            min <= a_min;
            sec <= a_sec;
        end
    end
            
    
    blink blink(
        .clk(clk),.enable(1'b0),
        .in_blink(sec),.in1(min),.in2(hour),
        .an_blink(3'h0),.an1(3'h2),.an2(3'h4),
        .out(out),.an(an)
        );
        
   
    
    clock clock(
        .clk(clk),//.button(button),
        .hour(c_hour),.min(c_min),.sec(c_sec)
        );
        */
endmodule
