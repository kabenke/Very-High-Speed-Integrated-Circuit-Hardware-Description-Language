library ieee;
use ieee.std_logic_1164.all;
entity d_flip_flop_sync_reset is
  port (
    clk : in std_logic;
    d : in std_logic;
    reset : in std_logic;
    q : inout std_logic;
    q_not : inout std_logic
  );
end d_flip_flop_sync_reset;

architecture rtl of d_flip_flop_sync_reset is
    component notgate
    port (
        input1 : in std_logic;
        not_result : out std_logic
    );
    end component;

    component norgate
    port (
        input1 : in std_logic;
        input2 : in std_logic;
        nor_result : out std_logic
    );
    end component;

    component d_latch 
    port (
        clk : in std_logic;
        d : in std_logic;
        q : inout std_logic;
        q_not : inout std_logic
      );
    end component;

    signal clk_not : std_logic;
    signal d_not : std_logic;
    signal master_q : std_logic;
    signal data_resetted : std_logic;
   -- signal master_not_q : std_logic;

begin
    --not_d : notgate port map(input1 => d, not_result => d_not);
    reset_data : norgate port map(input1 => reset, input2 => d, nor_result => data_resetted);
    not_clk : notgate port map(input1 => clk, not_result => clk_not);
    master : d_latch port map(clk => clk_not, d => data_resetted, q => master_q, q_not => open);
    slave : d_latch port map(clk => clk, d => master_q, q => q, q_not => q_not);
end rtl;
