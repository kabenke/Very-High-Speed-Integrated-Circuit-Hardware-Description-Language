LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY function_41 IS
    PORT (
        ABC : IN std_logic_vector(2 DOWNTO 0);
        y_41 : OUT std_logic_vector(2 DOWNTO 0));
END function_41;

ARCHITECTURE rtl OF function_41 IS

    component mux41 is 
        PORT (
        i1 : IN std_logic_vector(2 DOWNTO 0); 
        i2 : IN std_logic_vector(2 DOWNTO 0);
        i3 : IN std_logic_vector(2 DOWNTO 0);
        i4 : IN std_logic_vector(2 DOWNTO 0);
        sel : IN std_logic_vector(1 DOWNTO 0); 
        y : OUT std_logic_vector(2 DOWNTO 0)
        );
    end component mux41;
    signal AB:std_logic_vector(1 DOWNTO 0);
    signal C : std_logic_vector(2 DOWNTO 0);
begin
--missing
 AB(0)<= ABC(0);
 AB(1)<= ABC(1);
 C <="000" when ABC(2) = '0' else
     "010";
 mux: mux41 port map(i1 => "000", i2 => "000", i3 => C, i4 =>"011", sel=>AB, y=>y_41);
 
end rtl;
