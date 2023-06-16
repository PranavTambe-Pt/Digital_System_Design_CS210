  --author: Pranav Tambe
library ieee;
use ieee.std_logic_1164.all;
use work.CS210.all;
entity BCD_ADD_SUB1 is					     -- Entity declaration
      port(A, B : in std_logic_vector(3 downto 0);   -- Input BCD numbers
           A_SBAR : in std_logic;                    -- 1 for addition, 0 for subtraction
           Y : out std_logic_vector(7 downto 0);     -- Output XS3 number
          INVA : out std_logic;                      -- Invalid input A 
          INVB : out std_logic);                     -- Invalid input B 
end BCD_ADD_SUB1;  

architecture STRUCTURE of   BCD_ADD_SUB1 is

signal C,D, E,X,X1,H,J,L,M,O,P,Q:std_logic_vector(3 downto 0);
signal C1,D1,F,G,I1,K,N:std_logic_vector(4 downto 0);
signal NA_SBAR,NK:std_logic;
  

begin
FA1:BCD_CONVERTER port map (A,C1);
FA2:BCD_CONVERTER port map (B,D1);
INVA<=C1(4);INVB<=D1(4);
C1bank:
for i in 0 to 3 generate 
	 C(i)<=C1(i);
	D(i)<=D1(i);
end generate;
 

FA3:NOT1 port map(A_SBAR,NA_SBAR);
Bbank:
for i in 0 to 3 generate 
	FA3: XOR2 port map (NA_SBAR, D(i),E(i));
end generate;
FA4:FOUR_BIT_ADDER port map (C,E,NA_SBAR,F);
Cbank:

for i in 0 to 3 generate 
	 X(i)<=F(i);


end generate;
J(3)<='0';J(2)<='1';J(1)<='1';J(0)<='0';
PT:FOUR_BIT_ADDER port map (X,J,'0',K);
PT1:NOT1 port map(K(4),NK);
T2bank:
for i in 0 to 3 generate 
	 PT3:AND2 port map(K(4),K(i),L(i));
       PT4:AND2 port map (NK,F(i),M(i));
end generate;
PT5:FOUR_BIT_ADDER port map (L,M,'0',N);



C5bank:
for i in 0 to 3 generate 
	 O(i)<=N(i);
end generate;
P(3)<='0';P(2)<='0';P(1)<='0';P(0)<=K(4);  



H(3)<='0';H(2)<='0';H(1)<='1';H(0)<='1';
FA6:FOUR_BIT_ADDER port map (O,H,'0',G);
FA7:FOUR_BIT_ADDER port map (P,H,'0',I1); 

Dbank:
for i in 0 to 3 generate 
	 Y(i)<=G(i);
      
end generate;
Y(4)<=I1(0);Y(5)<=I1(1); Y(6)<=I1(2); Y(7)<=I1(3); 
 


end STRUCTURE;

 
 

 

