library ieee;
use ieee.std_logic_1164.all;


entity xnorgate_tb is
end xnorgate_tb;

architecture test of xnorgate_tb is
  component xnorgate
      port (
        input1 : in std_logic;
        input2 : in std_logic;
        xnor_result : out std_logic
      );
  end component;
  signal a, b, c : std_logic;
begin
  xnor_g: xnorgate port map(input1 => a, input2 => b, xnor_result => c);

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
    assert false report "End of test";
    wait;
  end process;
end test;
