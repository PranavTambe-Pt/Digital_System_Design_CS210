--author: Pranav Tambe
library ieee;
use ieee.std_logic_1164.all;
use work.CS210.all;
entity BCD_ADD_SUB is					     -- Entity declaration
      port(A, B : in std_logic_vector(3 downto 0);   -- Input BCD numbers
           A_SBAR : in std_logic;                    -- 1 for addition, 0 for subtraction
           Y : out std_logic_vector(7 downto 0);     -- Output XS3 number
          INVA : out std_logic;                      -- Invalid input A 
          INVB : out std_logic);                     -- Invalid input B 
end BCD_ADD_SUB;  

architecture STRUCTURE of   BCD_ADD_SUB is
signal C,D, E,X,X1,H,J,L,M,O,P,Q:std_logic_vector(3 downto 0);
signal C1,D1,F,G,I1,K,N:std_logic_vector(4 downto 0);
signal NA_SBAR,NK,S1,S2:std_logic;

--Check validity of BCD 84-2-1
Abank:
for i in 0 to 3 generate 
	FA1: NOT1 port map (A(i), C(i));
      FA2: NOT1 port map (B(i), D(i));
end generate;
FA7:AND2 port map(S1,B(2),S4);
FA8:AND2 port map(S4,B(3),S5);
FA9:AND2 port map(A(3),A(2),S6);
FA10:OR2 port map(B(0),B(1),S7);
FA11:AND2 port map(S6,S7,S8);
FA12:OR2 port map(S8,S5,C(4));