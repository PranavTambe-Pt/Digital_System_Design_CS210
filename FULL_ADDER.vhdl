--author :Pranav Tambe
library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;
 entity FULL_ADDER is
        port(I0,I1,CIN : in std_logic;
             S, COUT: out std_logic);
 end FULL_ADDER;
architecture STRUCTURE of FULL_ADDER is
 signal s0,c0,c1:std_logic;
begin
  	HA0: HALF_ADDER port map(I0,I1,s0,c0); 
      HA1:HALF_ADDER port map( s0,CIN,S,c1);
	U0:OR2 port map(c0,c1,COUT);
end STRUCTURE; 