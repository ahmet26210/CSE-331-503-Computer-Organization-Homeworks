library verilog;
use verilog.vl_types.all;
entity \_32bit_and\ is
    port(
        answer          : out    vl_logic_vector(31 downto 0);
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0)
    );
end \_32bit_and\;
