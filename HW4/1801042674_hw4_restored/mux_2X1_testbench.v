`define DELAY 20
module mux_2X1_testbench(); 
reg a, b, s;
wire y;

mux_2X1 mymux (y, a, b, s);

initial begin
a = 1'b0; b = 1'b0; s = 1'b0;
#`DELAY;
a = 1'b0; b = 1'b1; s = 1'b0;
#`DELAY;
a = 1'b1; b = 1'b0; s = 1'b0;
#`DELAY;
a = 1'b1; b = 1'b1; s = 1'b0;
#`DELAY;
a = 1'b0; b = 1'b0; s = 1'b1;
#`DELAY;
a = 1'b0; b = 1'b1; s = 1'b1;
#`DELAY;
a = 1'b1; b = 1'b0; s = 1'b1;
#`DELAY;
a = 1'b1; b = 1'b1; s = 1'b1;
#`DELAY;
end
 
 
initial
begin
$monitor("a=%1b, b=%1b, s=%1b, y=%1b", a, b, s, y);
end
 
endmodule