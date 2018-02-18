----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:36:32 01/05/2018 
-- Design Name: 
-- Module Name:    mod4 - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod4 is
port(
	clk : in STD_LOGIC;
	SEL : inout STD_LOGIC_VECTOR(1 downto 0)

);
end mod4;

architecture Behavioral of mod4 is

begin
process(clk)
begin
	if rising_edge(clk) then
		SEL <= SEL + 1;
	end if;
	
end process;

end Behavioral;