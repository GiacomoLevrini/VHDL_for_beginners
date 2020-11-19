-- half_adder_simple_tb.vhd

library ieee;
use ieee.std_logic_1164.all;

--empty entity for the test bench
entity half_adder_simple_tb is
end half_adder_simple_tb;
--in the architecture the signals are declared and the DUT or UUT is instantiated
architecture tb of half_adder_simple_tb is
    signal a, b : std_logic;  -- inputs 
    signal sum, carry : std_logic;  -- outputs
begin
    -- connecting testbench signals with half_adder.vhd
	-- you can use this syntax work.name of the entity to connect
	-- without declare the component in the architecure
    UUT : entity work.half_adder port map (
	a => a,
	b => b,
	sum => sum,
	carry => carry);
    --here you can declare all the stimuli
    a <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
    b <= '0', '1' after 40 ns, '0' after 80 ns;      
	
end tb ;