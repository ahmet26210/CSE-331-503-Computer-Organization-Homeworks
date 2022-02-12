module zero_extend(num, num_extended);

input [15:0] num;
output [31:0] num_extended;

or get0(num_extended[0], num[0], 0);
or get1(num_extended[1], num[1], 0);
or get2(num_extended[2], num[2], 0);
or get3(num_extended[3], num[3], 0);
or get4(num_extended[4], num[4], 0);
or get5(num_extended[5], num[5], 0);
or get6(num_extended[6], num[6], 0);
or get7(num_extended[7], num[7], 0);
or get8(num_extended[8], num[8], 0);
or get9(num_extended[9], num[9], 0);
or get10(num_extended[10], num[10], 0);
or get11(num_extended[11], num[11], 0);
or get12(num_extended[12], num[12], 0);
or get13(num_extended[13], num[13], 0);
or get14(num_extended[14], num[14], 0);
or get15(num_extended[15], num[15], 0);


or extend0(num_extended[16], 0, 0);
or extend1(num_extended[17], 0, 0);
or extend2(num_extended[18], 0, 0);
or extend3(num_extended[19], 0, 0);
or extend4(num_extended[20], 0, 0);
or extend5(num_extended[21], 0, 0);
or extend6(num_extended[22], 0, 0);
or extend7(num_extended[23], 0, 0);
or extend8(num_extended[24], 0, 0);
or extend9(num_extended[25], 0, 0);
or extend10(num_extended[26], 0, 0);
or extend11(num_extended[27], 0, 0);
or extend12(num_extended[28], 0, 0);
or extend13(num_extended[29], 0, 0);
or extend14(num_extended[30], 0, 0);
or extend15(num_extended[31], 0, 0);

endmodule

