LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY function_41_tb IS
END function_41_tb;

ARCHITECTURE testbench OF function_41_tb IS

    component function_41 is 
        PORT ( 
        ABC : IN std_logic_vector(2 DOWNTO 0);
        y_41 : OUT std_logic_vector(2 DOWNTO 0));
    end component function_41;
 signal ABC:std_logic_vector(2 DOWNTO 0);
 signal y_41 : std_logic_vector(2 DOWNTO 0);
begin
--missing
  multiplex: function_41 port map( ABC=>ABC, y_41=>y_41);

    process begin
        ABC <= "000";
        wait for 10 ns;
        ABC <= "111";
        wait for 10 ns;
        ABC <= "110";
        wait for 10 ns;
        ABC <= "101";
        wait for 10 ns;
		
        wait;
    end process;
end testbench;
