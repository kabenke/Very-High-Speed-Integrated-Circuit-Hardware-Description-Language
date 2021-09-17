library ieee;
use ieee.std_logic_1164.all;

entity mux41_tb is
end mux41_tb;

architecture testbench of mux41_tb is
  component mux41
    port (
	i1 : IN std_logic_vector(2 DOWNTO 0); 
        i2 : IN std_logic_vector(2 DOWNTO 0);
        i3 : IN std_logic_vector(2 DOWNTO 0);
        i4 : IN std_logic_vector(2 DOWNTO 0);
        sel : IN std_logic_vector(1 DOWNTO 0); 
        y : OUT std_logic_vector(2 DOWNTO 0)
    );
  end component;

--missing
-- component function_41
  --  port (
	--i1 : IN std_logic_vector(2 DOWNTO 0); 
	--i2 : IN std_logic_vector(2 DOWNTO 0);
	--i3 : IN std_logic_vector(2 DOWNTO 0);
	--i4 : IN std_logic_vector(2 DOWNTO 0);
	--sel : IN std_logic_vector(1 DOWNTO 0); 
	--y : OUT std_logic_vector(2 DOWNTO 0)
    --);
 -- end component;
  signal y : std_logic_vector(2 DOWNTO 0);
  signal  sel : std_logic_vector(1 DOWNTO 0);  
begin
    multiplex: mux41 port map(i1 => "000", i2 => "001", i3 => "010", i4 =>"011", sel=>sel, y=>y);

    process begin
        sel <= "00";
        wait for 10 ns;
        sel <= "01";
        wait for 10 ns;
        sel <= "10";
        wait for 10 ns;
        sel <= "11";
        wait for 10 ns;
		sel <= "10";
        wait for 10 ns;
		sel <= "11";
        wait for 10 ns;
		
        wait;
    end process;
end testbench;
