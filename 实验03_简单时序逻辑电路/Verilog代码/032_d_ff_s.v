module d_ff_s(
input clk,st_n,d,
output reg q);
    always@(posedge clk)
	begin
	    if(st_n==1)
		    q <= 1’b1;
		else
		    q <= d;
	end
endmodule