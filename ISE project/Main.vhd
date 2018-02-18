----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:25:42 01/15/2018 
-- Design Name: 
-- Module Name:    Main - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Main is
    Port ( --x : in  STD_LOGIC;	--dane wejsciowe
			  --DecodeIn :in STD_LOGIC_VECTOR(3 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           --y : out  STD_LOGIC;		
			  led_out : out STD_LOGIC_VECTOR(4 DOWNTO 0);
			  JA : inout  STD_LOGIC_VECTOR (7 downto 0); -- PmodKYPD is designed to be connected to JA
				wyj_anody  : out   std_logic_vector (3 downto 0); 
				wyj_katody : out   std_logic_vector (7 downto 0)		  
			  );
	end Main;
architecture Behavioral of Main is

component Keypad is
	Port (
			 clk : in  STD_LOGIC;
          Row : in  STD_LOGIC_VECTOR (3 downto 0);
			 Col : out  STD_LOGIC_VECTOR (3 downto 0);
          DecodeOut : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
component wyswietlacz is
   port ( clk        : in    std_logic; 
          dana       : in    std_logic_vector (7 downto 0); 
          dana1      : in    std_logic_vector (7 downto 0); 
          dana2      : in    std_logic_vector (7 downto 0); 
          dana3      : in    std_logic_vector (7 downto 0); 
          reset      : in    std_logic; 
          wyj_anody  : out   std_logic_vector (3 downto 0); 
          wyj_katody : out   std_logic_vector (7 downto 0));
end component;
	
	type stan is(s0, s1, s2, s3, s4);
	signal s : stan;
	
	signal DecodeIn 	 : STD_LOGIC_VECTOR(3 downto 0);
	signal Mdana       :  std_logic_vector (7 downto 0); 
   signal Mdana1      :  std_logic_vector (7 downto 0); 
   signal Mdana2      :  std_logic_vector (7 downto 0); 
   signal Mdana3      :  std_logic_vector (7 downto 0);
   --signal Mwyj_anody  :  std_logic_vector (3 downto 0); 
   --signal Mwyj_katody :  std_logic_vector (7 downto 0);	
begin

C0: KEYPAD port map (clk=>clk, Row =>JA(7 downto 4), Col=>JA(3 downto 0), DecodeOut => DecodeIn);
C1: wyswietlacz port map (clk=>clk, reset=>reset, dana=>Mdana, dana1=>Mdana1, dana2=>Mdana2, dana3=>Mdana3, wyj_anody=>wyj_anody, wyj_katody=>wyj_katody);

--led_out <= '0'&DecodeIn; -- fajna zabawa kalwiatura

--	wyjscia : process(s)
--		begin
--			case s is
--			when s4 => led_out <="10000";
--				when others => led_out <= "00000";
--				
--				when s4 => y <='1';
--				led_out(4) <='1';
--				when others => y <= '0';
--			end case;
--	end process wyjscia;
	
	stany : process(clk, DecodeIn, reset,s)
	begin
	
	
	if reset ='1' then 
		s<= s0;
		led_out <="00000";
		Mdana <=  "11111111"; --nic
		Mdana1 <=  "11111111"; --nic
		Mdana2 <=  "11111111";--nic
		Mdana3 <=  "11111111";--nic
	
	
	elsif rising_edge (clk) then 
	case s is
	when s0=> if DecodeIn="0010" then 
						s<=s1;
						led_out <="00001";
						Mdana <=  "11111111"; --nic
						Mdana1 <=  "11000000"; --O
						Mdana2 <=  "10001110";--F
						Mdana3 <=  "10001110";--F
					 else 
						s<=s0;
						--led_out <="00000";						
					end if;
	when s1=> if DecodeIn="0100" then 
						s<=s2;
						led_out <="00010";
						Mdana <=  "11111111"; --nic
						Mdana1 <=  "11000000"; --O
						Mdana2 <=  "10001110";--F
						Mdana3 <=  "10001110";--F
						elsif DecodeIn="0010" then 
						s<=s1;
					 else 
						s<=s0;						
				 end if;
	when s2=> if DecodeIn="1000" then 
						s<=s3;
						led_out <="00100";
						Mdana <=  "11111111"; --nic
						Mdana1 <=  "11000000"; --O
						Mdana2 <=  "10001110";--F
						Mdana3 <=  "10001110";--F
						elsif DecodeIn="0100" then 
						s<=s2;
					 else 
						s<=s0;					
				end if;
	when s3=> if DecodeIn="0110" then 
						s<=s4;
						led_out <="01000";
						Mdana <=  "11111111"; --nic
						Mdana1 <=  "11000000"; --O
						Mdana2 <=  "10001110";--F
						Mdana3 <=  "10001110";--F
						elsif DecodeIn="1000" then 
						s<=s3;
					 else 
						s<=s0;
						--led_out <="00000";						
					end if;
	when s4=> if DecodeIn="0110" then 
					s<=s0;
					led_out <="10000";
						Mdana <=  "11111111"; --nic
						Mdana1 <=  "11111111"; --nic
						Mdana2 <=  "11000000";--o
						Mdana3 <=  "10101011";--n
					elsif DecodeIn="0110" then 
					s<=s4;
					 else 
						s<=s0;
						--led_out <="00000";						
					end if;
	when others =>s<=s0;
	end case;
	end if;
	
		--	case s is
	--		when s4 => led_out <="10000";
		--		when others => led_out <= "00000";
		--	end case;
			
	end process;
	
				
end Behavioral;

