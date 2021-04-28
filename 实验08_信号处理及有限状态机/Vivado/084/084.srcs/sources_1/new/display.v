`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2020 17:17:29
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
    input clk, rst, start, input sw,
    output reg [3:0] out,
    output reg [2:0] an
    );
    wire [3:0] curr_state, count, last;
    counter c(.clk(clk),
            .rst(rst),
            .start(start),
            .sw(sw),
            .curr_state(curr_state),
            .count(count),
            .last(last)
            );
    wire clk_out1;
    clk_wiz_0 clk_wiz_0(.clk_in1(clk),.reset(0),.clk_out1(clk_out1));
    reg [2:0] tmp;
    always@(posedge clk_out1)
    begin
        if(tmp >= 3'h5) tmp <= 3'h0;
        else    tmp <= tmp + 3'h1;
    end
    always@(*)
    begin
        case(tmp)
            3'h0: begin
                      an <= 3'h0;
                      out <= curr_state;
                  end
            3'h1: begin
                      an <= 3'h2;
                      out <= count;
                  end
            3'h2: begin
                      an <= 3'h4;
                      out <= {3'h0,last[0]};
                  end
            3'h3: begin
                      an <= 3'h5;
                      out <= {3'h0,last[1]};
                  end
            3'h4: begin
                      an <= 3'h6;
                      out <= {3'h0,last[2]};
                  end
            3'h5: begin
                      an <= 3'h7;
                      out <= {3'h0,last[3]};
                  end
        endcase
    end
endmodule
