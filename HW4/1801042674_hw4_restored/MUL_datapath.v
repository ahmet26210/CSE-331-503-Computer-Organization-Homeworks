module MUL_datapath(result,Product,multiplicand,write,shift,less32,i);
input [31:0] multiplicand;
input write ,shift,less32,i;
input [63:0] Product;
output result;
wire carry_out1;
wire [63:0] TempProduct,Msb32bitProduct,AddResult,shiftrightArray,AdderResult;
wire notwrite,notshift,notless32;
wire [31:0] result1,result2,result3,result4;
genvar j;

	generate
	
		for (j = 0; j < 64; j = j + 1) begin:Ahmet
			or andGate1 (TempProduct[j],Product[j],0);
		end
	endgenerate

generate
	
		for (j = 32; j < 64; j = j + 1) begin:Ahmet1
			or andGate2 (Msb32bitProduct[j],Product[j],0);
		end
	endgenerate

	ADD add(Msb32bitProduct,Msb32bitProduct,multiplicand);
	
	not a1(notwrite,write);
	
	generate
	
		for (j =0 ; j < 32; j = j + 1) begin:Ahmet2
			and andGate3 (result1[j],Msb32bitProduct[j],write);
		end
	endgenerate
	
	generate
	
		for (j =0; j < 32; j = j + 1) begin:Ahmet3
			and andGate4 (result2[j],Product[j],notwrite);
		end
	endgenerate
	
	generate
	
		for (j =0; j < 64; j = j + 1) begin:Ahmet9
			or a2(AdderResult , result1,result2);
		end
	endgenerate
	
	
	generate
	
		for (j =0; j < 64; j = j + 1) begin:Ahmet4
			or andGate4 (shiftrightArray[j],AdderResult[j],0);
		end
	endgenerate
	
	
	generate
	
		for (j =1; j < 63; j = j + 1) begin:Ahmet5
			or andGate5 (AdderResult[j-1],AdderResult[j],0);
		end
	endgenerate
	
	

	and a3 (AdderResult[63],AdderResult[0],0);
	
	
	not a4(notshift,shift);
	
	generate
	
		for (j =0 ; j < 64; j = j + 1) begin:Ahmet6
			and andGate3 (result3[j],AdderResult[j],shift);
		end
	endgenerate
	
	generate
	
		for (j =0; j < 32; j = j + 1) begin:Ahmet7
			and andGate4 (result4[j],shiftrightArray[j],notshift);
		end
	endgenerate
	
	
	generate
	
		for (j =0; j < 64; j = j + 1) begin:Ahmet10
			or a5(result , result3,result4);
		end
	endgenerate
	
	
	
	full_adder FA0(i, carry_out1,i, 1, 0);
endmodule


module ADD (out,in1,in2);
input [31:0] in1,in2;
output reg [31:0] out;
wire carry_in,carry_out;
or (carry_in ,0,0);

_32bit_adder g1(out,carry_out,in1,in2,carry_in);
        
endmodule
