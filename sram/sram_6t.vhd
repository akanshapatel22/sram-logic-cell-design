-- 6T-SRAM Cell Model in VHDL
-- Models the behavioral operation of a 6-transistor SRAM cell
-- Supports read and write operations with enable control

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sram_6t is
    Port (
        WL  : in  STD_LOGIC;  -- Word Line (row select)
        BL  : inout STD_LOGIC;  -- Bit Line
        BLB : inout STD_LOGIC   -- Bit Line Bar (complement)
    );
end sram_6t;

architecture Behavioral of sram_6t is

    -- Internal storage nodes
    signal Q  : STD_LOGIC := '0';  -- Storage node
    signal QB : STD_LOGIC := '1';  -- Complementary storage node

begin

    -- Cross-coupled inverters (heart of SRAM cell)
    -- Inverter 1: Q drives QB
    QB <= not Q;

    -- Inverter 2: QB drives Q
    Q  <= not QB;

    -- Access transistors controlled by Word Line
    process(WL, BL, BLB)
    begin
        if WL = '1' then
            -- Write operation: BL and BLB drive storage nodes
            if BL = '1' and BLB = '0' then
                Q  <= '1';
                QB <= '0';
            elsif BL = '0' and BLB = '1' then
                Q  <= '0';
                QB <= '1';
            end if;

            -- Read operation: storage nodes drive BL and BLB
            BL  <= Q;
            BLB <= QB;
        else
            -- Word line low: cell isolated, data retained
            BL  <= 'Z';
            BLB <= 'Z';
        end if;
    end process;

end Behavioral;
