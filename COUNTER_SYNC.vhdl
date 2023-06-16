 --Author Pranav Tambe
Library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;

entity COUNTER_SYNC is -- Entity declaration
                port(CLK : in std_logic; -- Clock input of the counter
                RSTN : in std_logic; -- Active low reset input of the counter
                UP_DN : in std_logic; -- Count up if UP_DN is high, down if low
                LDN : in std_logic; -- Load D to the counter if LDN is low
                E : in std_logic; -- Count if E is high, retain otherwise
                D : in std_logic_vector(3 downto 0); -- Count to load when LDN is low
                Q : buffer std_logic_vector(3 downto 0)); -- Output state of the counter
 end COUNTER_SYNC;

architecture STRUCTURE of COUNTER_SYNC is
--signals
signal S8,S7,S6,S5,S4,S3,S2,S1,S0,RSTN_U1,RSTN_U0,R_U1,R_U0,RS : std_logic;
Signal C,R,QN : std_logic_vector(3 downto 0);
begin

ABANK:
  for i in 0 to 3 generate
    FA0:NOT1 port map(Q(i),QN(i)); 
end generate;

L0:AND2 port map(QN(0),QN(1),S1);
L1:AND2 port map(S1,QN(2),S2); 
L2:OR2 port map(QN(3),S2,R_U1);
N0:AND2 port map(R_U1,RSTN,RSTN_U1);
L3:OR2 port map(Q(0),Q(1),S3);
L4:AND2 port map(S3,QN(3),S4);
L5:AND2 port map(QN(3),Q(2),S5);
L6:OR2 port map(S5,S4,S6);
L7:AND2 port map(QN(2),QN(1),S7);
L8:AND2 port map(S7,Q(3),S8);
L9:OR2 port map(S6,S8,R_U0);
N1:AND2 port map(R_U0,RSTN,RSTN_U0);

M0:MUX_2X1 port map(RSTN_U0,RSTN_U1,UP_DN,RS);

T0:MUX_2X1 port map('1','0',UP_DN,R(0));
T1:MUX_2X1 port map('0','0',UP_DN,R(1));
T2:MUX_2X1 port map('0','0',UP_DN,R(2));
T3:MUX_2X1 port map('1','0',UP_DN,R(3));

U0 : CLK_DVD port map (CLK, '1', S0);
-- gen_count_syn_unit(CLK==S0,RSTN,UP_DN,LDN,R,E,D,Q,C)
U1: gen_count_syn_unit port map (CLK,RS,UP_DN,LDN,R(0),E,D(0),Q(0),C(0));
U2: gen_count_syn_unit port map (CLK,RS,UP_DN,LDN,R(1),C(0),D(1),Q(1),C(1));
U3: gen_count_syn_unit port map (CLK,RS,UP_DN,LDN,R(2),C(1),D(2),Q(2),C(2));
U4: gen_count_syn_unit port map (CLK,RS,UP_DN,LDN,R(3),C(2),D(3),Q(3),C(3));
end STRUCTURE;