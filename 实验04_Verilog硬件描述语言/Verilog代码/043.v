//代码
module test(
    input [7:0] a,b,
	output [7:0] c,d,e,f,g,h,i,j,k );

    assign c = a & b;
	assign d = a | b;
	assign e = a ^ b;
	assign f = ~a;
	assign g = {a[3:0],b[3:0]};
	assign h = a >> 3;
	assign i = &b;
	assign j = (a > b) ? a : b;
	assign k = a - b;

endmodule

/*
当 a = 8'b0011_0011, b = 8'b1111_0000 时
c = 8'b11_0000
d = 8'b1111_0011
e = 8'b1100_0011
f = 8'b1100_1100
g = 8'b0011_0000
h = 8'b110
i = 8'b0
j = 8'b1111_0000
k = 8'b0100_0011
*/