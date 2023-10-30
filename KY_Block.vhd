-- KY_Block

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity KY_Block is

	port(
		
			bas_data : in std_logic_vector(7 downto 0);
			on_off : in std_logic;
			en_KY : in std_logic;
			
			reset : in std_logic;
			clk : in std_logic;
			
			KY1 : out std_logic;
			KY2 : out std_logic;
			KY3 : out std_logic;
			KY7 : out std_logic
		
		);

end entity;


architecture rtl of KY_Block is

	signal sub_data : std_logic_vector(3 downto 0); 

begin
--	
	sub_data <= bas_data(3 downto 0);
	
	process(en_KY, sub_data, reset, clk, on_off)
	
	begin
		
		if (reset = '1') then
		
			KY1 <= '0';
			KY2 <= '0';
			KY3 <= '0';
			
			KY7 <= '0';
		
		else
				
			if (falling_edge(clk)) then
			
				if (en_KY = '1') then
					
					case sub_data is
						
						when "1001" =>
										KY1 <= on_off;
											
						when "1010" =>
										KY2 <= on_off;
						
						when "1011" =>
										KY3 <= on_off;
			
						when "1111" =>
										KY7 <= on_off;
											
						when others => 
--										KY1 <= '0';
--										KY2 <= '0';
--										KY3 <= '0';
--										KY7 <= '0';
										null;
				
					end case;
					
				end if;
			
			end if;
		
		end if;
		
	end process;

end rtl;