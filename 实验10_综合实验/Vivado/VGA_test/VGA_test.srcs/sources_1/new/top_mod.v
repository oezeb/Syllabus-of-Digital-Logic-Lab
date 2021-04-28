`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2020 15:12:47
// Design Name: 
// Module Name: top_mod
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
module top(
    input clk,rst,//[11:0] rd_data,
    output hs,vs,[11:0] vga_data
    );
    wire clk_65m, lock;
    reg [11:0] rd_data;
    wire h_de,v_de;//data_enable
    
    reg [10:0]xCount, yCount; 
    always@(posedge clk_65m)
    begin
        if(h_de == 1'h0)
            xCount <= 11'h0;
        else 
            xCount <= xCount + 11'h1;
    end
    always@(negedge h_de)
    begin
        if(v_de == 1'h0)
            yCount <= 11'h0;
        else 
            yCount <= yCount + 11'h1;
    end
    
    always@(posedge clk_65m)
    begin
        if(xCount >= 11'd462 && xCount <= 11'd562)
            rd_data <= 12'b1111;
        else
            rd_data <= 12'b11110000;
    end 
    
    clk_wiz_0 clk_wiz_0(
        .clk_in1 (clk),
        .clk_out1 (clk_65m),
        .reset (rst),
        .locked (lock)
        );
    vga_ctrl vga_ctrl(
        .clk (clk_65m),
        .rst (~lock),
        .rd_data (rd_data),
        .h_de(h_de),.v_de(v_de),
        .hs (hs),
        .vs (vs),
        .vga_data (vga_data)
        );
endmodule*/


