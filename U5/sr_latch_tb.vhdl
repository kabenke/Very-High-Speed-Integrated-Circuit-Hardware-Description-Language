library ieee;
use ieee.std_logic_1164.all;

entity sr_latch_tb is
end sr_latch_tb;

architecture test of sr_latch_tb is
  component sr_latch
    port (
        s : in std_logic;
        r : in std_logic;
        q : inout std_logic;
        q_not : inout std_logic
    );
  end component;

    signal s : std_logic;
    signal r : std_logic;
    signal q : std_logic;
    signal q_not : std_logic;
begin
  s_r_latch: sr_latch port map(
        s => s, 
        r => r,
        q => q,
        q_not => q_not
      );
  process begin
    s <= '0';
    r <= '0';
    wait for 1 ns;
    s <= '0';
    r <= '1';
    wait for 1 ns;
    s <= '1';
    r <= '0';
    wait for 1 ns;
    s <= '1';
    r <= '1';
    wait for 1 ns;
    wait;
  end process;
end test;
