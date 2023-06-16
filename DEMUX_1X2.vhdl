--author :Pranav Tambe
library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;
 entity DEMUX_1X2 is port(I0, S0 : in std_logic; -- Inputs
                          O0, O1 : out std_logic); -- Outputs
 end DEMUX_1X2;  

architecture STRUCTURE of DEMUX_1X2 is
signal SIG_S0 :std_logic;
begin
	U0:NOT1 port map(S0,SIG_S0); --Compliment of select line S0
  	U1: AND2 port map(I0,SIG_S0,O0); --Output O0 by AND operation (Product)  on I0 and Compliment of select line S0
      U2: AND2 port map(I0,S0,O1); --Output O1 by AND operation (Product)  on I1 and select line S0
end STRUCTURE;   