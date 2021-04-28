`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/17 18:57:07
// Design Name: 
// Module Name: decoder3_test_bunch
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


module decoder3_test_bunch( );
reg [2:0] in;
wire [7:0] out;
decoder3 decod(.in(in),.out(out));
initial
begin
    in = 3'h0;
    #5 in = 3'h1;
    #5 in = 3'h2;
    #5 in = 3'h3;
    #5 in = 3'h4;
    #5 in = 3'h5;
    #5 in = 3'h6;
    #5 in = 3'h7;
    #5 $finish;
end
endmodule

