`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2020 01:40:08
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input rst,
    input start,
    input sw,
    output reg [3:0] curr_state,count,last
    );
    parameter [3:0]STATE_0 = 4'h0,
                     STATE_1 = 4'h1,
                     STATE_2 = 4'h2,
                     STATE_3 = 4'h3,
                     STATE_4 = 4'h4;
    reg [3:0] next_state, last_tmp;
    wire start_edge;
    signal_edge s(.clk(clk),.button(start),.button_edge(start_edge));
    always@(*)
    begin
        if(start_edge)
        begin
            case(curr_state)
              STATE_0: begin
                           if(sw) next_state <= STATE_1;
                           else   next_state <= curr_state;
                       end
              STATE_1: begin
                           if(sw) next_state <= STATE_2;
                           else   next_state <= STATE_0;
                       end
              STATE_2: begin
                           if(sw) next_state <= curr_state;
                           else   next_state <= STATE_3;
                       end
              STATE_3: begin
                           if(sw) next_state <= STATE_1;
                           else   next_state <= STATE_4;
                       end
              STATE_4: begin
                           if(sw) next_state <= STATE_1;
                           else   next_state <= STATE_0;
                       end
              default: next_state <= STATE_0;
            endcase
        end//if start_edge
        else next_state <= curr_state;
    end
    reg once1; //use once to make sure a task just run only once
    always@(posedge clk or posedge rst)
    begin
        if(rst) last <= 4'h0;
        else if(start_edge)
        begin
            if(once1)
            begin
                //save last inputs
                last <= {sw,last_tmp[3:1]};
                once1 <= 1'b0;
            end
        end
        else 
        begin
            once1 <= 1'b1;
            last_tmp <= last;
        end
    end
    always@(posedge clk or posedge rst)
    begin
        if(rst) curr_state <= STATE_0;
        else curr_state <= next_state;
    end
    reg once2;
    always@(posedge clk)
    begin
        if(rst) count <= 4'h0;
        else if(curr_state==STATE_4)
        begin
            if(once2 )
            begin
                count <= count + 4'b1;
                once2 <= 1'b0;
            end
        end
        else once2 <= 1'b1;
    end    
endmodule
