`define DELAY 20
module _32bit_slt_test;
 // Inputs
 reg [31:0] a,b;
 reg carry_in;
 // Outputs
 wire [31:0] sum,result;
 wire carry_out;
 _32bit_slt slt32bit (result[31:0] ,sum[31:0],carry_out,a[31:0],b[31:0],carry_in);

initial begin
a[31:0] = 32'hFFFF_FFFF; b[31:0] = 32'h0000_0000;carry_in = 1'b0;
#`DELAY;	
a[31:0] = 32'h0F0F0F0F; b[31:0] = 32'hF0F0F0F0;carry_in = 1'b0;
#`DELAY;
a[31:0] = 32'h11111111; b[31:0] = 32'h33333333;carry_in = 1'b0;
#`DELAY;
a[31:0] = 32'h33333333; b[31:0] = 32'h22222222;carry_in = 1'b0;
end
 
 
initial
begin
$monitor("time = %2d, a =%32h, b=%32h,carry_out=%1b ,carry_in=%1b,result=%32h", $time, a, b,carry_out,carry_in,result);
end
      
endmodule