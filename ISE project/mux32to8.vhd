----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:31:36 01/05/2018 
-- Design Name: 
-- Module Name:    mux32to8 - Behavioral 
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

entity mux32to8 is
    Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           d : in  STD_LOGIC_VECTOR (7 downto 0);
           d1 : in  STD_LOGIC_VECTOR (7 downto 0);
           d2 : in  STD_LOGIC_VECTOR (7 downto 0);
           d3 : in  STD_LOGIC_VECTOR (7 downto 0);
           wyjsciemux : out  STD_LOGIC_VECTOR (7 downto 0));
end mux32to8;

architecture Behavioral of mux32to8 is

begin
--d <= ; --O
--d1 <= "0001110"; -- F
--d2 <= "0001110"; -- F
--d3 <= "0001110"; -- F
process (SEL)
begin
	case SEL is
			when "00" => wyjsciemux <=d; --ostatni segment
			when "01" => wyjsciemux <=d1; 
			when "10" => wyjsciemux <=d2;
			when OTHERS => wyjsciemux<=d3; -- pierwszy segment
	end case;
end process;

end Behavioral;


