`define DELAY 20
module left_shifter_2bit_testbench();

reg signed [31:0] input1;
wire [31:0] output1;
left_shifter_2bit left_2bit(input1,output1);

initial begin
input1[31:0] = 32'h33333333;
#`DELAY;
input1[31:0] = 32'h44444444;
#`DELAY;
end
 
 
initial
begin
$monitor("input=%b, output=%b,", input1,output1);
end

endmodule