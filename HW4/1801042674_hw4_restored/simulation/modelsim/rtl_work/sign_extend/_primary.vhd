library verilog;
use verilog.vl_types.all;
entity sign_extend is
    port(
        num             : in     vl_logic_vector(5 downto 0);
        num_extended    : out    vl_logic_vector(31 downto 0)
    );
end sign_extend;
