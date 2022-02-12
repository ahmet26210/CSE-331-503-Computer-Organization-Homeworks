module _32bit_slt (result,S,C,A,B,C0);
input [31:0] A,B;
input C0;
input C;
output [31:0] S;
output [31:0] result;
wire result1;
_32bit_sub sltModule (S[31:0],C,A[31:0],B[31:0],C0);


or (result1 ,0,S[31]);	

genvar i;

	generate
	
		for (i = 0; i < 32; i = i + 1) begin:Ahmet
			or andGate1 (result[i],result1,0);
		end
	endgenerate


endmodule