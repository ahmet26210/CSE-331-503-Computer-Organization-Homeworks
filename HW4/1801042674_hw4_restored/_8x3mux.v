module _8x3mux(sum,a,b,select);
output [31:0] sum;
input [31:0] a,b;
input [2:0] select;
wire [31:0] F1,F2,F3,F4,F5,F6,F7,F8;
wire  [31:0] A1,B1,C1,D1,E1,I1,G1,H1,A11,B11,C11,D11,E11,I11,G11,H11;
wire carry_out;
wire carry_in,carry_in1;
wire [31:0] result;
genvar i;

or (carry_in ,0,0);
or (carry_in1 ,1,1);

_32bit_adder g1(F1,carry_out,a,b,carry_in);
generate	
		for (i = 0; i < 32; i = i + 1) begin:Ahmet3
			or g2(A1[i],F1[i],0);
		end
endgenerate	


_32bit_xor g3(F2,a,b);
generate	
		for (i = 0; i < 32; i = i + 1) begin:Ahmet4
			or g4(B1[i],F2[i],0);
		end
endgenerate


_32bit_sub g5(F3,carry_out,a,b,carry_in1);
generate	
		for (i = 0; i < 32; i = i + 1) begin:Ahmet5
			or g6(C1[i],F3[i],0);
		end
endgenerate



_32bit_or g7(F4,a,b);
generate	
		for (i = 0; i < 32; i = i + 1) begin:Ahmet6
			or g8(D1[i],F4[i],0);
		end
endgenerate


_32bit_slt g9(result,F5,carry_out,a,b,carry_in);
generate	
		for (i = 0; i < 32; i = i + 1) begin:Ahmet7
			or g10(E1[i],result[i],0);
		end
endgenerate

	
_32bit_nor g11(F6,a,b);
generate	
		for (i = 0; i < 32; i = i + 1) begin:Ahmet8
			or g12(I1[i],F6[i],0);
		end
endgenerate


_32bit_and g13(F7,a,b);
generate	
		for (i = 0; i < 32; i = i + 1) begin:Ahmet9
			and g14(G1[i],F7[i],1);
		end
endgenerate


_32bit_or g15(F8,a,b);
generate	
		for (i = 0; i < 32; i = i + 1) begin:Ahmet10
			or g16(H1[i],F8[i],0);
		end
endgenerate


//sum=A1S0'S1'S2'+B1S0'S1'S2+C1S0'S1S2'+D1S0'S1S2+E1S0S1'S2'+I1S0S1'S2+G1S0S1S2'+H1S0S1S2;

wire s0,s1,s2;
wire s0not,s1not,s2not;

or g17(s0,select[2],0);
or g18(s1,select[1],0);
or g19(s2,select[0],0);

not g20(s0not,s0);
not g21(s1not,s1);
not g22(s2not,s2);

generate
	
		for (i = 0; i < 32; i = i + 1) begin:Ahmet1
			and g23(A11[i],A1[i],s0not,s1not,s2not);
			and g24(B11[i],B1[i],s0not,s1not,s2);
			and g25(C11[i],C1[i],s0not,s1,s2not);
			and g26(D11[i],D1[i],s0,s1,s2);
			and g27(E11[i],E1[i],s0,s1not,s2not);
			and g28(I11[i],I1[i],s0,s1not,s2);
			and g29(G11[i],G1[i],s0,s1,s2not);
			and g30(H11[i],H1[i],s0,s1,s2);
		end
endgenerate	
	
generate	
		for (i = 0; i < 32; i = i + 1) begin:Ahmet2
			or g31 (sum[i],A11[i],B11[i],C11[i],D11[i],E11[i],I11[i],G11[i],H11[i]);
		end
endgenerate	

endmodule
