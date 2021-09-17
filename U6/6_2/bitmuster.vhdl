library ieee;
use ieee.std_logic_1164.all;

entity bitmuster is
    port(
            clk, reset, data: in std_logic;
            y: out STD_LOGIC
    );
end bitmuster;

architecture synth of bitmuster is
  type statetype is (q0, q1, q2, q3, q4, q5);
  signal state, nextstate: statetype;
begin
    uebergang: process (clk, reset) begin
        if reset = '1' then state <= q0;
        elsif (rising_edge(clk)) then
          state <= nextstate;
        else
          null;
        end if;
    end process;

    next_state: process (state, data) begin
      y <= '0';
        case state is

            when q0 => 
                if (data = '1') then
                    nextstate <= q1;
                else nextstate <= q0;
                end if; 

            when q1 =>
                if (data = '0') then
                    nextstate <= q2;
                else nextstate <= q0;
                end if; 

            when q2 => 
                if (data = '1') then
                    nextstate <= q3;
                else nextstate <= q0;
                end if; 
          
            when q3 => 
                if (data = '0') then
                    nextstate <= q4;
                else nextstate <= q0;
                end if; 

            when q4=> 
                if (data = '1') then
                    nextstate <= q5;
                else nextstate <= q0;
                end if; 

            when q5 => 
                y <= '1';
                nextstate <= q5;   

        end case;
    end process;
end;
