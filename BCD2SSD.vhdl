--author:Pranav Tambe
library ieee;
use ieee.std_logic_1164.all;
use work.CS210.all;

entity BCD2SSD is -- Entity declaration
	port(X : in std_logic_vector(3 downto 0); -- Input BCD number
	Y : out std_logic_vector(6 downto 0); -- Output SSD code
	F : out std_logic); -- Invalid input indicator
end BCD2SSD;

architecture STRUCTURE of BCD2SSD  is
 signal IV,MS:std_logic;
 signal S:std_logic_vector(10 downto 0);
 signal NX:std_logic_vector(3 downto 0);

begin 
ABank: 
for i in 0 to 3 generate 
	FA0: NOT1 port map (X(i),NX(i)); 
end generate;

A0:OR2 port map(X(2),X(1),IV);
A1:AND2 port map(IV,X(3),F);

U0: AND3 port map(NX(1),NX(2),NX(3),S(0));
U1: AND3 port map(X(1),X(0),X(2),S(1));
U2: OR2 port map(S(0),S(1),Y(0));
U3: AND3 port map(X(0),NX(2),NX(3),S(2));
U4: AND2 port map(X(1),NX(2),S(3));
U5: AND2 port map(X(1),X(0),S(4));
U6: OR2 port map(S(2),S(3),S(5));
U7: OR2 port map(S(4),S(5),Y(1));
U8: AND2 port map(NX(1),X(2),S(6));
U9: OR2 port map(S(6),X(0),Y(2));
MU0: AND2 port map(S(0),X(0),MS);
U10:OR2 port map(MS,S(1),S(7));
U11: AND3 port map(NX(1),NX(0),X(2),S(8));
U12: OR2 port map(S(7),S(8),Y(3));
U13: AND3 port map(NX(0),NX(2),X(1),Y(4)); 
U14: XOR2 port map(X(1),X(0),S(9));
U15:AND2 port map(S(9),X(2),Y(5));
U16: AND2 port map(S(0),X(0),S(10));
U17:OR2 port map(S(10),S(8),Y(6));

end STRUCTURE;