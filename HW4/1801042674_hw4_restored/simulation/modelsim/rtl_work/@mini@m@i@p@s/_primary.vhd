library verilog;
use verilog.vl_types.all;
entity MiniMIPS is
    port(
        clk             : in     vl_logic;
        PC              : in     vl_logic_vector(5 downto 0);
        instruction     : in     vl_logic_vector(15 downto 0);
        result          : out    vl_logic_vector(31 downto 0)
    );
end MiniMIPS;
