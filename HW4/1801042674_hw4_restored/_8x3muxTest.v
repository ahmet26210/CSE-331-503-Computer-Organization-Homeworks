module _8x3muxTest();
reg [31:0] a,b;
reg [2:0] select;
wire [31:0] sum;

_8x3mux testmux(sum,a,b,select);

	initial
		begin
			a=32'h33333333;
			b=32'h22222222;
			//Add
			#5	select=3'b000;
			
			$monitor("Add -> time = %2d, a =%32h, b=%32h,select=%3b ,sum=%32h", $time, a, b,select,sum);
			//XOR
			#5	select=3'b001;
			
			$monitor("Xor -> time = %2d, a =%32h, b=%32h,select=%3b,sum=%32h", $time, a, b,select,sum);
			//SUB
			#5	select=3'b010;
			
			$monitor("Sub -> time = %2d, a =%32h, b=%32h,select=%3b,sum=%32h", $time, a, b,select,sum);
			//MULT
			#5	select=3'b011;
			
			$monitor("Mult -> time = %2d, a =%32h, b=%32h,select=%3b,sum=%32h", $time, a, b,select,sum);
			//SLT
			#5	select=3'b100;
			
			$monitor("Slt -> time = %2d, a =%32h, b=%32h,select=%3b,sum=%32h", $time, a, b,select,sum);
			//NOR
			#5	select=3'b101;
			
			$monitor("Nor -> time = %2d, a =%32h, b=%32h,select=%3b,sum=%32h", $time, a, b,select,sum);
			//AND
			#5	select=3'b110;

			$monitor("And -> time = %2d, a =%32h, b=%32h,select=%3b,sum=%32h", $time, a, b,select,sum);
			//OR
			#5	select=3'b111;
	
			$monitor("Or -> time = %2d, a =%32h, b=%32h,select=%3b,sum=%32h\n", $time, a, b,select,sum);
			
			a=32'h44444444;
			b=32'h22222222;
			
			//Add
			#5	select=3'b000;
			
			$monitor("Add -> time = %2d, a =%32h, b=%32h,select=%3b ,sum=%32h", $time, a, b,select,sum);
			//XOR
			#5	select=3'b001;
			
			$monitor("Xor -> time = %2d, a =%32h, b=%32h,select=%3b,sum=%32h", $time, a, b,select,sum);
			//SUB
			#5	select=3'b010;
			
			$monitor("Sub -> time = %2d, a =%32h, b=%32h,select=%3b,sum=%32h", $time, a, b,select,sum);
			//MULT
			#5	select=3'b011;
			
			$monitor("Mult -> time = %2d, a =%32h, b=%32h,select=%3b,sum=%32h", $time, a, b,select,sum);
			//SLT
			#5	select=3'b100;
			
			$monitor("Slt -> time = %2d, a =%32h, b=%32h,select=%3b,sum=%32h", $time, a, b,select,sum);
			//NOR
			#5	select=3'b101;
			
			$monitor("Nor -> time = %2d, a =%32h, b=%32h,select=%3b,sum=%32h", $time, a, b,select,sum);
			//AND
			#5	select=3'b110;

			$monitor("And -> time = %2d, a =%32h, b=%32h,select=%3b,sum=%32h", $time, a, b,select,sum);
			//OR
			#5	select=3'b111;
	
			$monitor("Or -> time = %2d, a =%32h, b=%32h,select=%3b,sum=%32h", $time, a, b,select,sum);
			
		end
endmodule
