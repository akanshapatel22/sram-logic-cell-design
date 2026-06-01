-- Testbench for 6T-SRAM Cell
-- Tests read and write operations

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sram_tb is
end sram_tb;

architecture Behavioral of sram_tb is

    -- Component declaration
    component sram_6t
        Port (
            WL  : in    STD_LOGIC;
            BL  : inout STD_LOGIC;
            BLB : inout STD_LOGIC
        );
    end component;

    -- Testbench signals
    signal WL  : STD_LOGIC := '0';
    signal BL  : STD_LOGIC := 'Z';
    signal BLB : STD_LOGIC := 'Z';

begin

    -- Instantiate SRAM cell
    uut: sram_6t
        port map (
            WL  => WL,
            BL  => BL,
            BLB => BLB
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test 1: Write '1' to cell
        WL  <= '0';
        BL  <= 'Z';
        BLB <= 'Z';
        wait for 10 ns;

        WL  <= '1';
        BL  <= '1';
        BLB <= '0';
        wait for 10 ns;

        -- Test 2: Deselect cell (data retained)
        WL  <= '0';
        BL  <= 'Z';
        BLB <= 'Z';
        wait for 10 ns;

        -- Test 3: Read from cell
        WL  <= '1';
        BL  <= 'Z';
        BLB <= 'Z';
        wait for 10 ns;

        -- Test 4: Write '0' to cell
        WL  <= '1';
        BL  <= '0';
        BLB <= '1';
        wait for 10 ns;

        -- Test 5: Read back
        WL  <= '1';
        BL  <= 'Z';
        BLB <= 'Z';
        wait for 10 ns;

        -- End simulation
        WL  <= '0';
        wait;
    end process;

end Behavioral;
