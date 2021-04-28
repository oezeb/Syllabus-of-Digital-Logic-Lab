module cnt_1to10(
    input clk,rst_n,
	output reg [3:0] cnt);
	
	always@(posedge clk or negedge rst_n)
	//时序控制条件为时钟上升沿和复位的下降沿
	begin
	    if(!rst_n) //复位信号优先级最高，应是第一个判断的条件
		    cnt <= 4’h1;
		else if(cnt>=10)
		    cnt <= 4’h1;
		else
			cnt <= cnt + 4’h1;
	end
	
endmodule


module decoder3(
    input [2:0] in,
    output reg [7:0] out
    );
    always@(in)
    begin
        out = 8'h0;
        case(in)
            3'b000: out[0]=1'b1;
            3'b001: out[1]=1'b1;
            3'b010: out[2]=1'b1;
            3'b011: out[3]=1'b1;
            3'b100: out[4]=1'b1;
            3'b101: out[5]=1'b1;
            3'b110: out[6]=1'b1;
            3'b111: out[7]=1'b1;
        endcase
    end;
endmodule

//test bunch
module decoder3_test_bunch( );
reg [2:0] in;
wire [7:0] out;
decoder3 decod(.in(in),.out(out));
initial
begin
    in = 3'h0;
    #5 in = 3'h1;
    #5 in = 3'h2;
    #5 in = 3'h3;
    #5 in = 3'h4;
    #5 in = 3'h5;
    #5 in = 3'h6;
    #5 in = 3'h7;
    #5 $finish;
end
endmodule