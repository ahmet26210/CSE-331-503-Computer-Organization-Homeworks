`define DELAY 20
module data_memory_testbench(); 

reg clk;
reg [31:0] address; // 32 bit address.
reg [31:0] write_data; // 32 bit write data.
reg mem_read, mem_write; // signals.

wire [31:0] read_data; // 32 bit read data.

data_memory my_data_memory(clk, address, write_data, mem_read, mem_write, read_data);

initial 
begin
clk = 1;
address = 0; // do nothing.
write_data = 1;
mem_read = 0;
mem_write = 0;
#`DELAY;
address = 0; // write a word to add0.
write_data = 32'hffffffff;
mem_read = 0;
mem_write = 1;
#`DELAY;
address = 0; // read from add0.
write_data = 32'hffffffff;
mem_read = 1;
mem_write = 0;
#`DELAY;

#200 $finish;
end

always begin
#10 clk = ~clk;
end

initial
begin

$monitor("address = %d, write_data=%8x, mem_read=%b, mem_write=%b, pick_byte=%b, read_data=%8x", 
address, write_data, mem_read, mem_write, read_data);

end

endmodule