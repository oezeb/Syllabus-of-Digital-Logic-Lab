`timescale 1ns / 1ps
module tb(  );
reg clk,rst;
initial
begin
    clk = 0;
    forever
    #5 clk = ~clk;
end
initial
begin
    rst = 1;
    #100 rst = 0;
end
lab07_cnt    test(
.clk    (clk),
.rst    (rst),
.led    ( ));
endmodule
