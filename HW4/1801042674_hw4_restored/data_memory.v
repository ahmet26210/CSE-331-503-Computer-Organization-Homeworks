`define DATA_PATH "data.txt"

module data_memory(clk, address, write_data, mem_read, mem_write, read_data);

input clk;
input [31:0] address;
input [31:0] write_data; // 32 bits data.
input mem_write, mem_read;


reg [5:0] k; // temp counter.

reg [31:0] data_mem [255:0]; // data memory.
output reg [31:0] read_data; // 32 bits register contents.

/*
initial
begin
for (k = 0; k < 32; k = k + 1)
begin
    data_mem[k] = 32'd0;
end
end*/

initial
begin
	$readmemb(`DATA_PATH, data_mem);
end

always @(posedge clk) begin
	if (mem_read)
		read_data <= data_mem[address];
	if (mem_write)
		begin
			data_mem[address] <= write_data;
			$writememb(`DATA_PATH, data_mem);
		end		
	end
	
endmodule
	

