--Author: Pranav Tambe

library ieee;
use ieee.std_logic_1164.all;
use work.CS210.all;


entity SSD_UPDN is
	port(CLK : in std_logic; -- Clock input of the counter
		   RSTN : in std_logic; -- Active low reset input of the counter
		   UP_DN : in std_logic; -- Count up if UP_DN is high, down if low
		   STOP : in std_logic; --Stops the counter
		   Q : out std_logic_vector(6 downto 0));
		    
end entity;
	
	
architecture Functionality of SSD_UPDN is

	signal B: std_logic_vector(3 downto 0); --the buffer that will be the output for the sync clock
	signal D: std_logic_vector(3 downto 0);
    signal I: std_logic; --for the invalid bit in bcd to ssd
	--signal CLK1: std_logic; --clk to make clock count 3 seconds 
	
	begin
	
	   D(0)<='0';
	   D(1)<='0';
        D(2)<='0';
        D(3)<='0';	    
	
		--U0: CLK_DIV port map(CLK,'1',CLK1);
    --COUNTER_SYNC(CLK,RSTN,UP_DN,LDN,E,DATA is loaded when ldn is low,Q output)
		U1: COUNTER_SYNC port map(CLK,RSTN,UP_DN,'1',STOP,D,B);
		U2: BCD2SSD port map(B,Q,I);
		
end Functionality;