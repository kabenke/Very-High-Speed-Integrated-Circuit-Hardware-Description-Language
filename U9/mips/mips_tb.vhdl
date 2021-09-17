library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mips_tb is
end entity;

architecture testbench of mips_tb is
  component mips
   port(
    clk: in std_logic;
    reset: in std_logic;
    pc: buffer std_logic_vector(31 downto 0);
    instr: in std_logic_vector(31 downto 0);
    readdata: in std_logic_vector(31 downto 0);
    aluout: buffer std_logic_vector(31 downto 0);
    writedata: buffer std_logic_vector(31 downto 0);
    memwrite: out std_logic
  );
  end component;
  
    constant clk_period : time := 40 ns;

    signal  clk: std_logic:='0';
    signal reset: std_logic:= '0';
    signal pc: std_logic_vector(31 downto 0);
    signal instr: std_logic_vector(31 downto 0):=(others => '0');
    signal readdata: std_logic_vector(31 downto 0):= (others => '0');
    signal aluout: std_logic_vector(31 downto 0);
    signal writedata: std_logic_vector(31 downto 0) ;
    signal memwrite: std_logic;
--missing  
begin

    DUT:
    	mips port map(clk,reset,pc,instr,readdata,aluout,writedata,memwrite);
	-- Clock process definitions
	clk_process :
	process
		begin
			clk <= '0';
			wait for clk_period/2;
			clk <= '1';
			wait for clk_period/2;
		end process;
	
    STIMULUS:
    process begin
	    
		reset <= '1';
        wait for clk_period*10;
        reset <= '0';
		--addi $t0 , $zero, 2
	    instr<= "00100000000010000000000000000010";
		wait for clk_period;
		if to_integer(unsigned(aluout))=2 then report "erste Wert ist korrekt";
		end if;
		--addi $t1 , $zero, 5
		instr<="00100000000010010000000000000101";
		wait for clk_period;
		if to_integer(unsigned(aluout))=5 then report "zweite Wert ist korrekt";
		end if;
		--add $t2, $1, $t0
		instr<="00000001001010000101000000100000";
		wait for clk_period;
		--j addition
		instr<="00001000000000000000000000000000";
		wait for clk_period;
		-- beq $t0, $t1, addition
		instr<="00010001000010010000000000000000";
		wait for clk_period;
	    wait;
   end process;
  
end testbench;
