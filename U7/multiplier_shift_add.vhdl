library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity multiplier_shift_add is
  port (
    x : in std_logic_vector(3 downto 0);
    y : in std_logic_vector(3 downto 0);
    p : out std_logic_vector(7 downto 0)
  );
end multiplier_shift_add;

architecture rtl of multiplier_shift_add is
  begin
    process (x, y)
    variable multiplicand, product, multiplier: std_logic_vector(7 downto 0);
    variable add_to_product: std_logic_vector(7 downto 0);
    begin
      product := "00000000";
      multiplicand := "0000" & x;
      multiplier := "0000" & y;
      add_to_product := "00000000";
      for I in 0 to 3 loop
        if (multiplier(0) = '1') then
          add_to_product := multiplicand;
        else 
          add_to_product := "00000000";
        end if;
      product := std_logic_vector(unsigned(product) + unsigned(add_to_product));
      multiplicand := multiplicand(6 downto 0) & "0";
      multiplier := "0" & multiplicand(7 downto 1);
      end loop;
      p <= product;
     -- wait on y, x;
    end process;
    
end rtl;