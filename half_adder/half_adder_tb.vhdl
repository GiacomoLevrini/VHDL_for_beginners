-- half_adder_tb.vhd

library ieee;
use ieee.std_logic_1164.all;


entity half_adder_tb is
end half_adder_tb;
--in the architecture the signals are declared and the DUT or UUT is instantiated
architecture tb of half_adder_tb is
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
	-- here the stimuli are declared in a sequential process
tb1 : process
        constant period: time := 20 ns;
        begin
            a <= '0';
            b <= '0';
            wait for period;
            a <= '0';
            b <= '1';
            wait for period;
            a <= '1';
            b <= '0';
            wait for period;
            a <= '1';
            b <= '1';
            wait for period;
            wait; -- indefinitely suspend process
        end process;
end tb ;
