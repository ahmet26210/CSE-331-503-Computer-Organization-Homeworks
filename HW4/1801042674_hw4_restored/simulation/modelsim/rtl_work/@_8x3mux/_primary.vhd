library verilog;
use verilog.vl_types.all;
entity \_8x3mux\ is
    port(
        sum             : out    vl_logic_vector(31 downto 0);
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        \select\        : in     vl_logic_vector(2 downto 0)
    );
end \_8x3mux\;
