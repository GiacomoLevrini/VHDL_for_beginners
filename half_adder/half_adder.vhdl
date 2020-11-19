library ieee;
use ieee.std_logic_1164.all;
--This is a half adder.
--The only difference with respect to the full adder
--is that the half adder doesn't have a cary input
entity half_adder is 
  port (a, b : in std_logic;
        sum, carry : out std_logic
    );
end half_adder;
--
architecture arch of half_adder is
begin
  sum <= a xor b;
  carry <= a and b;
end arch;
