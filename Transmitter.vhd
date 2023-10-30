--Auther: Sekachev Artem

--Transmitter block

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity Transmitter is
	
	generic(
			
				ticks_tx : natural := 8
			
			);
	
	port(
									
			en_TX : in std_logic;
			
			reset : in std_logic;
			clk : in std_logic;
			control_bit : in std_logic;
			
			off_power_serviece : in std_logic;
			on_serviece : in std_logic;
			off_serviece : in std_logic;
			
			bas_data_TX : out std_logic
			
			
		);

end Transmitter;

architecture rtl of Transmitter is 

	signal bas_signal : integer range 0 to 8;

begin

	process(clk, reset, off_serviece, on_serviece, off_power_serviece, control_bit, en_TX)
		
		variable overclock : integer range 0 to 1 := 0;
		
	begin
		
		if (reset = '1') then
		
			bas_signal <= 0;
			bas_data_tx <= '0';
			overclock := 0;
		
		else
		
			if (control_bit = '1') then
			
				bas_data_tx <= '0';
				bas_signal <= 0;
							
			else
			
				if (falling_edge(clk)) then
				
					if (en_TX = '1') then
					
						if (bas_signal > (ticks_tx - 1)) then
													
							overclock := 1;
																											
						elsif (overclock = 0) then
						
							case bas_signal is
							
								when 0 => 
											bas_data_tx <= '0';
																						
								when 1 => 
											bas_data_tx <= off_serviece;
																														
								when 2 => 
											bas_data_tx <= on_serviece;
																						
								when 3 => 
											bas_data_tx <= off_power_serviece;
																			
								when 4 => 
											bas_data_tx <= '0';
																						
								when 5 => 
											bas_data_tx <= '0';
																			
								when 6 => 
											bas_data_tx <= '0';
																						
								when 7 => 
											bas_data_tx <= '0';
																			
								when others =>
											bas_data_tx <= '0';
																						
							end case;
						
						end if;
						
						if (overclock = 1) then
								
		--					cnt_ticks := 0;
							bas_signal <= 0;
							bas_data_tx <= '0';
							overclock := 0;
							
			
						end if;				
						
						bas_signal <= bas_signal + 1;
					
					end if;
				
				end if;
			
			end if;
		
		end if;
		
	end process;
	
end rtl;