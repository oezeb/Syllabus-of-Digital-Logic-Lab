`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.12.2020 18:38:56
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
    input rst,
    output reg [3:0] out,
    output reg [2:0] an
    );
    
   
    //create 10mhz clk
    wire clk_out1;
    clk_10m clk_10m(
        .clk_in1(clk),
        .reset(rst),
        .clk_out1(clk_out1)
        );
    //get time(min,sec,...)
    wire [3:0]tenth,sec,ten_sec,min;
    count_time count_time(
        .clk_10m(clk_out1),
        .rst(rst),.tenth(tenth),
        .sec(sec),.ten_sec(ten_sec),
        .min(min)
        );
     //display
    reg [1:0]count;
    always@(posedge clk_out1)
    begin
        if(rst) count <= 2'b0;
        else count <= count + 2'b1;
    end
    always@(*)
    begin
        case(count)
        2'h0:begin
                an <= 3'h0;
                out <= tenth;
             end
        2'h1:begin
                an <= 3'h1;
                out <= sec;
            end
        2'h2:begin
                an <= 3'h2;
                out <= ten_sec;
            end
        2'h3:begin
                an <= 3'h3;
                out <= min;
            end
        endcase
    end
endmodule
