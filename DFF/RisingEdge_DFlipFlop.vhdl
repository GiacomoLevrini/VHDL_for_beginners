Library IEEE;
USE IEEE.Std_logic_1164.all;
-- This is a simple D type FlipFlop
entity RisingEdge_DFlipFlop is 
   port(
      Q : out std_logic;    
      Clk :in std_logic;   
      D :in  std_logic    
   );
end RisingEdge_DFlipFlop;

architecture Behavioral of RisingEdge_DFlipFlop is  

begin 
 
 process(Clk)
 begin 
    if(rising_edge(Clk)) then --this is equivalent to if Clk'event and clk='1' then
   Q <= D; 
    end if;       
 end process;  
end Behavioral; 