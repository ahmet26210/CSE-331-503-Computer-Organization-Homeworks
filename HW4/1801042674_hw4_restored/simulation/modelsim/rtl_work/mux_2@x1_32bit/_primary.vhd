library verilog;
use verilog.vl_types.all;
entity mux_2X1_32bit is
    port(
        y               : out    vl_logic_vector(31 downto 0);
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        s               : in     vl_logic
    );
end mux_2X1_32bit;
