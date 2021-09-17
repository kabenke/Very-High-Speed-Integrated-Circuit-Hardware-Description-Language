library ieee;
use ieee.std_logic_1164.all;
entity orgate is
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    or_result : out std_logic
  );
end orgate;

architecture rtl of orgate is
  signal or_gate : std_logic;
begin
  or_gate <= input1 or input2;
  or_result <= or_gate;
end rtl;
