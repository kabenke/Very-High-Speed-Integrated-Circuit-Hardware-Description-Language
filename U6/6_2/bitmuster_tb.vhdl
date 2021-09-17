library ieee;
use ieee.std_logic_1164.all;

entity bitmuster_tb is
end bitmuster_tb;

architecture test of bitmuster_tb is

    constant half_period    : time    := 1 ns;

  component bitmuster
    port(
        clk, reset, data: in std_logic;
        y: out STD_LOGIC
    );
  end component;


    signal clk, finished : std_logic := '0';
  signal reset, d, y: std_logic;
  
begin                   
    automat: bitmuster port map(
        clk => clk, 
        reset => reset,
        data => d,
        y => y
      );


      clk <= not clk after half_period when finished /= '1' else '0';
    process is
    begin
        reset <= '0';
        wait for 2 ns;
        d <= '1';
        wait for 2 ns;
        d <= '0';
        wait for 2 ns;
        d <= '1';
        wait for 2 ns;
        d <= '0';
        wait for 2 ns;
        d <= '1';
        wait for 2 ns;
        d <= '0';
        reset <= '1';
        wait for 5 ns;
        reset <= '0';
        d <= '1';
        wait for 5 ns;
        d <= '0';
        wait for 5 ns;
        d <= '1';
        wait for 5 ns;
        d <= '0';
        wait for 5 ns;
        d <= '1';
        wait for 5 ns;
        finished <= '1';
        wait;
    end process;
end test;
