library ieee;
use ieee.std_logic_1164.all;

entity multiplier_parallel is
  port (
    x : in std_logic_vector(3 downto 0);
    y : in std_logic_vector(3 downto 0);
    p : out std_logic_vector(7 downto 0)
  );
end multiplier_parallel;

architecture rtl of multiplier_parallel is
  component andgate
    port (
      input1 : in std_logic;
      input2 : in std_logic;
      and_result : out std_logic
    );
  end component;

  component ha
    port (
      a: in std_logic;
      b: in std_logic;
      o: out std_logic;
      c: out std_logic
    );
  end component;

  component fa
    port (
      a : in std_logic;
      b : in std_logic;
      cin : in std_logic;
      sum: out std_logic;
      cout: out std_logic
    );
  end component;

  signal c1, c2, c3 : std_logic_vector(3 downto 0);
  signal s1, s2, s3 : std_logic_vector(3 downto 0);
  signal xy0, xy1, xy2, xy3 : std_logic_vector(3 downto 0);

  begin
    x_0_and_y_0 : andgate port map(input1 => y(0), input2 => x(0), and_result => xy0(0));
    x_1_and_y_0 : andgate port map(input1 => y(0), input2 => x(1), and_result => xy0(1));
    x_2_and_y_0 : andgate port map(input1 => y(0), input2 => x(2), and_result => xy0(2));
    x_3_and_y_0 : andgate port map(input1 => y(0), input2 => x(3), and_result => xy0(3));

    x_0_and_y_1 : andgate port map(input1 => y(1), input2 => x(0), and_result => xy1(0));
    x_1_and_y_1 : andgate port map(input1 => y(1), input2 => x(1), and_result => xy1(1));
    x_2_and_y_1 : andgate port map(input1 => y(1), input2 => x(2), and_result => xy1(2));
    x_3_and_y_1 : andgate port map(input1 => y(1), input2 => x(3), and_result => xy1(3));

    x_0_and_y_2 : andgate port map(input1 => y(2), input2 => x(0), and_result => xy2(0));
    x_1_and_y_2 : andgate port map(input1 => y(2), input2 => x(1), and_result => xy2(1));
    x_2_and_y_2 : andgate port map(input1 => y(2), input2 => x(2), and_result => xy2(2));
    x_3_and_y_2 : andgate port map(input1 => y(2), input2 => x(3), and_result => xy2(3));

    x_0_and_y_3 : andgate port map(input1 => y(3), input2 => x(0), and_result => xy3(0));
    x_1_and_y_3 : andgate port map(input1 => y(3), input2 => x(1), and_result => xy3(1));
    x_2_and_y_3 : andgate port map(input1 => y(3), input2 => x(2), and_result => xy3(2));
    x_3_and_y_3 : andgate port map(input1 => y(3), input2 => x(3), and_result => xy3(3));

    fa_1_1 : fa port map(a => xy0(2), b => xy1(1), cin => c1(0), cout => c1(1), sum =>s1(1));
    fa_1_2 : fa port map(a => xy0(3), b => xy1(2), cin => c1(1), cout => c1(2), sum =>s1(2));
    fa_2_1 : fa port map(a => s1(2), b => xy2(1), cin => c2(0), cout => c2(1), sum =>s2(1));
    fa_2_2 : fa port map(a => s1(3), b => xy2(2), cin => c2(1), cout => c2(2), sum =>s2(2));
    fa_2_3 : fa port map(a => c1(3), b => xy2(3), cin => c2(2), cout => c2(3), sum =>s2(3));
    fa_3_1 : fa port map(a => s2(2), b => xy3(1), cin => c3(0), cout => c3(1), sum =>s3(1));
    fa_3_2 : fa port map(a => s2(3), b => xy3(2), cin => c3(1), cout => c3(2), sum =>s3(2));
    fa_3_3 : fa port map(a => c2(3), b => xy3(3), cin => c3(2), cout => c3(3), sum => s3(3));
    
    ha_1_1 : ha port map(a => xy0(1), b => xy1(0), c => c1(0),o => s1(0));
    ha_1_2 : ha port map(a => xy1(3), b => c1(2), c => c1(3),o => s1(3));
    ha_2 : ha port map(a => s1(1), b => xy2(0), c => c2(0),o => s2(0));
    ha_3 : ha port map(a => s2(1), b => xy3(0), c => c3(0),o => s3(0));

    p(0) <= xy0(0);
    p(1) <= s1(0);
    p(2) <= s2(0);
    p(3) <= s3(0);
    p(4) <= s3(1);
    p(5) <= s3(2);
    p(6) <= s3(3);
    p(7) <= c3(3);
end rtl;