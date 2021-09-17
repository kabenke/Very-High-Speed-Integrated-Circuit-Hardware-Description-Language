library ieee;
use ieee.std_logic_1164.all;


entity xorgate_tb is
end xorgate_tb;

architecture test of xorgate_tb is
  component xorgate
      port (
        input1 : in std_logic;
        input2 : in std_logic;
        input3: in std_logic;
        xor_result_delayed : out std_logic
      );
  end component;
  signal a, b, c, d: std_logic;
begin
  xor_g: xorgate port map(input1 => a, input2 => b, input3 => c, xor_result_delayed => d);

  process begin
    a <= '0';
    b <= '0';
    c <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    c <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    c <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    c <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '0';
    c <= '1';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    c <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    c <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    c <= '1';
    wait for 10 ns;
    assert false report "End of test";
    wait;
  end process;
end test;
