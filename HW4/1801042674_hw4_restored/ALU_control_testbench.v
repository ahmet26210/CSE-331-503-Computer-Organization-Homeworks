`define DELAY 20

module ALU_control_testbench();

reg [2:0] ALUOp,functionfield;


wire [2:0] ALUControlOp;
ALU_control alu_control_module(ALUOp,functionfield,ALUControlOp);

initial begin
ALUOp = 3'b011;
functionfield=3'b000;
#`DELAY;
ALUOp = 3'b011;
functionfield=3'b001;
#`DELAY;
ALUOp = 3'b011;
functionfield=3'b010;
#`DELAY;
ALUOp = 3'b011;
functionfield=3'b011;
#`DELAY;
ALUOp = 3'b011;
functionfield=3'b100;
#`DELAY;
ALUOp = 3'b011;
functionfield=3'b101;
#`DELAY;
ALUOp = 3'b000;
functionfield=3'bxxx;
#`DELAY;
ALUOp = 3'b110;
functionfield=3'bxxx;
#`DELAY;
ALUOp = 3'b111;
functionfield=3'bxxx;
#`DELAY;
ALUOp = 3'b101;
functionfield=3'bxxx;
#`DELAY;
ALUOp = 3'b001;
functionfield=3'bxxx;
#`DELAY;
ALUOp = 3'b001;
functionfield=3'bxxx;
#`DELAY;
ALUOp = 3'b100;
functionfield=3'bxxx;
#`DELAY;
ALUOp = 3'b000;
functionfield=3'bxxx;
#`DELAY;
ALUOp = 3'b000;
functionfield=3'bxxx;
#`DELAY;
end
 
 
initial
begin

$monitor("ALUOp=%x, functionfiled=%x,ALUControlOp=%x",ALUOp,functionfield,ALUControlOp);

end

endmodule