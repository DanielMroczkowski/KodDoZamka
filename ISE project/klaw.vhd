--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:11:47 01/25/2018
-- Design Name:   
-- Module Name:   C:/Labuprog/E5T1S1/KodDoZamka/klaw.vhd
-- Project Name:  KodDoZamka
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: KEYPAD
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY klaw IS
END klaw;
 
ARCHITECTURE behavior OF klaw IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT KEYPAD
    PORT(
         clk : IN  std_logic;
         Row : IN  std_logic_vector(3 downto 0);
         Col : OUT  std_logic_vector(3 downto 0);
         DecodeOut : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal Row : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Col : std_logic_vector(3 downto 0);
   signal DecodeOut : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: KEYPAD PORT MAP (
          clk => clk,
          Row => Row,
          Col => Col,
          DecodeOut => DecodeOut
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		wait for 10 ns;
		Row <="1011";


		

      wait;
   end process;

END;
