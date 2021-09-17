library ieee;
use ieee.std_logic_1164.all;

entity aludecoder_tb is
end entity;

architecture testbench of aludecoder_tb is
  component aludec port(
    funct: in std_logic_vector(5 downto 0);
    aluop: in std_logic_vector(1 downto 0);
    alucontrol: out std_logic_vector(2 downto 0)
  );
  end component;

    signal funct: std_logic_vector(5 downto 0):="000000";
    signal aluop: std_logic_vector(1 downto 0):="00";
    signal alucontrol: std_logic_vector(2 downto 0);
--missing  

	
begin

    DUT:
    	aludec 
    	port map(
    	    funct => funct,
	    aluop => aluop,
	    alucontrol => alucontrol);
	    
 -- Clock process definitions
    STIMULUS:
    process begin
    	    aluop <="00" after 0 ns, "01" after 10 ns, "11" after 20 ns;
	    funct <="100000" after 0 ns, "100010" after 10 ns, "100100" after 20 ns, "100101" after 30 ns,"101010" after 40 ns, "111110" after 50 ns;
	    wait;
   end process;
end testbench;
