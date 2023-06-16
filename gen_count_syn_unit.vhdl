 --Author Pranav Tambe
Library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;

entity gen_count_syn_unit is
     port(CLK : in std_logic; -- Clock input of the counter
                RSTN : in std_logic; -- Active low reset input of the counter
                UP_DN : in std_logic; -- Count up if UP_DN is high, down if low
                LDN : in std_logic; -- Load D to the counter if LDN is low
		     R:in std_logic;
                E : in std_logic; -- Count if E is high, retain otherwise
                D : in std_logic ; -- Count to load when LDN is low
                Q : buffer std_logic; -- Output state of the counter
		     C:out std_logic);--carry 
 end  gen_count_syn_unit;

architecture STRUCTURE of gen_count_syn_unit is
--signals
signal S5,S4,S3,S2,S1: std_logic;

begin
--MUX_2X1(I0,I1,S0,C0)
U0:XOR2 port map(E,Q,S1);
U1: MUX_2X1 port map(D,S1,LDN,S2);
U2:MUX_2X1 port map(R,S2,RSTN,S3);
--DFF(D,CLK,CLRN,PREN,Q,QN)
U3:D_FF port map(S3,CLK,'1','1',Q,S4);
U4:MUX_2X1 port map(S4,Q,UP_DN,S5);
u5:AND2 port map(E,S5,C);

end STRUCTURE;
