library ieee;
use ieee.std_logic_1164.all;

entity siso_tb is
end siso_tb;

architecture test of siso_tb is

    constant half_period : time := 1 ns;

  component siso
    port (
        clk : in std_logic;
        i_data : in std_logic;
        reset : in std_logic;
        q : out std_logic
    );
  end component;

    signal clk, finished : std_logic := '0';
    signal d : std_logic;
    signal reset : std_logic;
    signal q : std_logic;
begin
  clk <= not clk after half_period when finished /= '1' else '0';

  shift_registry: siso port map(
        clk => clk, 
        i_data => d,
        reset => reset,
        q => q
      );
  process begin
    reset <= '0';
    d <= '0';
    wait for 20 ns;
    d <= '1';
    wait for 10 ns;
    reset <= '1';
    wait for 10 ns;
    reset <= '0';
    d <= '0';
    wait for 20 ns; 
    finished <= '1';
    wait;
  end process;
end test;
