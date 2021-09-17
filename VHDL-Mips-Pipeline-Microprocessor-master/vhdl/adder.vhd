library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_unsigned.all;

Entity adder is
    Port (A, B : in std_logic_vector(31 downto 0);
          Y    : out std_logic_vector(31 downto 0));
    End;

Architecture behave of adder is
    begin
    Y <= std_logic_vector(unsigned(A) + unsigned(B));
    end;
