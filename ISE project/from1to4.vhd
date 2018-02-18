library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity jedenzczterech is
port (	Wej : in std_logic_vector(1 downto 0); -- 2-bitowy port wejœciowy
		Wyj : out std_logic_vector(3 downto 0)); -- 4-bitowy port wyjœciowy
 end jedenzczterech;
 
 architecture Beh of jedenzczterech is 
 begin 
 
 Z <= 	”0001” when A = ”00” else
		”0010” when A = ”01” else
		”0100” when A = ”10” else
		”1000” ;
end Beh;

