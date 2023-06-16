--author:Pranav Tambe
library ieee;
use ieee.std_logic_1164.all;
use work.CS210.all;

entity FOUR_BIT_ADDER is
    port (A : in std_logic_vector(3 downto 0);
	    B: in std_logic_vector(3 downto 0);
	    CIN: in std_logic;
 	    SUM: out std_logic_vector(4 downto 0));
end FOUR_BIT_ADDER;

architecture STRUCTURE of FOUR_BIT_ADDER is

	signal SIG_C:std_logic_vector(4 downto 0);

begin
  	FA_BANK:

for i in 0 to 3 generate
	FA0: FULL_ADDER port map (A(i), B(i), SIG_C(i), SUM(i), SIG_C(i+1));
end generate;

SIG_C(0) <= CIN;
SUM(4) <= SIG_C(4);
end STRUCTURE;

