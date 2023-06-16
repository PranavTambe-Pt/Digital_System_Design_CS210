--author: Pranav Tambe 

library IEEE; 
use IEEE.std_logic_1164.all;

entity AND3 is 
 port( I0, I1,I2 : in std_logic; 
 O0 : out std_logic); 

end AND3;
architecture FUNCTIONALITY of AND3 is 
 signal S:std_logic;
begin
 S <= I0 and I1;
 O0<= S and I2;
 
 end FUNCTIONALITY;