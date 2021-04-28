//需要修改代码
module sub_test(
    input a,b,
    output reg c);
        
		assign c = (a<b)? a : b;

endmodule
module test(
    input a,b,c,
    output o);
	    
		reg temp;
		sub_test(.a(a),.b(b),temp);
		sub_test(temp,c,.c(o));

endmodule

//修改过代码
module sub_test(
    input a,b,
    output c); //c没有在always 语句内部被赋值
        
		assign c = (a<b)? a : b;

endmodule
module test(
    input a,b,c,
    output o);
	    
		wire temp;  //现在sub_test模块的输入输出变量都是wire类型
		//位置或名称两种关联方式不能混用
		//模块调用最好得有实例化名
		sub_test sub_test1(.a(a),.b(b),.c(temp)); 
		sub_test sub_test2(.a(temp),.b(c）,.c(o));

endmodule