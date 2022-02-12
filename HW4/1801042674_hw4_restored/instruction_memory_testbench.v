`define DELAY 20
module instruction_memory_testbench(); 

reg clk;
//reg [3:0] read_address;
reg [2:0] read_address;
wire [15:0] inst;
reg [2:0] PC; // Program Counter.

instruction_memory inst_mem(clk, read_address, inst);

initial
begin
clk = 0;
read_address = 0;

read_address = 3'b000;
#`DELAY;
read_address = 3'b001;
#`DELAY;
read_address = 3'b010;
#`DELAY;
read_address = 3'b011;
#`DELAY;
read_address = 3'b100;
#`DELAY;
read_address = 3'b101;
#`DELAY;
read_address = 3'b110;
#`DELAY;
read_address = 3'b111;
#`DELAY;
#140 $finish;
end


always begin
#10 clk = ~clk;
end

always @(posedge clk) begin
	read_address <= read_address + 1;
	$monitor("Inst %b,Opcode=%b, Rs=%b, Rt=%b, Imm=%b", 
read_address, inst[15:12], inst[11:9], inst[8:6],inst[5:0]);
end



endmodule