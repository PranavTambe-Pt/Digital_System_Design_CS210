--author: Pranav Tambe
library ieee;
use ieee.std_logic_1164.all;
use work.CS210.all;
entity BCD_CONVERTER is
port(A: in std_logic_vector(3 downto 0);
	C : out std_logic_vector(4 downto 0) 
	 ); 
end BCD_CONVERTER;  

architecture STRUCTURE of   BCD_CONVERTER is
signal S1,S2,S3,S4,S5,S6,S7,S8:std_logic;
signal B:std_logic_vector(3 downto 0);

begin
C(0)<=A(0);
FA1:XOR2 port map (A(0),A(1),C(1));
FA2:OR2 port map(A(1),A(0),S1);
FA3: XOR2 port map(S1,A(2),C(2));
FA4: NOT1 port map(S1,S2);
FA5:OR2 port map(S2,A(2),S3);
FA6:AND2 port map(S3,A(3),C(3));
Abank:
for i in 0 to 3 generate 
	FA1: NOT1 port map (A(i), B(i));
end generate;
FA7:AND2 port map(S1,B(2),S4);
FA8:AND2 port map(S4,B(3),S5);
FA9:AND2 port map(A(3),A(2),S6);
FA10:OR2 port map(B(0),B(1),S7);
FA11:AND2 port map(S6,S7,S8);
FA12:OR2 port map(S8,S5,C(4));




end STRUCTURE;


