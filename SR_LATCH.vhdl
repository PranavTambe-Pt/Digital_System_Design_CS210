--author :Pranav Tambe
library IEEE;
use IEEE.std_logic_1164.all;
entity SR_LATCH is -- Entity declaration 
  	port(  S : in std_logic; -- Set input of the SR latch 
  		  R : in std_logic; -- Reset input of the SR latch 
           Q : buffer std_logic; -- Q output of the SR latch 
          QN : out std_logic); -- Q_bar output of the SR latch    
end SR_LATCH;      
architecture STRUCTURE of SR_LATCH is  
  
begin
process(S,R)
  begin
	if R='0' then
       Q<='1';
	elsif R='1' and S='0' then
		Q<='0';
	elsif R='1' and s='1' then
		Q<=Q;
  end if;
  end process; 
	QN<=not Q;
end STRUCTURE;


 
                                                                                                                 