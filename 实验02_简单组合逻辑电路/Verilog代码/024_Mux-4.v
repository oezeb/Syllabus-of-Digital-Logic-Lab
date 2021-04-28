module Mux_2 (
	input a,
	input b,
	input sel,
	output out
);

	assign out = (sel & b) | (~sel & a);
	
endmodule

module Mux_4( 
    input a, b, c, d,
    input sel0, sel1,
    output out );
    
	wire w1,w2;
    Mux_2 mux1(.a(a),.b(c),.sel(sel1),.out(w1));
	Mux_2 mux2(.a(b),.b(d),.sel(sel1),.out(w2));
	Mux_2 mux3(.a(w1),.b(w2),.sel(sel0),.out(out));

endmodule