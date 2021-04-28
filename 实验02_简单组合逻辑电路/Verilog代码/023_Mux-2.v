module Mux_2 (
	input a,
	input b,
	input sel,
	output out
);

	assign out = (sel & b) | (~sel & a);
	
endmodule