//需要修改代码
module sub_test(
    input a,b);
	output o;
	
	assign o = a + b;

endmodule
module test(
    input a,b,
	output c); 
	
	always@(*)
	begin
	sub_test sub_test(a,b,c);
	end

endmodule

//修改过代码
module sub_test(
    input a,b
	output o);//output一般用在模块的端口定义部分。
	
	assign o = a + b;

endmodule
module test(
    input a,b,
	output c); 
	
	//always@(*) 这没意义
	sub_test sub_test(a,b,c);

endmodule


