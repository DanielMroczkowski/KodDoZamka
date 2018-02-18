----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:28:57 01/05/2018 
-- Design Name: 
-- Module Name:    module1z4 - Behavioral 
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

entity module1z4 is
    Port ( Wej : in  STD_LOGIC_VECTOR (1 downto 0);
           Wyj : out  STD_LOGIC_VECTOR (3 downto 0));
end module1z4;

architecture Behavioral of module1z4 is

begin

with Wej select Wyj <=
   "1110" when "00",
	"1101" when "01",
	"1011" when "10",
	"0111" when "11";
-- Wyj <=  ”0001” when Wej = ”00” else
--		”0010” when Wej = ”01” else
--		”0100” when Wej = ”10” else
--		”1000” ;

end Behavioral;

