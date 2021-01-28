----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/26/2020 09:09:42 PM
-- Design Name: 
-- Module Name: locktop_sync - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity locktop_sync is
    Port ( digit1 : in STD_LOGIC_VECTOR (3 downto 0);
           digit2 : in STD_LOGIC_VECTOR (3 downto 0);
           button1 : in STD_LOGIC;
           button2 : in STD_LOGIC;
           lock : out STD_LOGIC;
           unlock : out STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           ssd1 : out STD_LOGIC_VECTOR (7 downto 0);
           ssd2 : out STD_LOGIC_VECTOR (7 downto 0);
           ssd3 : out STD_LOGIC_VECTOR (7 downto 0);
           ssd4 : out STD_LOGIC_VECTOR (7 downto 0));
end locktop_sync;

architecture Behavioral of locktop_sync is

component register_simple
    port(
        reg_in: IN std_logic_vector (3 downto 0);
        clk: IN std_logic;
        rst: IN std_logic;
        dir: IN std_logic;
        en: IN std_logic;  
        reg_out1: OUT std_logic_vector(3 downto 0));
      
    end component;
    
    component hex_to_sevseg
    port(
        in_hex: in std_logic_vector(3 downto 0);
        out_seg: out std_logic_vector(7 downto 0));
    end component;
    
    component lock_async
    port(
       in1 : in STD_LOGIC_VECTOR (3 downto 0);
       in2 : in STD_LOGIC_VECTOR (7 downto 4);
       in3 : in STD_LOGIC_VECTOR (11 downto 8);
       in4 : in STD_LOGIC_VECTOR (15 downto 12);
       lock : out STD_LOGIC;
       unlock : out STD_LOGIC);
     end component;
     
     signal out_reg1: std_logic_vector (3 downto 0);
     signal out_reg2: std_logic_vector (3 downto 0);
     signal out_reg3: std_logic_vector (3 downto 0);
     signal out_reg4: std_logic_vector (3 downto 0);
begin
-- Structural 
    g1: register_simple port map(
        reg_in => digit1,
        clk => clk,
        rst => reset,
        dir => '0',
        en => button2,
        reg_out1 => out_reg2);
        
     g2: register_simple port map(
        reg_in => digit2,
        clk => clk,
        rst => reset,
        dir => '0',
        en => button2,
        reg_out1 => out_reg1);
           
     g3: register_simple port map(
        reg_in => digit1,
        clk => clk,
        rst => reset,
        dir => '0',
        en => button1,
        reg_out1 => out_reg4); 
        
     g4: register_simple port map(
        reg_in => digit2,
        clk => clk,
        rst => reset,
        dir => '0',
        en => button1,
        reg_out1 => out_reg3);
     
     g5: hex_to_sevseg port map(
        in_hex => out_reg1,
        out_seg => ssd1);
     
     g6: hex_to_sevseg port map(
        in_hex => out_reg2,
        out_seg => ssd2);
        
     g7: hex_to_sevseg port map(
        in_hex => out_reg3,
        out_seg => ssd3);
        
     g8: hex_to_sevseg port map(
        in_hex => out_reg4,
        out_seg => ssd4);
      
     g9: lock_async port map(
        in1 => out_reg1,
        in2 => out_reg2,
        in3 => out_reg3,
        in4 => out_reg4,
        lock => lock,
        unlock => unlock);

end Behavioral;
