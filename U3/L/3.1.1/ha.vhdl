library ieee;
use ieee.std_logic_1164.all;

entity ha is
  port (
    a: in std_logic;
    b: in std_logic;
    o: out std_logic;
    c: out std_logic
  );
end ha;

architecture rtl of ha is
begin
-- MISSING
  o<= (not(a)and b) or (not(b)and a);
  c<= a and b;
-- MISSING
end rtl;
