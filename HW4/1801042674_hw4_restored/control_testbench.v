`define DELAY 20

module control_testbench();

reg [3:0] opcode;
wire MemRead, MemToReg, MemWrite, RegWrite,RegDst,AluSrc,Branch,BranchNot;

wire [2:0] ALUOp;
Control control_module(opcode,ALUOp,RegDst,AluSrc,MemToReg,RegWrite,MemRead,
					MemWrite,Branch,BranchNot);

initial begin
opcode = 4'b0000;
#`DELAY;
opcode = 4'b0001;
#`DELAY;
opcode = 4'b0010;
#`DELAY;
opcode = 4'b0011;
#`DELAY;
opcode = 4'b0100;
#`DELAY;
opcode = 4'b0101;
#`DELAY;
opcode = 4'b0110;
#`DELAY;
opcode = 4'b0111;
#`DELAY;
opcode = 4'b1000;
#`DELAY;
opcode = 4'b1001;
#`DELAY;
end
 
 
initial
begin

$monitor("opcode=%x, MemRead=%b, MemToReg=%b, MemWrite=%b, RegWrite=%b, AluOp=%x,RegDst=%b,AluSrc=%b,Branch=%b,BranchNot=%b"
, opcode,MemRead, MemToReg, MemWrite, RegWrite,ALUOp,RegDst,AluSrc,Branch,BranchNot);

end

endmodule