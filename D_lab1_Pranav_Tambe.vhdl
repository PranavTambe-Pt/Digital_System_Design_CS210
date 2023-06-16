library IEEE; 
use IEEE.std_logic_1164.all;

entity D_lab1_Pranav_Tambe is 
 port( I0, I1 : in std_logic; 
 O0 : out std_logic); 

end D_lab1_Pranav_Tambe;
architecture FUNCTIONALITY of D_lab1_Pranav_Tambe is 

begin
 O0 <= I0 or I1; 
 end FUNCTIONALITY;