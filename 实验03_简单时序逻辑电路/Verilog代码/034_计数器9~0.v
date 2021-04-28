module REG(
    input CLK,RST_N,
	output reg [3:0] CNT);
	
	always@(posedge CLK or negedge RST_N)
	begin
	if(RST_N==0 || CNT==4'b0 || CNT>4'b1001)
	    CNT <= 4'b1001;
	else
	    CNT <= CNT - 4'b1;
	end
	
endmodule


/*
//D flip flop with active low asynchronous set reset
module async_set_reset_dff (
    input clk, d, aset, areset;
	output reg out
);

    always @ (posedge clk or negedge aset or negedge areset)
	begin
	    if (aset == 0)
		    out <= 1′ b1;
		else if (areset == 0)
		    out <= 1′ b0;
		else
		    q <= d;
	end

endmodule

//register with a variable active low asynchrone reset value 
module REG(
    input clk, [3:0]in, areset, [3:0]value,
    output reg [3:0]out
);
    wire [3:0]w =  areset ? 4'b1 : value;;
	async_set_reset_dff dff0(.clk(clk),.d(in[0]),.aset(~(areset&w[0])),.areset(~areset|w[0]),.out(out[0]));
	async_set_reset_dff dff0(.clk(clk),.d(in[1]),.aset(~(areset&w[1])),.areset(~areset|w[1]),.out(out[1]));
	async_set_reset_dff dff0(.clk(clk),.d(in[2]),.aset(~(areset&w[2])),.areset(~areset|w[2]),.out(out[2]));
	async_set_reset_dff dff0(.clk(clk),.d(in[3]),.aset(~(areset&w[3])),.areset(~areset|w[3]),.out(out[3]));

endmodule
*/