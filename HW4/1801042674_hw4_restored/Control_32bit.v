//module Control_32bit(clk,lsb,lt);
module Control_32bit(input clk,
	input rst,
	input lsb,
	input lt,
	input [31:0] multiplicand,
	input [63:0] product);

reg[1:0] present_state;
wire[1:0] next_state;
wire i;
wire [63:0] result;

wire less32,Write,shift;

assign less32=(present_state[1] & ~present_state[0]);

assign Write = (~present_state[1] & present_state[0]);

assign shift = (present_state[1] & ~present_state[0]);

assign next_state[1] = (~present_state[1] & ~present_state[0] & ~lsb | 
								~present_state[1] &  present_state[0] |
								present_state[1] & ~present_state[0] & ~lt
								);

assign next_state[0] = (~present_state[1] & ~present_state[0] & lsb | 
								present_state[1] & ~present_state[0] & ~lt
								);
							  
							  
//MUL_datapath a22(result,product,multiplicand,Write,shift,less32,i);						  
							  
always @(posedge clk or negedge rst)
begin
	if(!rst)
		present_state <= 2'b00;
	else
		present_state <= next_state;
end


endmodule



