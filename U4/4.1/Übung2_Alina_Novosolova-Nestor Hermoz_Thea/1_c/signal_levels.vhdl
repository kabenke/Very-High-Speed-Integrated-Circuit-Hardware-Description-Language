library ieee;
use ieee.std_logic_1164.all;

entity signals_tb is
end signals_tb;

architecture test of signals_tb is
  signal a, b, c_or ,c_and : std_logic;
begin
  process begin
    a <= '0';
    b <= '0';           --1)
    c_or <= a or b;     --c_or=0
    c_and <= a and b;   --c_and=0
    wait for 10 ns;
    a <= '0';
    b <= '1';           --2)
    c_or <= a or b;     --c_or=1
    c_and <= a and b;   --c_and=0
    wait for 10 ns;
    a <= '1';
    b <= 'H';           --3)
    c_or <= a or b;     --c_or=1
    c_and <= a and b;   --c_and=1
    wait for 10 ns;
    a <= '1';
    b <= '1';           --4)
    c_or <= a or b;     --c_or=1
    c_and <= a and b;   --c_and=1
    wait for 10 ns;
    a <= 'X';
    b <= 'W';           --5)
    c_or <= a or b;     --c_or=x
    c_and <= a and b;   --c_and=x
    wait for 10 ns;
    a <= 'L';
    b <= 'W';           --6)
    c_or <= a or b;     --c_or=x
    c_and <= a and b;   --c_and=0
    wait for 10 ns;
    a <= 'U';
    b <= 'Z';           --7)
    c_or <= a or b;     --c_or=u
    c_and <= a and b;   --c_and=u
    wait for 10 ns;
    a <= 'U';
    b <= '-';           --8)
    c_or <= a or b;     --c_or=u
    c_and <= a and b;   --c_and=u
    wait for 10 ns;
    assert false report "End of test";
    wait;
  end process;
end test;
