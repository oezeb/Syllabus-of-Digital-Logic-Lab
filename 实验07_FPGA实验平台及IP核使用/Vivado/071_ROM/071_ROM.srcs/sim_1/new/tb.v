`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.12.2020 02:22:00
// Design Name: 
// Module Name: tb
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


module tb();
reg [3:0]a;
wire [7:0]spo;
initial
begin
   a = 4'h0;
   #5 a = 4'h1;   
   #5 a = 4'h2;   
   #5 a = 4'h3;   
   #5 a = 4'h4;   
   #5 a = 4'h5;   
   #5 a = 4'h6;   
   #5 a = 4'h7;   
   #5 a = 4'h8;   
   #5 a = 4'h9;   
   #5 a = 4'ha;   
   #5 a = 4'hb;   
   #5 a = 4'hc;   
   #5 a = 4'hd;   
   #5 a = 4'he;   
   #5 a = 4'hf;
   #5 $finish;   
end
image_rom rom(.a(a),.spo(spo));
endmodule
