--author :Pranav Tambe
library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;
  entity DEMUX_1X4 is port(I0 : in std_logic; -- Input 
                            S : in std_logic_vector(1 downto 0); -- Select lines 
                            O : out std_logic_vector(3 downto 0)); -- Outputs 
                             end DEMUX_1X4;


architecture STRUCTURE of DEMUX_1X4 is
signal sig: std_logic_vector(1 downto 0);
begin
	DMUX1:DEMUX_1X2 port map(I0,S(1),sig(0),sig(1));  --  selection with S0 as select line and I0 as input to this 1X2 DEMUX and O0 and O1 as outputs
  	DMUX2:DEMUX_1X2 port map(sig(0),S(0),O(0),O(1)) ; --selection with S1 as select line and I0 as input to this 1X2 DEMUX and O1 and O3 as outputs
	DMUX3:DEMUX_1X2 port map(sig(1),S(0),O(2),O(3)) ; 
end STRUCTURE;   