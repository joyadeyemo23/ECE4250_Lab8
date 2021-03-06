----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2022 08:14:05 AM
-- Design Name: 
-- Module Name: GenClock - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GenClock is
    Generic(time_period : integer range 1 to 4);
    Port( clk : in std_logic;
            Clock: buffer std_logic);
end GenClock;

architecture behave of GenClock is
signal counter : integer range 0 to 400000000; 
begin 
    process(clk)
    begin
        if (clk'event and clk = '1') then
            counter <= counter +1;
            if(counter = 400000000 and time_period = 1 ) then 
                Clock <= not Clock;
                counter <= 0;
            elsif(counter = 100000000 and time_period = 2) then
                 Clock <= not Clock;
                 counter <= 0;
            elsif(counter = 100000000 and time_period = 2) then
                 Clock <= not Clock;
                 counter <= 0;
            elsif(counter = 200000000 and time_period = 2) then
                 Clock <= not Clock;
                 counter <= 0;
                 end if;
             end if;
           end process;    
end behave;
