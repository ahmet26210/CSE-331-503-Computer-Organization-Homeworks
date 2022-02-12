`define DELAY 20
module _32bit_sub_test;
 // Inputs
 reg [31:0] a,b;
 reg carry_in;
 // Outputs
 wire [31:0] sum;
 wire carry_out;
 _32bit_sub sub32bit (sum[31:0],carry_out,a[31:0],b[31:0],carry_in);

initial begin
a[31:0] = 32'hFFFF_FFFF; b[31:0] = 32'h0000_0000;carry_in = 1'b1;
#`DELAY;	
a[31:0] = 32'h0F0F0F0F; b[31:0] = 32'hF0F0F0F0;carry_in = 1'b1;
#`DELAY;
a[31:0] = 32'hABCD_6789; b[31:0] = 32'h1111_AAAA;carry_in = 1'b1;
#`DELAY;
a[31:0] = 32'h33333333; b[31:0] = 32'h22222222;carry_in = 1'b1;
end
 
 
initial
begin
$monitor("time = %2d, a =%32h, b=%32h, answer=%32h,carry_out=%1b ,carry_in=%1b", $time, a, b, sum,carry_out,carry_in);
end
      
endmodule