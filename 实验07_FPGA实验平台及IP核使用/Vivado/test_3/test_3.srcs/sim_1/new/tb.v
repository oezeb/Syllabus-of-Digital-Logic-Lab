`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.12.2020 00:04:00
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


module tb( );
reg [3:0] dpra;
wire [2:0] dpo;
reg clk;
reg we;
reg [3:0] a;
reg [2:0] d;
initial
begin
   clk = 0;
   forever
   #5 clk = ~clk;
end
initial
begin
   a = 0;dpra=0;d=0;we=0;
   #20
   repeat(5)
   begin
      @(posedge clk); #1;
      dpra = dpra +1;
   end
   repeat(10)
   begin
      @(posedge clk); #1;
      a = $random%16;
      dpra = $random%16;
      d = $random%8;
      we = $random%2;
   end
   @(posedge clk); #1;
   a = 0;
   dpra = 0;
   d = 0;
   we = 0;
   #20 $stop;
end
dist_mem_gen_0 dist_mem_gen_0(
.a (a),
.d (d),
.dpra (dpra),
.clk (clk),
.we (we),
.dpo (dpo));
endmodule
