module MiniMIPS(clk,PC,instruction, result);

input [15:0] instruction;
output [31:0] result;
wire [2:0] ALUOp,bus_mux0_out;
input clk;
input [5:0] PC; // Program Counter.
wire [31:0] read_data_1, read_data_2,bus_mux4_out,ALU_Result,DataMemory_Result;
wire bus_RegDst, bus_Branch, bus_MemRead, bus_MemToReg, bus_MemWrite, bus_ALUSrc, bus_RegWrite, bus_BranchNot;
wire [31:0] read_data, memory_result; // memory read data.
wire [31:0] bus_sign_extender_out;
wire [2:0] bus_ALUcontrol_out;
wire [31:0] write_data;
genvar i;

Control control_module(instruction[15:12],ALUOp,bus_RegDst,bus_ALUSrc,bus_MemToReg,bus_RegWrite,bus_MemRead,
					bus_MemWrite,bus_Branch,bus_BranchNot);
					
mux_2X1_3bit mux0(instruction[5:3],instruction[8:6], bus_RegDst, bus_mux0_out);

sign_extend sign_extender(instruction[5:0], bus_sign_extender_out);

mips_registers reg_mem(read_data_1, read_data_2,write_data, 
instruction[11:9], instruction[8:6],bus_mux0_out,bus_RegWrite,clk);


mux_2X1_32bit mux4(bus_mux4_out,bus_sign_extender_out,read_data_2,bus_ALUSrc);
	
ALU_control ALUcontrol(ALUOp, instruction[2:0], bus_ALUcontrol_out);
	
_8x3mux ALU(ALU_Result,read_data_1, bus_mux4_out, bus_ALUcontrol_out);
	
data_memory data_memory(clk,ALU_Result,read_data_2,bus_MemRead,bus_MemWrite,DataMemory_Result);
	
mux_2X1_32bit mux6(write_data,DataMemory_Result,ALU_Result, bus_MemToReg);

generate	
		for (i = 0; i < 32; i = i + 1) begin:LOOP1
			and result1 (result[i],write_data[i],1);
		end
endgenerate



endmodule
