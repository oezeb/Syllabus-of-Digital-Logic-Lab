`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2020 20:04:37
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
    input clk, in, button,
    output reg[3:0] bus,tmp,
    output button_edge
    );
    //signal_edge s(.clk(clk),.button(button),.button_edge(button_edge));
    always@(posedge button_edge)
    begin
            tmp <= {in,bus[3:1]};
            bus <= tmp;
    end
endmodule
