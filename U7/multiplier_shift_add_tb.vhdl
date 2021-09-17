library ieee;
use ieee.std_logic_1164.all;

entity multiplier_shift_add_tb is
end multiplier_shift_add_tb;

architecture test of multiplier_shift_add_tb is
    component multiplier_shift_add
        port (
          x : in std_logic_vector(3 downto 0);
          y : in std_logic_vector(3 downto 0);
          p : out std_logic_vector(7 downto 0)
        );
      end component;

      signal x : std_logic_vector(3 downto 0);
      signal y : std_logic_vector(3 downto 0);
      signal p : std_logic_vector(7 downto 0);
    
    begin
        multiplier : multiplier_shift_add port map(
            x => x, 
            y => y,
            p => p
        );
        process begin
            x <= "1010";
            y <= "1101";
            wait for 1 ns;
            x <= "1010";
            y <= "0111";
            wait for 1 ns;
            x <= "1001";
            y <= "1101";
            wait for 1 ns;
            x <= "1001";
            y <= "0111";
            wait for 1 ns;
            wait;
        end process;
end test;