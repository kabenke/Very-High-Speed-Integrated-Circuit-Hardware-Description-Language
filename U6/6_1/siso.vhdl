library ieee;
use ieee.std_logic_1164.all;
entity siso is
  port (
    clk : in std_logic;
    i_data : in std_logic;
    reset : in std_logic;
    q : out std_logic
  );
end siso;

architecture rtl of siso is
    component d_flip_flop_sync_reset
    port (
        clk : in std_logic;
        d : in std_logic;
        reset : in std_logic;
        q : inout std_logic;
        q_not : inout std_logic
      );
    end component;

    signal q_wire : std_logic_vector(7 downto 0);

begin
    register_0 : d_flip_flop_sync_reset port map(clk => clk, d => i_data, reset => reset, q_not => q_wire(0));
    register_1 : d_flip_flop_sync_reset port map(clk => clk, d => q_wire(0), reset => reset, q_not => q_wire(1));
    register_2 : d_flip_flop_sync_reset port map(clk => clk, d => q_wire(1), reset => reset, q_not => q_wire(2));
    register_3 : d_flip_flop_sync_reset port map(clk => clk, d => q_wire(0), reset => reset, q_not => q_wire(3));
    register_4 : d_flip_flop_sync_reset port map(clk => clk, d => q_wire(3), reset => reset, q_not => q_wire(4));
    register_5 : d_flip_flop_sync_reset port map(clk => clk, d => q_wire(4), reset => reset, q_not => q_wire(5));
    register_6 : d_flip_flop_sync_reset port map(clk => clk, d => q_wire(5), reset => reset, q_not => q_wire(6));
    register_7 : d_flip_flop_sync_reset port map(clk => clk, d => q_wire(6), reset => reset, q_not => q_wire(7));
    q <= q_wire(7);
end rtl;
