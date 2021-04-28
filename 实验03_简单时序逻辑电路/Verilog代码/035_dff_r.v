module d_ff_r(
    input clk,rst,d,
	output reg q
	);
	
	always@(posedge clk)
	begin
	    if(rst==1)
		    q <= 1’b0;
		else
		    q <= d;
	end
	
endmodule

module test(
    input a,b,clk,
	output o);
    //code
endmodule
module test(
    input wire a,b,clk,
	output reg o);
	
	always@( posedge clk )
	case({a,b})
	    2’b00: o <= 1’b0;
		2’b01: o <= 1’b0;
		2’b10: o <= 1’b0;
		2’b11: o <= 1’b1;
	endcase

endmodule
module test(
    input wire a,b,
	output reg o
	);
	
	wire s;
	assign s = a & b;
	always@( * ) o = s;

endmodule

