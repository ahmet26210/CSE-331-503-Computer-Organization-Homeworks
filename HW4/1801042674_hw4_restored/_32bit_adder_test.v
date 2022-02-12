`define DELAY 20
module _32bit_adder_test;
 // Inputs
 reg [31:0] a,b;
 reg carry_in;
 // Outputs
 wire [31:0] sum;
 wire carry_out;
 _32bit_adder adder32bit (sum[31:0],carry_out,a[31:0],b[31:0],carry_in);

initial begin
a[31:0] = 32'h11111111; b[31:0] = 32'h99999999;carry_in = 1'b0;
end
 
 
initial
begin
$monitor("time = %2d, a =%32h, b=%32h, answer=%32h,carry_out=%1b ,carry_in=%1b", $time, a, b, sum,carry_out,carry_in);
end
      
endmodule