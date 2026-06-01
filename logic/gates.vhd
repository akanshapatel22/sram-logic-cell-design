-- Basic Logic Gates in 180nm CMOS VHDL Model
-- Includes INV, NAND, NOR, XOR gates

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Inverter
entity inv_gate is
    Port (
        A : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end inv_gate;

architecture Behavioral of inv_gate is
begin
    Y <= not A;
end Behavioral;

-------------------------------------------

-- 2-input NAND gate
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end nand_gate;

architecture Behavioral of nand_gate is
begin
    Y <= not (A and B);
end Behavioral;

-------------------------------------------

-- 2-input NOR gate
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor_gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end nor_gate;

architecture Behavioral of nor_gate is
begin
    Y <= not (A or B);
end Behavioral;

-------------------------------------------

-- 2-input XOR gate
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end xor_gate;

architecture Behavioral of xor_gate is
begin
    Y <= A xor B;
end Behavioral;
