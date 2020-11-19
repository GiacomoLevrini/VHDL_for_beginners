-- source_example file 
-- the architecture is a simple "tunnel", takes a signal as an input, and sends it delayed as output

--library inclusion
library IEEE; 												
use IEEE.STD_LOGIC_1164.ALL;

--If you need to use arithmetic functions (for Signed or Unsigned values), use the following library
use IEEE.NUMERIC_STD.ALL;

--declaration of an "entity", you can picture it as a "box" of circuitry, with its inputs/outputs 
entity tunnel is 
	Generic (bit_value : std_logic :=  '1');						--in Generic you can declare variables of the entity which are not inputs/0utputs
	Port ( 
			clk : in std_logic;										--in Port, all the input and output signals of the entity are declared 
            input : in STD_LOGIC_VECTOR(1 downto 0);			
            output : out STD_LOGIC_VECTOR(1 downto 0) 
         );	
end tunnel;

--the compiler dosen't care if you write variables or vocabulary words in uppercase or lowercase

architecture Behavioral of tunnel is 								--inside the architecture you can write the code for your logic
	signal input_n  : std_logic_vector(1 downto 0) := "00"; 			-- you can declare any type of signal you need 
	signal input_2n : std_logic_vector(1 downto 0) := "00";		
	
begin 
	process(clk, input) 											-- simple process, the input is "shifted" of two clock periods
	begin 
		if (clk'event and clk = '1') then 							--if condition to oprerate in synch. with the clk
			input_n <= input;										--each assignment is refeshed at the successive clock period 
			input_2n <= input_n;
			output <= input_2n; 
		end if; 
	
	end process;

end Behavioral;
