library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity Splitter is

	port(
			
			bas_words : in std_logic_vector(15 downto 0);
--			clk : in std_logic;
			reset : in std_logic;
			
			bas_data: out std_logic_vector(7 downto 0);
			addr : out std_logic_vector(4 downto 0);
--			reserve : out std_logic;
			on_off : out std_logic;
			D4_bit : out std_logic;
			
			rd_wd : out std_logic
--			D8_bit : out std_logic;
			
			
					
		);

end Splitter;



architecture rtl of Splitter is

--	signal sub_addr : std_logic_vector(4 downto 0);
--	signal sub_reserve : std_logic;
--	signal sub_on_off : std_logic;
--	signal sub_rd_wd : std_logic;
--	
--	signal sub_bas_data : std_logic_vector(7 downto 0);

begin
	
	process(bas_words, reset)
		
	begin
		
		if (reset = '1') then
		
			addr <= "00000";
--			reserve <= '0';
			on_off <= '0';
			rd_wd <= '0';
			
			D4_bit <= '0';
--			D8_bit <= '0';
			
			bas_data <= "00000000";			
		
		else
			
			--if (falling_edge(clk)) then
			
					addr <= bas_words(4 downto 0);
				
--					reserve <= bas_words(5);
					on_off <= bas_words(6);
					rd_wd <= bas_words(7);
					
					D4_bit <= bas_words(11);
--					D8_bit <= bas_words(15);
					
					bas_data <= bas_words(15 downto 8);
			
			--end if;
		
		end if;
		
--		addr <= sub_addr;
--		reserve <= sub_reserve;
--		on_off <= sub_on_off;
--		rd_wd <= sub_rd_wd;
--		
--		bas_data <= sub_bas_data;		
		
	end process;
	
end rtl;