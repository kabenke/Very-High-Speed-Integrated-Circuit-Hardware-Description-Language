library ieee;
use ieee.std_logic_1164.all;
entity d_latch is
  port (
    clk : in std_logic;
    d : in std_logic;
    q : inout std_logic;
    q_not : inout std_logic
  );
end d_latch;

architecture rtl of d_latch is
    component notgate
    port (
        input1 : in std_logic;
        not_result : out std_logic
    );
    end component;

    component nandgate 
    port (
        input1 : in std_logic;
        input2 : in std_logic;
        nand_result : out std_logic
      );
    end component;

    component sr_latch
    port (
        s : in std_logic;
        r : in std_logic;
        q : inout std_logic;
        q_not : inout std_logic
    );
    end component;

    signal d_not : std_logic;
    signal and_wire_1 : std_logic;
    signal and_wire_2 : std_logic;

begin
    not_d : notgate port map(input1 => d, not_result => d_not);
    and_1 : nandgate port map(input1 => clk, input2 => d_not, nand_result => and_wire_1);
    and_2 : nandgate port map(input1 => d, input2 => clk, nand_result => and_wire_2);
    sr : sr_latch port map(r => and_wire_1, s => and_wire_2, q => q, q_not => q_not);
end rtl;
