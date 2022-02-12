`define DELAY 20
module register_testbench(); 

reg clk;
reg  [2:0] read_reg1, read_reg2, write_reg; 
reg  reg_write; 
reg [31:0] write_data; 

wire [31:0] read_data1, read_data2;

mips_registers register_memory(read_data1, read_data2, write_data, read_reg1, read_reg2, write_reg, reg_write, clk );

initial
begin
clk = 1;
read_reg1 = 3'b000;
read_reg2 = 3'b001;
write_reg = 3'b000;
reg_write = 0;
write_data = 32'b00000000000000000000000000000000;
#`DELAY;
read_reg1 = 3'b010;
read_reg2 = 3'b011;
write_reg = 3'b000;
reg_write = 0;
write_data = 32'b00000000000000000000000000000000;
#`DELAY;
read_reg1 = 3'b111;
read_reg2 = 3'b110;
write_reg = 3'b100;
reg_write = 1;
write_data = 32'b11111111111111111111111111111111;
#`DELAY;
read_reg1 = 3'b100;
read_reg2 = 3'b001;
write_reg = 3'b101;
reg_write = 1;
write_data = 32'b11111111111111111111111111111110;
#`DELAY;
read_reg1 = 3'b101;
read_reg2 = 3'b001;
write_reg = 3'b111;
reg_write = 1;
write_data = 32'b11111111111111111111111111111110;
#`DELAY;

#120 $finish;
end

always begin
#10 clk = ~clk;
end

initial
begin

$monitor("read_reg1=%5b, read_reg2=%5b, write_reg=%5b, reg_write=%d, read_data1=%32b, read_data2=%32b,  write_data=%32b",
read_reg1, read_reg2, write_reg, reg_write, read_data1, read_data2, write_data);

end

endmodule