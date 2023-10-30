--Auther: Sekachev Artem



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity RW_Block is

	port(
			
			rd_wd : in std_logic;
			reset : in std_logic;
						
			en_MEM : out std_logic;
			
			en_TX : out std_logic
			
		);

end RW_Block;

architecture rtl of RW_Block is 

begin

	process(reset, rd_wd)
		
	begin
		
		if (reset = '1') then
		
			en_MEM <= '0';
			en_TX <= '0';
		
		else
		
			case rd_wd is
				
				when '0' => 
							en_TX <= '1';
							en_MEM <= '0';
							
				when '1' => 
							en_MEM <= '1';
							en_TX <= '0';
							
			end case;
		
		end if;
		
	end process;
	
end rtl;