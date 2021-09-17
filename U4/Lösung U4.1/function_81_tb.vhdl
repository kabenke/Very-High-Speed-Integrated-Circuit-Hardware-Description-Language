LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY function_81_tb IS
END function_81_tb;

ARCHITECTURE testbench OF function_81_tb IS

    component function_81 is 
        PORT ( 
        ABC : IN std_logic_vector(2 DOWNTO 0); 
        y_81 : OUT std_logic_vector(2 DOWNTO 0));
    end component function_81;
 signal ABC,y_81 : std_logic_vector(2 DOWNTO 0);
begin
--missing
  multiplex: function_81 port map( ABC=>ABC, y_81=>y_81);

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
