library verilog;
use verilog.vl_types.all;
entity \_4bit_adder\ is
    port(
        S               : out    vl_logic_vector(3 downto 0);
        C               : out    vl_logic;
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        C0              : in     vl_logic
    );
end \_4bit_adder\;
