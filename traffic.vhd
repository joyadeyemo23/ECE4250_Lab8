----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2022 08:12:31 AM
-- Design Name: 
-- Module Name: traffic_light - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity traffic_light is
    PORT (clk, PB: in std_logic;
    Ga, Ya, Ra, WALK, NOWALK: inout std_logic);
end traffic_light;

architecture Behavioral of traffic_light is

component GenClock
    generic (time_period : integer range 1 to 4);
    port (clk : in std_logic;
        Clock : buffer std_logic);
end Component;		

signal State, NextState : integer range 0 to 13 := 0;
signal clk1 : std_logic := '0';
signal clk4 : std_logic := '0';

begin
Clock4: GenClock generic map (2) port map (clk, clk4); 
Clock1: GenClock generic map (4) port map (clk, clk1); 

  process(clk4, clk1)
	variable counter : integer := 0;
	begin
	Ra <= '0'; Ga <= '1'; Ya <= '0'; NOWALK <= '1'; WALK <= '0'; 
	case State is 
	when 0 to 6 => Ya <= '0'; Ga <= '1' ; Ra <= '0'; NOWALK <= '1'; WALK <= '0'; NextState <= State + 1;
	when 7 => Ga <= '1'; Ra <= '0'; Ya <= '0'; NOWALK <= '1'; WALK <= '0';
		if (Pb = '1') then NextState <= 8; 
		else NextState <= 7; 
		end if;
	when 8 => Ra <= '0'; Ya <= '1'; Ga <= '0';  NOWALK <= '1'; WALK <= '0'; NextState <= State + 1;
	when 9 to 12 => Ga <= '0'; Ra <= '1'; Ya <= '0'; NOWALK <= '0'; WALK <= '1'; NextState <= State + 1;
	when 13 =>  Ga <= '0'; Ra <= '1'; Ya <= '0'; NOWALK <= '0'; WALK <= '1';
	 	if clk1 = '1' then WALK <= not clk1; 
			counter := counter + 1;
				if counter = 3  then counter := 0; NextState <= 0;
				end if;
		end if;
  	end case;
      end process;

end Behavioral;
