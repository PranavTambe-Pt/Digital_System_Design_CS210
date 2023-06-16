--author: Pranav Tambe
library ieee;
use ieee.std_logic_1164.all;
package CS210 is

component NOT1 is
       port(I0:in std_logic;
            O0:out std_logic);
            end component;

component OR2 is
       port(I0,I1:in std_logic;
            O0:out std_logic);
            end component;

component AND2 is
       port(I0,I1:in std_logic;
            O0:out std_logic);
   end component;

component AND3 is 
 port( I0, I1,I2 : in std_logic; 
 O0 : out std_logic); 
    end component;

component XOR2 is
       port (I0,I1 :in std_logic;
          O0: out std_logic);
   end component;


component HALF_ADDER is
        port(I0, I1 : in std_logic;
             S, C : out std_logic);
 end component;

component FULL_ADDER is
        port(I0,I1,CIN : in std_logic;
             S, COUT: out std_logic);
 end component;

component MUX_2X1 is port(I0, I1, S0 : in std_logic;   
                       O0 : out std_logic);  
end component;  

component DEMUX_1X2 is port(I0, S0 : in std_logic;  
                          O0, O1 : out std_logic);  
  
 end  component;  

 
component MUX_4X1 is port(I : in std_logic_vector(3 downto 0);   
                        S : in std_logic_vector(1 downto 0); 
                        O0 : out std_logic);   
end  component;  

component DEMUX_1X4 is port(I0 : in std_logic;  
                            S : in std_logic_vector(1 downto 0);  
                            O : out std_logic_vector(3 downto 0));   
                             end component;
component FOUR_BIT_ADDER is
    port (A : in std_logic_vector(3 downto 0);
	    B: in std_logic_vector(3 downto 0);
	    CIN: in std_logic;
 	    SUM: out std_logic_vector(4 downto 0));
end component;

component MULTIPLIER is  
       port(A, B : in std_logic_vector(3 downto 0);  
        P : out std_logic_vector(7 downto 0)); 
end component;
component BCD_CONVERTER is
port(A: in std_logic_vector(3 downto 0);
	C : out std_logic_vector(4 downto 0)
	 ); 
end component; 

component BCD_ADD_SUB_0 is
port(A,B: in std_logic_vector(3 downto 0);
     A_SBAR: in std_logic;
     Y: out std_logic_vector(7 downto 0);
     INVA: out std_logic;
     INVB: out std_logic);
end component; 
component  BCD2SSD is 
	port(X : in std_logic_vector(3 downto 0);  
	Y : out std_logic_vector(6 downto 0); 
	F : out std_logic); 
end component;

 component  D_LATCH is  
   port( D : in std_logic;       
  		LTCH : in std_logic;  
 	      Q : buffer std_logic;  
            QN : out std_logic);  
   end component ;

  component D_LATCHN is  
   port(	 D : in std_logic;         
  		LTCHN : in std_logic;  
 	      Q : buffer std_logic;   
            QN : out std_logic);  
   end  component; 

  component SR_LATCH is  
  	port(  S : in std_logic;  
  		  R : in std_logic;   
           Q : buffer std_logic;  
          QN : out std_logic);  
end   component;      
component  D_FF is  
   port( D : in std_logic;  
         CLK : in std_logic;  
         CLRN : in std_logic;  
         PREN : in std_logic; 
         Q : buffer std_logic;  
         QN : out std_logic);  
 end component ; 

component D_FFN is  
   port( D : in std_logic;  
         CLK : in std_logic;  
         CLRN : in std_logic;   
         PREN : in std_logic;  
         Q : buffer std_logic;  
         QN : out std_logic);  
 end component; 
component CLK_DVD is 
    port( CLK_IN : in std_logic;
            RSTN : in std_logic;
            CLK_OUT : out std_logic);
end component;

component gen_count_syn_unit is
     port(CLK : in std_logic;  
                RSTN : in std_logic;  
                UP_DN : in std_logic;  
                LDN : in std_logic; 
		        R:in std_logic;
                E : in std_logic;  
                D : in std_logic ;  
                Q : buffer std_logic;  
		        C:out std_logic); 
end  component;
component COUNTER_SYNC is  
                port(CLK : in std_logic; 
                RSTN : in std_logic;  
                UP_DN : in std_logic;  
                LDN : in std_logic;  
                E : in std_logic; 
                D : in std_logic_vector(3 downto 0);  
                Q : buffer std_logic_vector(3 downto 0));  
 end component;
   
end CS210;