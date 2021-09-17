library ieee;
use ieee.std_logic_1164.all;
entity xorgate is
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    input3: in std_logic;
    xor_result_delayed : out std_logic
  );
end xorgate;

architecture rtl of xorgate is
  signal xor_gate : std_logic;
begin
  xor_gate <= input1 xor input2 xor input3;
  xor_result_delayed <= xor_gate after 5 ns;
end rtl;
