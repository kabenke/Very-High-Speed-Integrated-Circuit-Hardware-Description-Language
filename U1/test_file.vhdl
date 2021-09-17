library ieee;
use ieee.std_logic_1164.all;

-- create testbench
-- can be left empty, since we have no inputs or outputs
entity test_file is
end test_file;

architecture test of test_file is
-- define the signals that will be used in test
  signal a, b, c : std_logic;
-- begin test code
begin
  process begin
    a <= '0';
    b <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    wait for 10 ns;
    a <= 'X';
    b <= 'W';
    wait for 10 ns;
    assert false report "End of test";
    wait;
  end process;
end test;
