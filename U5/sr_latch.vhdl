library ieee;
use ieee.std_logic_1164.all;
entity sr_latch is
  port (
    s : in std_logic;
    r : in std_logic;
    q : inout std_logic;
    q_not : inout std_logic
  );
end sr_latch;

architecture rtl of sr_latch is
    component nandgate 
    port (
        input1 : in std_logic;
        input2 : in std_logic;
        nand_result : out std_logic
      );
    end component;
begin
  nor_q : nandgate port map(input1 => r, input2 => q_not, nand_result => q);
  nor_q_not : nandgate port map(input1 => s, input2 => q, nand_result => q_not);
end rtl;
