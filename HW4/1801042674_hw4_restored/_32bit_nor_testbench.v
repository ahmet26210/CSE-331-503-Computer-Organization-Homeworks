`define DELAY 10
module _32bit_nor_testbench;
 // Inputs
 reg [31:0] a;
 reg [31:0] b;
 // Outputs
 wire [31:0] answer;

 _32bit_nor nor32Gate (
  .a(a), 
  .b(b), 
  .answer(answer)
 );

initial begin
a[31:0] = 32'h0f0f0f0f; b[31:0] = 32'hffffffff;
#`DELAY;
a[31:0] = 32'h0F0F0F0F; b[31:0] = 32'hF0F0F0F0;
#`DELAY;
a[31:0] = 32'h33333333; b[31:0] = 32'h22222222;
#`DELAY;
a[31:0] = 32'h44444444; b[31:0] = 32'h22222222;
end
 
 
initial
begin
$monitor("time = %1h, a =%1h, b=%1h, answer=%1h", $time, a, b, answer);
end
      
endmodule