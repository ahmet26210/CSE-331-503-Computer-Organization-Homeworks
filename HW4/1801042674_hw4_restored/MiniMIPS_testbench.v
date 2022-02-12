`define DELAY 10
module MiniMIPS_testbench ();
reg clk;
reg [5:0] PC;
//reg [29:0] instruction_set [15:0];
reg [15:0] instruction_set;
wire [31:0] result;
MiniMIPS mips32(clk,PC,instruction_set, result);
initial begin
clk = 1;
PC = 0;

//AND 
instruction_set = 16'b0000000001010000;
#`DELAY;
instruction_set = 16'b0000011111000000;
#`DELAY;

//ADD
instruction_set = 16'b0000111011100001;
#`DELAY;
instruction_set = 16'b0000000011000001;
#`DELAY;

//SUB
instruction_set = 16'b0000011101000010;
#`DELAY;
instruction_set = 16'b0000011011101010;
#`DELAY;


//XOR
instruction_set = 16'b0000000001010011;
#`DELAY;
instruction_set = 16'b0000010111000011;
#`DELAY;

//NOR
instruction_set = 16'b0000101001010100;
#`DELAY;
instruction_set = 16'b0000011111000100;
#`DELAY;

//OR
instruction_set = 16'b0000000001010101;
#`DELAY;
instruction_set = 16'b0000011111000101;
#`DELAY;

//ADDI
instruction_set = 16'b0001000010000001;
#`DELAY;
instruction_set = 16'b0001011111000101;
#`DELAY;

//ANDI
instruction_set = 16'b0010000001010101;
#`DELAY;
instruction_set = 16'b0010011111000101;
#`DELAY;

//ORI
instruction_set = 16'b0011000001010101;
#`DELAY;
instruction_set = 16'b0011011111000101;
#`DELAY;

//NORI
instruction_set = 16'b0100000001010101;
#`DELAY;
instruction_set = 16'b0100011111000101;
#`DELAY;

//SLTI
instruction_set = 16'b0111000001010101;
#`DELAY;
instruction_set = 16'b0111011111000001;
#`DELAY;
//SW
instruction_set = 16'b1001000001000001;
#`DELAY;
instruction_set = 16'b1001011111001101;
#`DELAY;
//LW
instruction_set = 16'b1000000001000001;
#`DELAY;
instruction_set = 16'b1000011111000101;
#`DELAY;





//#10 $finish;
end

always begin
#1 clk = ~clk;
end


always @(posedge clk) begin
	PC <= PC + 1;
end

initial
begin

$monitor("instruction_set=%b, result=%b"
,instruction_set,result);

end

endmodule