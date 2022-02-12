module _32bit_sub (S,C,A,B,C0);
input [31:0] A,B;
input C0;
output C;
output [31:0] S;
wire select=1'b1;

wire [31:0] tempSub;

genvar i;

	generate
	
		for (i = 0; i < 32; i = i + 1) begin:Ahmet
			xor xorGate1 (	tempSub[i],B[i],select);
		end
	endgenerate

_32bit_adder subModule (S[31:0],C,A[31:0],tempSub[31:0],C0);

endmodule