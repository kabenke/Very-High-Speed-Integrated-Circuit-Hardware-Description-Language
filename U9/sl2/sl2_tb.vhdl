library ieee;
use ieee.std_logic_1164.all;

entity sl2_tb is
end entity;

architecture testbench of sl2_tb is
  component sl2
    port(
    a: in std_logic_vector(31 downto 0);
    y: out std_logic_vector(31 downto 0)
  );
  end component;

     signal a: std_logic_vector(31 downto 0);
     signal y: std_logic_vector(31 downto 0);
--missing  
begin

    DUT:
    	sl2 port map(
	    		a => a, 
	    		y => y);
   STIMULUS:
    process begin
	    a <= x"10001010";
	    wait for 20 ns;
	    wait;
    end process;
end testbench;
