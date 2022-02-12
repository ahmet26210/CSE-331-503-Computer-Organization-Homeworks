module ALU_control(input [2:0] ALUOp, input [2:0] funcfield, output [2:0] ALUControlOp);
	wire ALUOp2n, ALUOp1n,ALUOp0n,f2n,f1n,f0n, res1, res2, res3, res4, res5,res6, res7, res8,res9,res10;
	not a1(ALUOp2n,ALUOp[2]);
	not a2(ALUOp1n,ALUOp[1]);
	not a3(ALUOp0n,ALUOp[0]);
	
	not a17(f2n,funcfield[2]);
	not a19(f1n,funcfield[1]);
	not a20(f0n,funcfield[0]);
	
	and a4(res1,ALUOp2n,ALUOp[1],funcfield[2]);
	and a5(res2,ALUOp2n,ALUOp[1],funcfield[1],funcfield[0]);
	and a6(res3,ALUOp[2],ALUOp[0]);
	or a7(ALUControlOp[0],res1,res2,res3);
	
	and a8(res4,ALUOp2n,ALUOp[1],f2n,f0n);
	and a9(res5,ALUOp2n,ALUOp[1],funcfield[2],funcfield[0]);
	and a10(res6,ALUOp[2],ALUOp[1]);
	and a21(res10,ALUOp2n,ALUOp1n,ALUOp[0]);
	or a11(ALUControlOp[1],res4,res5,res6,res10);
	
	and a12(res7,ALUOp2n,ALUOp[1],funcfield[2]);
	and a13(res8,ALUOp2n,ALUOp[1],f2n,f1n,f0n);
	and a14(res9,ALUOp[2]);
	or a15(ALUControlOp[2],res7,res8,res9);
	
endmodule
