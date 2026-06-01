-- Testbench for Basic Logic Gates
-- Tests INV, NAND, NOR, XOR gates

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gates_tb is
end gates_tb;

architecture Behavioral of gates_tb is

    -- Component declarations
    component inv_gate
        Port ( A : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    component nand_gate
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    component nor_gate
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    component xor_gate
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    -- Testbench signals
    signal A, B        : STD_LOGIC := '0';
    signal Y_inv       : STD_LOGIC;
    signal Y_nand      : STD_LOGIC;
    signal Y_nor       : STD_LOGIC;
    signal Y_xor       : STD_LOGIC;

begin

    -- Instantiate gates
    uut_inv  : inv_gate  port map (A => A, Y => Y_inv);
    uut_nand : nand_gate port map (A => A, B => B, Y => Y_nand);
    uut_nor  : nor_gate  port map (A => A, B => B, Y => Y_nor);
    uut_xor  : xor_gate  port map (A => A, B => B, Y => Y_xor);

    -- Stimulus process
    stim_proc: process
    begin
        -- Test all input combinations
        A <= '0'; B <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; wait for 10 ns;

        wait;
    end process;

end Behavioral;
