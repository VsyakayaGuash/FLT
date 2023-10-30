-- PK_Block

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity PK_Block is

	port(
		
			bas_data : in std_logic_vector(7 downto 0);
			bas_addr : in std_logic_vector(4 downto 0);
			en_PK : in std_logic;
			
			on_off : in std_logic;
			
			reset : in std_logic;
			clk : in std_logic;
						
			PowerOutB3 : out std_logic; -- Data 179
			PowerOutB4 : out std_logic; -- Data 180
			PowerOutC4 : out std_logic; -- Data 196
			PowerOutD5 : out std_logic;  -- Data 213
			
			PowerOutB3_2 : out std_logic; -- Data 179
			PowerOutB4_2 : out std_logic; -- Data 180
			PowerOutC4_2 : out std_logic; -- Data 196
			PowerOutD5_2 : out std_logic  -- Data 213
		
		);

end entity;


architecture rtl of PK_Block is

	signal sub_data : std_logic_vector(7 downto 0);
	signal sub_addr : std_logic_vector(4 downto 0); 

begin
	
	sub_data <= bas_data(7 downto 0);
	sub_addr <= bas_addr(4 downto 0);
	

	process(en_PK, sub_data, sub_addr, reset, clk, on_off)
	
	begin
		
		if (reset = '1') then
		
			PowerOutB3 <= '0';
			PowerOutB4 <= '0';
			PowerOutC4 <= '0';
			PowerOutD5 <= '0';
			
			PowerOutB3_2 <= '0';
			PowerOutB4_2 <= '0';
			PowerOutC4_2 <= '0';
			PowerOutD5_2 <= '0';
		
		else
			
			if (falling_edge(clk)) then
		
				if (en_PK = '1') then
				
					case sub_addr is
					
						when "10000" => 
										case sub_data is
											
											when "10110011" => 
																PowerOutB3 <= on_off;
											
											when "10110100" => 
																PowerOutB4 <= on_off;
																
											when "11000100" => 
																PowerOutC4 <= on_off;
																
											when "11010101" => 
																PowerOutD5 <= on_off;
																
											when others =>
															null;
																
										end case;
					
						when "10001" => 
										case sub_data is
											
											when "10110011" => 
																PowerOutB3_2 <= on_off;
											
											when "10110100" => 
																PowerOutB4_2 <= on_off;
																
											when "11000100" => 
																PowerOutC4_2 <= on_off;
																
											when "11010101" => 
																PowerOutD5_2 <= on_off;
																
											when others =>
															null;
																
										end case;
										
						when others =>
										null;
					
					end case;
							
				end if;
			
			end if;
		
		end if;
		
	end process;

end rtl;