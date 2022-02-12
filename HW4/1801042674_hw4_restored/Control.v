module Control(input [3:0] opcode, output [2:0] ALUOp, output RegDst, output AluSrc, output MemtoReg, output RegWrite, output MemRead,
					output MemWrite, output Branch, output BranchNot);
					
wire Rtype,Addi,Andi,ori,nori,beq,bne,slti,lw,sw;
wire opcodenot0,opcodenot1,opcodenot2,opcodenot3;
not a1(opcodenot0,opcode[0]);
not a2(opcodenot1,opcode[1]);
not a3(opcodenot2,opcode[2]);
not a4(opcodenot3,opcode[3]);
and a5(Rtype,opcodenot3,opcodenot2,opcodenot1,opcodenot0);
and a6(Addi,opcodenot3,opcodenot2,opcodenot1,opcode[0]);
and a7(Andi,opcodenot3,opcodenot2,opcode[1],opcodenot0);
and a8(ori,opcodenot3,opcodenot2,opcode[1],opcode[0]);
and a9(nori,opcodenot3,opcode[2],opcodenot1,opcodenot0);
and a10(beq,opcodenot3,opcode[2],opcodenot1,opcode[0]);
and a11(bne,opcodenot3,opcode[2],opcode[1],opcodenot0);
and a12(slti,opcodenot3,opcode[2],opcode[1],opcode[0]);
and a13(lw,opcode[3],opcodenot2,opcodenot1,opcodenot0);
and a14(sw,opcode[3],opcodenot2,opcodenot1,opcode[0]);

and   a15(RegDst,Rtype,1); 					
or		a16(AluSrc,Addi,Andi,ori,nori,slti,lw,sw);					
and	a17(MemtoReg,lw,1);
or		a18(RegWrite,Rtype,Addi,Andi,ori,nori,slti,lw);
and	a19(MemRead,lw,1);
and	a20(MemWrite,sw,1);
or		a21(Branch,beq,bne);
and	a22(BranchNot,bne,1);
or    a23(ALUOp[2],Andi,ori,nori,slti);
or    a24(ALUOp[1],Rtype,Andi,ori);
or    a25(ALUOp[0],Rtype,ori,nori,beq,bne);
			
endmodule
