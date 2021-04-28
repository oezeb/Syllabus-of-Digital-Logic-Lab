`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2020 19:49:53
// Design Name: 
// Module Name: test
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


module test(
    input clk,rx,
    output reg [4:0] led
    ); 
    wire rx_vld;
    wire [7:0] rx_data;
    rx rx1(.clk(clk),.rst(0),.rx(rx),.rx_vld(rx_vld),.rx_data(rx_data));  
    
    always@(clk)
    begin
        if (rx_vld)
        begin
            case(rx_data)
              8'h1D: led[0] <= 1'h1;
              8'h1C: led[1] <= 1'h1;
              8'h1B: led[2] <= 1'h1;
              8'h23: led[3] <= 1'h1;
              default: led[4] <= 1'h1;
            endcase 
        end
    end
endmodule
