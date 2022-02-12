module mux_2X1_32bit(y, a, b, s);

input [31:0] a, b;
input s;
output [31:0] y;

mux_2X1 bit0(y[0], a[0], b[0], s);
mux_2X1 bit1(y[1], a[1], b[1], s);
mux_2X1 bit2(y[2], a[2], b[2], s);
mux_2X1 bit3(y[3], a[3], b[3], s);
mux_2X1 bit4(y[4], a[4], b[4], s);
mux_2X1 bit5(y[5], a[5], b[5], s);
mux_2X1 bit6(y[6], a[6], b[6], s);
mux_2X1 bit7(y[7], a[7], b[7], s);
mux_2X1 bit8(y[8], a[8], b[8], s);
mux_2X1 bit9(y[9], a[9], b[9], s);
mux_2X1 bit10(y[10], a[10], b[10], s);
mux_2X1 bit11(y[11], a[11], b[11], s);
mux_2X1 bit12(y[12], a[12], b[12], s);
mux_2X1 bit13(y[13], a[13], b[13], s);
mux_2X1 bit14(y[14], a[14], b[14], s);
mux_2X1 bit15(y[15], a[15], b[15], s);
mux_2X1 bit16(y[16], a[16], b[16], s);
mux_2X1 bit17(y[17], a[17], b[17], s);
mux_2X1 bit18(y[18], a[18], b[18], s);
mux_2X1 bit19(y[19], a[19], b[19], s);
mux_2X1 bit20(y[20], a[20], b[20], s);
mux_2X1 bit21(y[21], a[21], b[21], s);
mux_2X1 bit22(y[22], a[22], b[22], s);
mux_2X1 bit23(y[23], a[23], b[23], s);
mux_2X1 bit24(y[24], a[24], b[24], s);
mux_2X1 bit25(y[25], a[25], b[25], s);
mux_2X1 bit26(y[26], a[26], b[26], s);
mux_2X1 bit27(y[27], a[27], b[27], s);
mux_2X1 bit28(y[28], a[28], b[28], s);
mux_2X1 bit29(y[29], a[29], b[29], s);
mux_2X1 bit30(y[30], a[30], b[30], s);
mux_2X1 bit31(y[31], a[31], b[31], s);

endmodule