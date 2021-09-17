library ieee;
use ieee.std_logic_1164.all;

entity rca is
  port (
    a : in std_logic_vector(7 downto 0);
    b : in std_logic_vector(7 downto 0);
    --
    cin: in std_logic_vector(6 downto 0);
    sum : out std_logic_vector(7 downto 0)
  );
end rca;

architecture rtl of rca is
  component fa
    port (
      a : in std_logic;
      b : in std_logic;
      cin : in std_logic;
      cout : out std_logic;
      sum : out std_logic
    );
  end component;
  signal wire_1 : std_logic;
  signal wire_2 : std_logic;
  signal wire_3 : std_logic;
  signal wire_4 : std_logic;
  signal wire_5 : std_logic;
  signal wire_6 : std_logic;
  signal wire_7 : std_logic;
  signal wire_8 : std_logic;
  signal c : std_logic;
  -- more wires ?
begin
  add0 : fa port map(a => a(0), b => b(0), cin => '0', cout => wire_1, sum => sum(0));
  add1 : fa port map(a => a(1), b => b(1), cin => cin(0), cout => wire_2, sum => sum(1));
  add2 : fa port map(a => a(2), b => b(2), cin => cin(1), cout => wire_3, sum => sum(2));
  add3 : fa port map(a => a(3), b => b(3), cin => cin(2), cout => wire_4, sum => sum(3));
  add4 : fa port map(a => a(4), b => b(4), cin => cin(3), cout => wire_5, sum => sum(4));
  add5 : fa port map(a => a(5), b => b(5), cin => cin(4), cout => wire_6, sum => sum(5));
  add6 : fa port map(a => a(6), b => b(6), cin => cin(5), cout => wire_7, sum => sum(6));
  add7 : fa port map(a => a(7), b => b(7), cin => cin(6), cout => wire_8, sum => sum(7));
-- ?
end rtl;
