LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY function_81 IS
    PORT (
        ABC : IN std_logic_vector(2 DOWNTO 0); 
        y_81 : OUT std_logic_vector(2 DOWNTO 0));
END function_81;

ARCHITECTURE rtl OF function_81 IS

    component mux81 is 
        PORT ( 
        i1_81 : IN std_logic_vector(2 DOWNTO 0); 
        i2_81 : IN std_logic_vector(2 DOWNTO 0);
        i3_81 : IN std_logic_vector(2 DOWNTO 0);
        i4_81 : IN std_logic_vector(2 DOWNTO 0);
        i5_81 : IN std_logic_vector(2 DOWNTO 0);
        i6_81 : IN std_logic_vector(2 DOWNTO 0);
        i7_81 : IN std_logic_vector(2 DOWNTO 0);
        i8_81 : IN std_logic_vector(2 DOWNTO 0);
        sel_81 : IN std_logic_vector(2 DOWNTO 0); 
        y_81 : OUT std_logic_vector(2 DOWNTO 0));
    end component mux81;
 signal y1,y2,y3,y4 : std_logic_vector(2 DOWNTO 0);
begin
--missing
  multiplex: mux81 port map(i1_81 => "000", i2_81 => "000", i3_81 =>"000" , i4_81 =>"000",i5_81 => "000", i6_81 => "101", i7_81 => "110", i8_81 =>"111", sel_81=>ABC, y_81=>y_81);
  
end rtl;
