--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : wyswietlacz.vhf
-- /___/   /\     Timestamp : 01/05/2018 11:12:44
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan6 -flat -suppress -vhdl C:/Labuprog/E5T1S1/zamek05_01/wyswietlacz.vhf -w C:/Labuprog/E5T1S1/zamek05_01/wyswietlacz.sch
--Design Name: wyswietlacz
--Device: spartan6
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity wyswietlacz is
   port ( clk        : in    std_logic; 
          dana       : in    std_logic_vector (7 downto 0); 
          dana1      : in    std_logic_vector (7 downto 0); 
          dana2      : in    std_logic_vector (7 downto 0); 
          dana3      : in    std_logic_vector (7 downto 0); 
          reset      : in    std_logic; 
          wyj_anody  : out   std_logic_vector (3 downto 0); 
          wyj_katody : out   std_logic_vector (7 downto 0));
end wyswietlacz;

architecture BEHAVIORAL of wyswietlacz is
   attribute BOX_TYPE   : string ;
   signal H          : std_logic;
   signal L          : std_logic;
   signal XLXN_41    : std_logic;
   signal XLXN_42    : std_logic_vector (1 downto 0);
   component clock_div
      port ( clk_in  : in    std_logic; 
             reset   : in    std_logic; 
             clk_out : out   std_logic);
   end component;
   
   component mod4
      port ( clk : in    std_logic; 
             SEL : out   std_logic_vector (1 downto 0));
   end component;
   
   component module1z4
      port ( Wej : in    std_logic_vector (1 downto 0); 
             Wyj : out   std_logic_vector (3 downto 0));
   end component;
   
   component mux32to8
      port ( SEL        : in    std_logic_vector (1 downto 0); 
             d          : in    std_logic_vector (7 downto 0); 
             d1         : in    std_logic_vector (7 downto 0); 
             d2         : in    std_logic_vector (7 downto 0); 
             d3         : in    std_logic_vector (7 downto 0); 
             wyjsciemux : out   std_logic_vector (7 downto 0));
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
begin
   XLXI_1 : clock_div
      port map (clk_in=>clk,
                reset=>reset,
                clk_out=>XLXN_41);
   
   XLXI_2 : mod4
      port map (clk=>XLXN_41,
                SEL(1 downto 0)=>XLXN_42(1 downto 0));
   
   XLXI_3 : module1z4
      port map (Wej(1 downto 0)=>XLXN_42(1 downto 0),
                Wyj(3 downto 0)=>wyj_anody(3 downto 0));
   
   XLXI_4 : mux32to8
      port map (d(7 downto 0)=>dana3(7 downto 0),
                d1(7 downto 0)=>dana2(7 downto 0),
                d2(7 downto 0)=>dana1(7 downto 0),
                d3(7 downto 0)=>dana(7 downto 0),
                SEL(1 downto 0)=>XLXN_42(1 downto 0),
                wyjsciemux(7 downto 0)=>wyj_katody(7 downto 0));
   
   XLXI_5 : GND
      port map (G=>L);
   
   XLXI_6 : VCC
      port map (P=>H);
   
end BEHAVIORAL;



