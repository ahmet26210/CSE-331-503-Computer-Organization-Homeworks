module Control_32bit_testbench;
reg clk,rst,lsb,lt;

reg [31:0] multiplicand;
reg [63:0] product;
 Control_32bit ctrl(
	clk,
	rst,
	lsb,
	lt,
	multiplicand,
	product
);
initial
	begin
		clk = 1'b1;
	end

always
	begin
		#5 clk = ~clk;
	end
	
initial
	begin
		rst = 1'b1;
		lsb=1'b0;
		lt=1'b0;
	end
	

initial
	begin
		#5 rst = 1'b0;
		#5 rst = 1'b1;
		#5 lsb= 1'b0;
		#5 lt= 1'b0;
		

		#5 lsb = 1'b1;
		#5 lt = 1'b0;
		
		#5 lsb = 1'b1;
		#5 lt = 1'b1;
		
		#10 $finish;
end
	
initial
	begin
		$monitor("time=%2d ,present_state=%2b,next_state=%2b",$time ,ctrl.present_state,ctrl.next_state);
	end

endmodule


