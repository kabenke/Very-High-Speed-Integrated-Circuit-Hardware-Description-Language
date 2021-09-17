library ieee;
use ieee.std_logic_1164.all;

entity fa_tb is
end fa_tb;

architecture test of fa_tb is
  component fa
    port (
      a : in std_logic;
      b : in std_logic;
      cin : in std_logic;
      cout : out std_logic;
      sum : out std_logic
    );
  end component;

signal a, b, cin, cout, sum : std_ulogic;
begin
  full_adder: fa port map(a => a, b => b, cin => cin, cout => cout, sum => sum);

  process begin
    -- IMPLEMET TEST HERE
    a <= '0';
    b <= '0';
    cin <= '0';
-- ADD MORE TEST CASES BELOW
    wait for 10 ns;
    a <= '0';
    b <= '0';
    cin <= '1';
--
    wait for 10 ns;
    a <= '0';
    b <= '1';
    cin <= '0';
--
    wait for 10 ns;
    a <= '0';
    b <= '1';
    cin <= '1';
--
    wait for 10 ns;
    a <= '1';
    b <= '0';
    cin <= '0';
-- 
    wait for 10 ns;
    a <= '1';
    b <= '0';
    cin <= '1';
--
    wait for 10 ns;
    a <= '1';
    b <= '1';
    cin <= '0';
--
    wait for 10 ns;
    a <= '1';
    b <= '1';
    cin <= '1';
    wait for 10 ns;
--
    wait;
  end process;
end test;
