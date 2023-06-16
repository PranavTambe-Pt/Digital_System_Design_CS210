--Author Pranav Tambe
library IEEE;
use IEEE.std_logic_1164.all;
use work.CS210.all;

entity COUNTER_ASYNC is -- Entity declaration
    port(    CLK : in std_logic; -- Clock input of the counter
            RSTN : in std_logic; -- Active low reset input of the counter
            Q : inout std_logic_vector(3 downto 0)); -- Output state of the counter
end entity;

architecture STRUCTURE of COUNTER_ASYNC is

Signal QN : std_logic_vector(3 downto 0);
Signal sig_q : std_logic_vector(3 downto 0);
signal S3 : std_logic;

begin

    U0 : CLK_DVD port map (CLK, RSTN, S3);
    --D_FF(D,clk,CLRN,PRES,Q,QN)
    U1 : D_FF port map ( QN(0),s3,  RSTN, '1',   sig_q(0), QN(0));
    Q(0)<=sig_q(0);
    U2 : D_FF port map (QN(1),QN(0), RSTN,  '1',  sig_q(1), QN(1));
    Q(1)<=sig_q(1);
    U3 : D_FF port map ( QN(2),QN(1), RSTN,  '1',   sig_q(2), QN(2));
    Q(2)<=sig_q(2);
    U4 : D_FF port map (  QN(3),QN(2), RSTN, '1', sig_q(3),QN(3));
    Q(3)<=sig_q(3);
    
end STRUCTURE;