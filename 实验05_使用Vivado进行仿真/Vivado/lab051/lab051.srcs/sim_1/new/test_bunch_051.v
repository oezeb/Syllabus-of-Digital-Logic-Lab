`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/17 18:43:12
// Design Name: 
// Module Name: test_bunch_051
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

module test_bunch_051( );
reg a,b;
initial 
begin
    a = 1;
    b = 0;
    #100 b=1;
    #100 a=0;
    #75 b=0;
    #75 b=1;
    #50 $finish;
end
endmodule

