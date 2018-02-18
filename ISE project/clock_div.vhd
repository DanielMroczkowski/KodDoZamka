----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:30:03 01/05/2018 
-- Design Name: 
-- Module Name:    clock_div - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_div is
    Port ( clk_in : in  STD_LOGIC; -- nasze 100 MHz
           reset : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);  --domyœlnie od 100HZ do 1000Hz
end clock_div;

architecture Behavioral of clock_div is
---jeden counter
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 499999 := 0;
begin
    frequency_divider: process (reset, clk_in) begin
        if (reset = '1') then
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then
            if (counter = 499999) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= temporal;

--inny counter
--signal count: integer :=1;
--signal tmp : STD_LOGIC := '0';
--
--begin
--
--process(clk,reset)
--begin
--		if(reset='1') then
--			count <= 1;
--			tmp <= '0';
--		elsif(clk'event and clk = '1') then
--			count <=count+1;
--				if (count =25000) then
--					tmp <= NOT tmp;
--					count <= 1;
--				end if;
--		end if;
--	clock_out <= tmp;
--end process;

end Behavioral;


