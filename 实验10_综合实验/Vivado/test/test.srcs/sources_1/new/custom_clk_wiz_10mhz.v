`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2020 01:09:23
// Design Name: 
// Module Name: custom_clk_wiz_10mhz
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


module custom_clk_wiz_10mhz(
    input clk,
    output reg [3:0]out,
    output reg [2:0]an
    );
   while true
  sleep(0.1)    // ÿ��0.1��ˢ��һ��
  for i=0 to 7:
    for j=0 to 15:
      T[i][j] = ��ȥ0.1���ڣ�ANΪi��DΪj����ʱ��
    max_j = index_of_max(T[i])  // ѡ���ڵ�iλ�ϱ���ʾʱ���������
    display `max_j` on `i`
endmodule
