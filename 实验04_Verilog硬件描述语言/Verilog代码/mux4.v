module mux_4to1( //8bit 位宽的 4 选 1 选择器
    input [7:0] a,b,c,d,
	input [1:0] sel,
	output reg [7:0] o); //always 语句内赋值的信号都应定义成 reg 类型
	
	always@(*) //always 语句内实现组合逻辑
	begin
	    case(sel)
		    2’b00: o = a; //组合逻辑使用“=”进行赋值
			2’b01: o = b;
			2’b10: o = c;
			2’b11: o = d;
			default: o = 8’h0;//用 case 语句实现组合逻辑时一定要有 default
		endcase
	end
	
endmodule