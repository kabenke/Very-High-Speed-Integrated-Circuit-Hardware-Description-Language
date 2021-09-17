library ieee;
use ieee.std_logic_1164.all;

entity mux81_tb is
end mux81_tb;

architecture testbench of mux81_tb is
  component mux81
    port ( i1_81 : IN std_logic_vector(2 DOWNTO 0); 
        i2_81 : IN std_logic_vector(2 DOWNTO 0);
        i3_81 : IN std_logic_vector(2 DOWNTO 0);
        i4_81 : IN std_logic_vector(2 DOWNTO 0);
        i5_81 : IN std_logic_vector(2 DOWNTO 0);
        i6_81 : IN std_logic_vector(2 DOWNTO 0);
        i7_81 : IN std_logic_vector(2 DOWNTO 0);
        i8_81 : IN std_logic_vector(2 DOWNTO 0);
        sel_81 : IN std_logic_vector(2 DOWNTO 0); 
        y_81 : OUT std_logic_vector(2 DOWNTO 0));
  end component;

--missing
signal y_81 : std_logic_vector(2 DOWNTO 0);
signal  sel_81 : std_logic_vector(2 DOWNTO 0);  
begin
    multiplex: mux81 port map(i1_81 => "000", i2_81 => "001", i3_81 => "010", i4_81 =>"011", i5_81=>"100",i6_81 => "101", i7_81 => "110", i8_81 => "111", sel_81=>sel_81, y_81=>y_81 );

    process begin
        sel_81 <= "000";
        wait for 10 ns;
        sel_81 <= "010";
        wait for 10 ns;
        sel_81 <= "001";
        wait for 10 ns;
        sel_81 <= "011";
        wait for 10 ns;
        sel_81 <= "100";
        wait for 10 ns;
        sel_81 <= "110";
        wait for 10 ns;
        sel_81 <= "101";
        wait for 10 ns;
        sel_81 <= "111";
        wait for 10 ns;
        wait;
    end process;
end testbench;
