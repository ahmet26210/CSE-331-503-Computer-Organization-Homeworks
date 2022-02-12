module mux_2X1(y, a, b, s);

input a, b, s;
output y;

wire and0, and1, s_not;

not s_NOT(s_not, s);
and a_and_s(and0, a, s);
and b_and_s_not(and1, b, s_not);

or mux_result(y, and0, and1);

endmodule