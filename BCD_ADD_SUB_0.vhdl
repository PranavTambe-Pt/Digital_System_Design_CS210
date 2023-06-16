--Author: Pranav Tambe
library ieee;
use ieee.std_logic_1164.all;
use work.CS210.all;

entity BCD_ADD_SUB_0 is
port(A,B: in std_logic_vector(3 downto 0);
     A_SBAR: in std_logic;
     Y: out std_logic_vector(7 downto 0);
     INVA: out std_logic;
     INVB: out std_logic);
end BCD_ADD_SUB_0;

architecture functionality of BCD_ADD_SUB_0 is

signal C,D: std_logic_vector(9 downto 0);
signal E,F: std_logic_vector(3 downto 0);
signal G: std_logic_vector(3 downto 0);
signal H,I,J: std_logic;
signal K: std_logic_vector(4 downto 0);
signal L,M: std_logic_vector(3 downto 0);
signal N: std_logic_vector(4 downto 0);

begin

	--checking invalid BCD 84-2-1 inputs 
	Abank:
		for i in 0 to 3 generate
			Na: NOT1 port map(A(i),C(i));
			Nb: NOT1 port map(B(i),D(i));
		end generate;
	F1: AND2 port map(A(3),A(2),C(4));
	F2: AND2 port map(B(3),B(2),D(4));
	F3: OR2 port map(C(0),C(1),C(5));
	F4: OR2 port map(D(0),D(1),D(5));
	F5: AND2 port map(C(2),C(3),C(6));
	F6: AND2 port map(D(2),D(3),D(6));
	F7: OR2 port map(A(0),A(1),C(7));
	F8: OR2 port map(B(0),B(1),D(7));
	F9: AND2 port map(C(4),C(5),C(8));
	F10: AND2 port map(D(4),D(5),D(8));
	F11: AND2 port map(C(6),C(7),C(9));
	F12: AND2 port map(D(6),D(7),D(9));
	F13: OR2 port map(C(8),C(9),INVA); 
	F14: OR2 port map(D(8),D(9),INVB);
	 

	-- converting  BCD 84-2-1 to XS3
	Bbank:
		for i in 0 to 1 generate
			Na0: NOT1 port map(A(i),E(i));
			Nb0: NOT1 port map(B(i),F(i));
			E(i+2)<=A(i+2);
			F(i+2)<=B(i+2);
		end generate;
	 

      --Getting the complement of A_SBR 
	F15: NOT1 port map(A_SBAR,H);
	Cbank:
		for i in 0 to 3 generate
			F16: XOR2 port map(F(i),H,G(i));
		end generate;
	 	

	 
	F17: FOUR_BIT_ADDER port map(E,G,H,K);
	 

	 
	Dbank:
		for i in 0 to 3 generate
			L(i)<=K(i);
		end generate;

	F18: NOT1 port map(K(4),I);
	F19: XOR2 port map('1',I,M(0));
	F20: XOR2 port map('1',I,M(1));
	F21: XOR2 port map('0',I,M(2));
	F22: XOR2 port map('0',I,M(3));	
	 

	 
	F23: FOUR_BIT_ADDER port map(L,M,I,N);
	 
	
	 
	F24:AND2 port map(A_SBAR,K(4),J);
	Ebank:
		for i in 0 to 3 generate
			Y(i)<=N(i);
		end generate;
	F25:MUX_2X1 port map('1','0',J,Y(4));
	F26:MUX_2X1 port map('1','0',J,Y(5));
	F27:MUX_2X1 port map('0','1',J,Y(6));
	F28:MUX_2X1 port map('0','0',J,Y(7));	
end functionality;