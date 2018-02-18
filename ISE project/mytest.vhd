--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:16:49 01/25/2018
-- Design Name:   
-- Module Name:   C:/Labuprog/E5T1S1/KodDoZamka/mytest.vhd
-- Project Name:  KodDoZamka
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Main
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
 
ENTITY mytest IS
END mytest;
 
ARCHITECTURE behavior OF mytest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Main
    PORT(
         DecodeIn : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         led_out : OUT  std_logic_vector(4 downto 0);
         JA : INOUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

	--BiDirs
   signal DecodeIn : std_logic_vector(3 downto 0) :="0010";
   signal JA : std_logic_vector(7 downto 0) := "00000000";

 	--Outputs
   signal led_out : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Main PORT MAP (
          DecodeIn => DecodeIn,
          clk => clk,
          reset => reset,
          led_out => led_out,
          JA => JA
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
      --wait for 100 ns;	

      wait for clk_period*10;
		
		JA <= "00000000";
		
		
		reset <= '1';
		wait for 10 ns;
		reset <= '0';
		
		--wait for 10 ns;
		--DecodeIn <="0010";
		--wait for 10 ns;
		--DecodeIn <="0100";
		--wait for 10 ns;
		--DecodeIn <="1000";
		--wait for 10 ns;
		--DecodeIn <="0110";

      -- insert stimulus here 

      wait;
   end process;

END;
