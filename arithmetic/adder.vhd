-- Half Adder and Full Adder in VHDL
-- Building blocks for arithmetic units

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Half Adder
entity half_adder is
    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        SUM  : out STD_LOGIC;
        COUT : out STD_LOGIC
    );
end half_adder;

architecture Behavioral of half_adder is
begin
    SUM  <= A xor B;
    COUT <= A and B;
end Behavioral;

-------------------------------------------

-- Full Adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        CIN  : in  STD_LOGIC;
        SUM  : out STD_LOGIC;
        COUT : out STD_LOGIC
    );
end full_adder;

architecture Behavioral of full_adder is
    signal S1, C1, C2 : STD_LOGIC;
begin
    -- First half adder
    S1 <= A xor B;
    C1 <= A and B;

    -- Second half adder
    SUM  <= S1 xor CIN;
    C2   <= S1 and CIN;

    -- Final carry
    COUT <= C1 or C2;
end Behavioral;

-------------------------------------------

-- 4-bit Ripple Carry Adder
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_carry_adder is
    Port (
        A    : in  STD_LOGIC_VECTOR(3 downto 0);
        B    : in  STD_LOGIC_VECTOR(3 downto 0);
        CIN  : in  STD_LOGIC;
        SUM  : out STD_LOGIC_VECTOR(3 downto 0);
        COUT : out STD_LOGIC
    );
end ripple_carry_adder;

architecture Behavioral of ripple_carry_adder is

    component full_adder
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            CIN  : in  STD_LOGIC;
            SUM  : out STD_LOGIC;
            COUT : out STD_LOGIC
        );
    end component;

    signal carry : STD_LOGIC_VECTOR(4 downto 0);

begin
    carry(0) <= CIN;

    -- Chain 4 full adders
    FA0: full_adder port map
        (A => A(0), B => B(0), CIN => carry(0),
         SUM => SUM(0), COUT => carry(1));

    FA1: full_adder port map
        (A => A(1), B => B(1), CIN => carry(1),
         SUM => SUM(1), COUT => carry(2));

    FA2: full_adder port map
        (A => A(2), B => B(2), CIN => carry(2),
         SUM => SUM(2), COUT => carry(3));

    FA3: full_adder port map
        (A => A(3), B => B(3), CIN => carry(3),
         SUM => SUM(3), COUT => carry(4));

    COUT <= carry(4);

end Behavioral;
