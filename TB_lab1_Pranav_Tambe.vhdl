library IEEE;
use IEEE.std_logic_1164.all;

entity TB_lab1_Pranav_Tambe is
end entity;

architecture TESTBENCH of TB_lab1_Pranav_Tambe is
 component D_lab1_Pranav_Tambe is 
  port( I0, I1 : in std_logic; 
         O0 : out std_logic); 
 end component;
 
 signal A,B,Y:std_logic;

begin
 
 DUT:D_lab1_Pranav_Tambe port map(A,B,Y);
 
 process
 begin
  A<='0' ; B<='0' ;
  wait for 1 ns;

  A<='1' ; B<='0' ;
  wait for 1 ns;

  A<='0' ; B<='1' ;
  wait for 1 ns;

  A<='1' ; B<='1' ;
  wait;

 end process;

end TESTBENCH;