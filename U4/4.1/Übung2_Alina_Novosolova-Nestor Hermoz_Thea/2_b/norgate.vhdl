library ieee;
use ieee.std_logic_1164.all;
entity norgate is
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    nor_result : out std_logic
  );
end norgate;

architecture rtl of norgate is
  signal nor_gate : std_logic;
begin
  nor_gate <= input1 nor input2;
  nor_result <= nor_gate;
end rtl;
