`define REG_PATH "ins_memory.txt"
module instruction_memory(clk, read_address, instruction);

input clk;
input [2:0] read_address; // Program Counter.
reg [15:0] inst_mem [8:0]; // There is 18 instruction in inst mem. Change this if you need to.
output reg [15:0] instruction;

initial
begin
	$readmemb(`REG_PATH,  inst_mem);
end


always @(posedge clk)
	instruction <= inst_mem[read_address];

endmodule