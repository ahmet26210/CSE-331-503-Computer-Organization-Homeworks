`define DELAY 20
module sign_extend_testbench();

reg signed [15:0] num;
wire signed [31:0] num_extended;

sign_extend myextend(num, num_extended);

initial begin
num = -1234;
#`DELAY;
num = -1111;
#`DELAY;
num = 1;
#`DELAY;
num = 82;
#`DELAY;
end
 
 
initial
begin
$monitor("num=%d, num_extended=%d, num=%b, num_extended=%b", num, num_extended, num, num_extended);
end

endmodule