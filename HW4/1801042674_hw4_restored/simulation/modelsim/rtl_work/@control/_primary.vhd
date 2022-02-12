library verilog;
use verilog.vl_types.all;
entity Control is
    port(
        opcode          : in     vl_logic_vector(3 downto 0);
        ALUOp           : out    vl_logic_vector(2 downto 0);
        RegDst          : out    vl_logic;
        AluSrc          : out    vl_logic;
        MemtoReg        : out    vl_logic;
        RegWrite        : out    vl_logic;
        MemRead         : out    vl_logic;
        MemWrite        : out    vl_logic;
        Branch          : out    vl_logic;
        BranchNot       : out    vl_logic
    );
end Control;
