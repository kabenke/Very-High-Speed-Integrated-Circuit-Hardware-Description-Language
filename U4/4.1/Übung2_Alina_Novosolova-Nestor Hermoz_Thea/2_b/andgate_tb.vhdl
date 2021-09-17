library ieee;
use ieee.std_logic_1164.all;

-- create testbench for and_gate
-- can be left empty, since test bench (this file) has no inputs or outputs
entity andgate_tb is
end andgate_tb;

architecture test of andgate_tb is
  -- component declaration, so that it can be instantiated later
  -- must have same name and port list as the entity
  component andgate
      port (
        input1 : in std_logic;
        input2 : in std_logic;
        and_result : out std_logic
      );
  end component;
-- define the signals that will be used in test
  signal a, b, c : std_logic;
-- begin test code
begin
  -- creates an instance of andgate
  and_g: andgate port map(input1 => a, input2 => b, and_result => c);

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
