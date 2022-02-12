library verilog;
use verilog.vl_types.all;
entity mux_2X1 is
    port(
        y               : out    vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic;
        s               : in     vl_logic
    );
end mux_2X1;
