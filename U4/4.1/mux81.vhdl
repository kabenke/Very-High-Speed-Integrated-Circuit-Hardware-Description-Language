LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux81 IS
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
END mux81;

ARCHITECTURE rtl OF mux81 IS

    COMPONENT andgate1 IS
        PORT (
            input1 : IN std_logic;
            input2 : IN std_logic;
            and_result : OUT std_logic);
    END COMPONENT;
    COMPONENT mux41 IS
        PORT (
            i1 : IN std_logic_vector(2 DOWNTO 0); 
            i2 : IN std_logic_vector(2 DOWNTO 0);
            i3 : IN std_logic_vector(2 DOWNTO 0);
            i4 : IN std_logic_vector(2 DOWNTO 0);
            sel : IN std_logic_vector(1 DOWNTO 0); 
            y : OUT std_logic_vector(2 DOWNTO 0)
        );
    END COMPONENT;
   signal y1,y2,y3,y4 : std_logic_vector(2 DOWNTO 0);
   signal  s : std_logic_vector(1 DOWNTO 0);
   signal not_sel:std_logic;
begin
 s(0)<=sel_81(0);
 s(1)<=sel_81(1);
 multiplex1: mux41 port map(i1 => i1_81, i2 => i2_81, i3 => i3_81, i4 =>i4_81, sel=>s, y=>y1);
 multiplex2: mux41 port map(i1 => i5_81  , i2 => i6_81, i3 => i7_81, i4 =>i8_81, sel=>s, y=>y2);
 not_sel<= (not sel_81(2));
 and_gate_assignment : for i in 0 to 2 generate
	 and_output1: andgate1 port map(input1=>not_sel,input2=>y1(i), and_result=>y3(i));
	 and_output2: andgate1 port map(input1=>sel_81(2),input2=>y2(i), and_result=>y4(i));
 end generate and_gate_assignment;
 --y3<= (not sel_81(2)) & y1;
 --y4<= sel_81(2) & y1;
 y_81 <= y3 or y4;
 --y_81 <= y2 when (sel_81(2) = '1') else y1;

end rtl;
