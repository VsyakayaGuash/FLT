library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity Receiver is

	generic(
				ticks : natural := 16
			);

	port(
			
			data : in std_logic;
			clk : in std_logic;
			reset : in std_logic;
			
			control_bit: in std_logic;
			
--			en_TX : in std_logic;			
			
			bas_words : out std_logic_vector(15 downto 0)
					
		);

end Receiver;



architecture rtl of Receiver is

	signal bas_signal : integer range 0 to 15 := 0;

begin
	
	process(clk, reset, bas_signal, data, control_bit)
		
--		variable cnt_ticks : integer range 0 to ticks := 0;
		variable overclock : integer range 0 to 1 := 0;
		
	begin
		
		if (reset = '1') then
		
			overclock := 0;
--			cnt_ticks := 0;
			bas_signal <= 0;
			bas_words <= (others => '0');
		
		else
			
			
			if (control_bit = '1') then
				
--				bas_words(7) <= '0';
				bas_words(15 downto 8) <= "00000000";
				
			else
			
				if (rising_edge(clk)) then
				
					if (bas_signal > (ticks - 1)) then
												
						overclock := 1;
																										
					elsif (overclock = 0) then
					
						bas_words(bas_signal) <= data;
					
					end if;
					
					if (overclock = 1) then
							
	--					cnt_ticks := 0;
						bas_signal <= 0;
						bas_words <= (others => '0');
						overclock := 0;
						
		
					end if;				
					
					bas_signal <= bas_signal + 1;
					
				end if;
		
			end if;
		
		end if;
		
--		bas_words <= bas_signal;
		
	end process;
	
end rtl;