--author :Pranav Tambe
library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;
 entity HALF_ADDER is
        port(I0, I1 : in std_logic;
             S, C : out std_logic);
 end HALF_ADDER;
architecture STRUCTURE of HALF_ADDER is
begin
  	U0: XOR2 port map(I0,I1,S); 
      U1: AND2 port map(I0,I1,C);
end STRUCTURE;                         
       