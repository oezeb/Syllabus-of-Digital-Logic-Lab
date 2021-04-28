//需要补充代码
/*
module test(
input [4:0] a,
_____________);

    always@(*)
    b = a;
____________
*/
//补完代码
module test(
input [4:0] a,
output reg [4:0] b);

    always@(*)
	    b = a;

endmodule
