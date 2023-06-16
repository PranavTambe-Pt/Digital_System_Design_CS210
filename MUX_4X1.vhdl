--author :Pranav Tambe
library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;
 entity MUX_4X1 is port(I : in std_logic_vector(3 downto 0); -- Inputs 
                        S : in std_logic_vector(1 downto 0); -- Select lines
                        O0 : out std_logic); -- Output 
end MUX_4X1;  

architecture STRUCTURE of MUX_4X1 is
signal sig: std_logic_vector(1 downto 0);
begin
	MUX1:MUX_2X1 port map(I(0),I(1),S(0),sig(0));  --First stage of selection with S0 as select line and I0 and  I1 as inputs to this 2X1 MUX 
  	MUX2:MUX_2X1 port map(I(2),I(3),S(0),sig(1)) ; --First stage of selection with S0 as select line and I2 and  I3 as inputs to this 2X1 MUX 
	MUX3:MUX_2X1 port map(sig(0),sig(1),S(1),O0) ; --second stage of selection with S1 as select line and intermediate signals as inputs to this 2X1 MUX 

end STRUCTURE;   
