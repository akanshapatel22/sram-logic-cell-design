-- Testbench for Half Adder, Full Adder and Ripple Carry Adder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_tb is
end adder_tb;

architecture Behavioral of adder_tb is

    -- Component declarations
    component half_adder
        Port ( A    : in  STD_LOGIC;
               B    : in  STD_LOGIC;
               SUM  : out STD_LOGIC;
               COUT : out STD_LOGIC);
    end component;

    component full_adder
        Port ( A    : in  STD_LOGIC;
               B    : in  STD_LOGIC;
               CIN  : in  STD_LOGIC;
               SUM  : out STD_LOGIC;
               COUT : out STD_LOGIC);
    end component;

    component ripple_carry_adder
        Port ( A    : in  STD_LOGIC_VECTOR(3 downto 0);
               B    : in  STD_LOGIC_VECTOR(3 downto 0);
               CIN  : in  STD_LOGIC;
               SUM  : out STD_LOGIC_VECTOR(3 downto 0);
               COUT : out STD_LOGIC);
    end component;

    -- Signals for half adder
    signal HA_A, HA_B       : STD_LOGIC := '0';
    signal HA_SUM, HA_COUT  : STD_LOGIC;

    -- Signals for full adder
    signal FA_A, FA_B, FA_CIN  : STD_LOGIC := '0';
    signal FA_SUM, FA_COUT     : STD_LOGIC;

    -- Signals for ripple carry adder
    signal RCA_A, RCA_B   : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal RCA_CIN        : STD_LOGIC := '0';
    signal RCA_SUM        : STD_LOGIC_VECTOR(3 downto 0);
    signal RCA_COUT       : STD_LOGIC;

begin

    -- Instantiate components
    uut_ha  : half_adder
        port map (A => HA_A, B => HA_B,
                  SUM => HA_SUM, COUT => HA_COUT);

    uut_fa  : full_adder
        port map (A => FA_A, B => FA_B, CIN => FA_CIN,
                  SUM => FA_SUM, COUT => FA_COUT);

    uut_rca : ripple_carry_adder
        port map (A => RCA_A, B => RCA_B, CIN => RCA_CIN,
                  SUM => RCA_SUM, COUT => RCA_COUT);

    -- Stimulus process
    stim_proc: process
    begin
        -- Half adder tests
        HA_A <= '0'; HA_B <= '0'; wait for 10 ns;
        HA_A <= '0'; HA_B <= '1'; wait for 10 ns;
        HA_A <= '1'; HA_B <= '0'; wait for 10 ns;
        HA_A <= '1'; HA_B <= '1'; wait for 10 ns;

        -- Full adder tests
        FA_A <= '0'; FA_B <= '0'; FA_CIN <= '0'; wait for 10 ns;
        FA_A <= '0'; FA_B <= '1'; FA_CIN <= '1'; wait for 10 ns;
        FA_A <= '1'; FA_B <= '1'; FA_CIN <= '0'; wait for 10 ns;
        FA_A <= '1'; FA_B <= '1'; FA_CIN <= '1'; wait for 10 ns;

        -- Ripple carry adder tests
        RCA_A <= "0011"; RCA_B <= "0101"; RCA_CIN <= '0'; wait for 10 ns;
        RCA_A <= "1111"; RCA_B <= "0001"; RCA_CIN <= '0'; wait for 10 ns;
        RCA_A <= "1010"; RCA_B <= "0101"; RCA_CIN <= '1'; wait for 10 ns;
        RCA_A <= "1111"; RCA_B <= "1111"; RCA_CIN <= '1'; wait for 10 ns;

        wait;
    end process;

end Behavioral;
