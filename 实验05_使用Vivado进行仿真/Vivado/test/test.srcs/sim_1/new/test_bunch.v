`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/17 18:34:58
// Design Name: 
// Module Name: test_bunch
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


module test_bunch(

    );
endmodule
module test_bunch(

    );
reg [3:0] a,b,c,d;
reg [1:0] sel;
wire [3:0] out;
test test(.a(a),.b(b), .c(c), .d(d), .sel(sel), .out(out));
initial
begin
        a = 4'h1; b = 4'h5; c = 4'h8; d = 4'hF; sel = 2'h0;
   #20  a = 4'h1; b = 4'h5; c = 4'h8; d = 4'hF; sel = 2'h1;
   #20  a = 4'h1; b = 4'h5; c = 4'h8; d = 4'hF; sel = 2'h2;
   #20  a = 4'h1; b = 4'h5; c = 4'h8; d = 4'hF; sel = 2'h3;
   #20  a = 4'h1; b = 4'h5; c = 4'h8; d = 4'hF; sel = 2'h3;
   #20 $finish;
end
endmodule
