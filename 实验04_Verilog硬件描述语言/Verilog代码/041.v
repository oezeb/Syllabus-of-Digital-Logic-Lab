//原代码
module test(
    input a,
    output b);
	
	if(a) b = 1’b0;
	else b = 1’b1;

endmodule

//修改后代码
module test(
    input a,
    output b);
	
	//if, else 不能直接在模块内部单独出现。一
	always @ (*)
	begin
	    if(a) b = 1’b0;
		else b = 1’b1
	end

endmodule