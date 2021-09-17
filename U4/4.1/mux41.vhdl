LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
--the 4:1 multiplexer to be designed consists of four 3-bit inputs, i.e., i1, i2, i3 and i4.
--sel is a 2-bit select signal.
--y is the output
ENTITY mux41 IS
    PORT (
        i1 : IN std_logic_vector(2 DOWNTO 0); 
        i2 : IN std_logic_vector(2 DOWNTO 0);
        i3 : IN std_logic_vector(2 DOWNTO 0);
        i4 : IN std_logic_vector(2 DOWNTO 0);
        sel : IN std_logic_vector(1 DOWNTO 0); 
        y : OUT std_logic_vector(2 DOWNTO 0)
        );
END mux41;

ARCHITECTURE rtl OF mux41 IS
--you can add more components you need
--you can also increase the number of inputs, e.g., the "and" gate blow is extended to a 3-input gate.

    COMPONENT andgate IS
        PORT (
            input1 : IN std_logic;
            input2 : IN std_logic;
	    input3 : IN std_logic;
            and_result : OUT std_logic);
    END COMPONENT;

--you can define more signals here if you need, e.g.,:
    signal not_sel : std_logic_vector(1 DOWNTO 0); 
    signal y1,y2,y3,y4 : std_logic_vector(2 DOWNTO 0); 

BEGIN

--bitwise operation for each logic gate because the input signals are multilple-bit signals.
--please complete the implementation based on the schema you designed.
    not_sel(0)<= (not sel(0));
    not_sel(1)<= (not sel(1));
    and_gate_assignment : for i in 0 to 2 generate
        and_output1: andgate port map(input1=>i1(2-i),input2=>not_sel(1), input3=>not_sel(0), and_result=>y1(2-i));
        and_output2: andgate port map(input1=>i2(2-i),input2=>not_sel(1), input3=>sel(0), and_result=>y2(2-i));
        and_output3: andgate port map(input1=>i3(2-i),input2=>sel(1), input3=>not_sel(0), and_result=>y3(2-i));
        and_output4: andgate port map(input1=>i4(2-i),input2=>sel(1), input3=>sel(0), and_result=>y4(2-i));
    end generate and_gate_assignment;

    y<= y1 or y2 or y3 or y4;
END rtl;
