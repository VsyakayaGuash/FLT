-- DeMUX

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity DeMUX is

	port(
		
			D4_bit_in : in std_logic;
			en_MEM : in std_logic;
			
			reset : in std_logic;
			
			en_PK : out std_logic;
			en_KY : out std_logic
		
		);

end entity;


architecture rtl of DeMUX is

	

begin

	process(reset, D4_bit_in, en_MEM)
	
	begin
		
		if (reset = '1') then
		
			en_PK <= '0';
			en_KY <= '0';
		
		else
		
			en_PK <= en_MEM and (not D4_bit_in);
			en_KY <= en_MEM and D4_bit_in;
		
		end if;
		
	end process;

end rtl;