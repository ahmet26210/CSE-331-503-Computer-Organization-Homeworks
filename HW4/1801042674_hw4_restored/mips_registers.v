`define REG_PATH "register.txt"
module mips_registers
( read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk );

	output reg [31:0] read_data_1, read_data_2;
	input [31:0] write_data;
	input [2:0] read_reg_1, read_reg_2, write_reg;
	input signal_reg_write, clk;
	
	reg [31:0] registers [7:0];
		
	//this module use behavioral verilog
	//for register & data memory part, use files
	//register.mem or register.txt (file extension does not important)
	
	//--- continuos assignment --- 
	//output data;
	//assign data = registers[adress];
	//--- non-blocking assignment ---
	//register data;
	//always @(posedge clk) begin
	//data <= registers[adress]; end
	initial
begin
	$readmemb(`REG_PATH, registers);
end


always @(posedge clk) begin
	read_data_1 <= registers[read_reg_1];
	read_data_2 <= registers[read_reg_2];
	if (signal_reg_write)
		begin
		registers[write_reg] <= write_data;
		$writememb(`REG_PATH, registers);
		end
	end 
	
endmodule
