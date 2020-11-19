--test_bench example file 
--test the source_example file

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity test_bench is        				--in test_benches no inputs/outputs (it's a simulation)
--  Port ( );   
end test_bench;

architecture Behavioral of test_bench is 
	component tunnel 						--use the tunnel entity as a component
		Generic (bit_value : std_logic);										
		Port ( 	  
				clk : in std_logic;																
				input : in STD_LOGIC_VECTOR;			
				output : out STD_LOGIC_VECTOR
			 );	
		end component;

	signal input_t : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal output_t : STD_LOGIC_VECTOR(1 downto 0);
	signal clk_t: STD_LOGIC := '0';
	
	begin 
		tunnel_map:tunnel 					--map (i.e. connection) of the signals in the test_bench and the i/o of the tunnel componnt
		generic map ( bit_value => '1')
		port map ( clk => clk_t,
							input => input_t,
							output => output_t );
		
		process 
			begin 							--process to simulate a clock in test_bench
				for i in 0 to 100 loop 
					wait for 10 ns;
					clk_t <= not clk_t;
					wait for 10 ns;
					clk_t <= not clk_t;
				end loop; 
				wait for 1 us;
		end process;
		
		process
			begin							--process to set manually the input of tunnel
				for i in 0 to 100 loop 
					wait for 20 ns; 
						input_t <= "00";
					wait for 20 ns; 
						input_t <= "01";
					wait for 20 ns; 
						input_t <= "10";
					wait for 20 ns; 
						input_t <= "11"; 
				end loop;
			wait for 1 us;
		end process;
	
end Behavioral;