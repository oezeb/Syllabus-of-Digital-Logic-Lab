`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2020 15:09:24
// Design Name: 
// Module Name: vga_contoller
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

module vga_ctrl(
    input clk,rst,//clk=65MHzz
    input [11:0] rd_data, //r[11:8],g[7:4],b[3:0]
    output reg h_de,v_de,//data_enable
    output reg hs,vs,
    output [11:0] vga_data
    );
    parameter H_CNT = 11'd1343; //136+160+1024+24=1344-1
    parameter V_CNT = 11'd805; //6+29+768+3=806-1
    
    reg [10:0] h_cnt,v_cnt;
    
    always@(posedge clk)
    begin
        if(rst)
            h_cnt <= 11'd0;
        else if(h_cnt>=11'd1343)
            h_cnt <= 11'd0;
        else
            h_cnt <= h_cnt + 11'd1;
    end
    always@(posedge clk)
    begin
        if(rst)
            v_cnt <= 11'd0;
        else if(h_cnt==11'd1343)
        begin
            if(v_cnt>=11'd805)
                v_cnt <= 11'd0;
            else
                v_cnt <= v_cnt + 11'd1;
        end
    end
    always@(posedge clk)
    begin
        if(rst)
            h_de <= 1'b0;
        else if((h_cnt>=296)&&(h_cnt<=1319))
            h_de <= 1'b1;
        else
            h_de <= 1'b0;
    end
    always@(posedge clk)
    begin
        if(rst)
            v_de <= 1'b0;
        else if((v_cnt>=35)&&(v_cnt<=802))
            v_de <= 1'b1;
        else
            v_de <= 1'b0;
    end
    always@(posedge clk)
    begin
        if(rst)
            hs <= 1'b1;
        else if(h_cnt<=11'd135)
            hs <= 1'b0;
        else
            hs <= 1'b1;
    end
    always@(posedge clk)
    begin
        if(rst)
 
            vs <= 1'b1;
        else if(v_cnt<=11'd5)
            vs <= 1'b0;
        else
            vs <= 1'b1;
    end
    assign vga_data = ((v_de==1)&&(h_de==1))? rd_data : 12'h0;
endmodule
