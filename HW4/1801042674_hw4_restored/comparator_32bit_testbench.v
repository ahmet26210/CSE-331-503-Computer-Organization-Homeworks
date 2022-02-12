`define DELAY 20
module comparator_32bit_testbench();

reg signed [31:0] input1,input2;
wire gt,eq;
comparator_32bit comparator(input1,input2,gt,eq);

initial begin
input1[31:0] = 32'h33333333; input2[31:0] = 32'h33333333;
#`DELAY;
input1[31:0] = 32'h44444444; input2[31:0] = 32'h22222222;
#`DELAY;
end
 
 
initial
begin
$monitor("input1=%d, input2=%d, gt=%b, eq=%b", input1, input2, gt,eq);
end

endmodule