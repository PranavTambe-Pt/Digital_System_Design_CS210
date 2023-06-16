--author:Pranav Tambe
library ieee;

use ieee.std_logic_1164.all;
use work.CS210.all;
entity MULTIPLIER is -- Entity declaration
       port(A, B : in std_logic_vector(3 downto 0); -- Inputs of the multiplier A(First no) X B(Second Number)
        P : out std_logic_vector(7 downto 0)); -- Output of the multiplier
end MULTIPLIER;

architecture STRUCTURE of MULTIPLIER is

signal SIG_I1:std_logic_vector(3 downto 0);
signal SIG_I2:std_logic_vector(3 downto 0);
signal SIG_I3:std_logic_vector(4 downto 0);
signal SIG_I4:std_logic_vector(3 downto 0);
signal SIG_I5:std_logic_vector(3 downto 0);
signal SIG_I6:std_logic_vector(4 downto 0);
signal SIG_I7:std_logic_vector(3 downto 0);
signal SIG_I8:std_logic_vector(3 downto 0);
signal SIG_I9:std_logic_vector(4 downto 0);
begin
FA:AND2 port map (A(0),B(0),P(0)); --P(0) X 2^0 is a0 X b0
ABank: 
for i in 0 to 2 generate 
	FA0: AND2 port map (A(i+1), B(0), SIG_I1(i)); --rest 3 bits with a3 X b0  a2 X b0  a1 X b0  
end generate;
SIG_I1(3)<='0'; -- MSB of SIG_I1 is 0

BBank:
for i in 0 to 3 generate 
	FA1: AND2 port map (A(i), B(1), SIG_I2(i)); --SIG_I2 as  a3 X b1  a2 X b1 a1 X b1 a0 X b1
end generate;

FA2:FOUR_BIT_ADDER port map (SIG_I1,SIG_I2 ,'0', SIG_I3); --First Stage adition of SIG_I1 and SIG_I2 generating 5 bit SIG_I3

P(1)<=SIG_I3(0); --P(1) X 2^1 is SIG_I3(0)
CBank:
for i in 0 to 3 generate
	FA3: AND2 port map (A(i), B(2), SIG_I4(i));  --SIG_I4 as  a3 X b2  a2 X b2 a1 X b2 a0 X b2
end generate;
DBank:
for i in 0 to 3 generate
	SIG_I5(i)<=SIG_I3(i+1); --as SIG_I3 is 5 bit and LSB is P(1) and we have assigned it so rest 4 bits are put in SIG_I5 with 4 bits
end generate;

FA4:FOUR_BIT_ADDER port map (SIG_I4,SIG_I5,'0', SIG_I6); --Second Stage adition of SIG_I4 and SIG_I5 generating 5 bit SIG_I6
P(2)<=SIG_I6(0); --P(2) X 2^2 is SIG_I6(0)
EBank:
for i in 0 to 3 generate
	SIG_I7(i)<=SIG_I6(i+1); --as SIG_I6 is 5 bit and LSB is P(2) and we have assigned it so rest 4 bits are put in SIG_I7 with 4 bits
end generate;

FBank:
for i in 0 to 3 generate
	FA5: AND2 port map (A(i), B(3), SIG_I8(i)); --SIG_I8 as  a3 X b3  a2 X b3 a1 X b3 a0 X b3
end generate;

FA6:FOUR_BIT_ADDER port map (SIG_I7,SIG_I8,'0', SIG_I9); --Third Stage adition of SIG_I7 and SIG_I8 generating 5 bit SIG_I9
GBank:
for i in 0 to 4 generate
	 p(3+i)<=SIG_I9(i); --P(3) to P(7) 5 bits are SIG_9 from  SIG_9(0) to  SIG_9(4)
end generate;

end STRUCTURE;





 





 






 
