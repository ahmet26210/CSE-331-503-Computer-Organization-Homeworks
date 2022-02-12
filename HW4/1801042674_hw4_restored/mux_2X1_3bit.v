module mux_2X1_3bit (input [2:0] in1, input [2:0] in2, input s, output [2:0] out);
	mux_2X1 mux0 (out[0],in1[0], in2[0], s);
	mux_2X1 mux1 (out[1],in1[1], in2[1], s);
	mux_2X1 mux2 (out[2],in1[2], in2[2], s);
endmodule