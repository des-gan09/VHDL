----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/08/2020 09:34:42 PM
-- Design Name: 
-- Module Name: test_bcd_2digit - Behavioral
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

entity test_bcd_2digit is
--  Port ( );
end test_bcd_2digit;

architecture Behavioral of test_bcd_2digit is
    component bcd_2digit port (
           A : in std_logic_vector (7 downto 0);
           B : in std_logic_vector (7 downto 0);
           Cin : in STD_LOGIC;
           Sum : out std_logic_vector (8 downto 0));
     end component;
     signal A: std_logic_vector(7 downto 0) := (others => '0');
     signal B: std_logic_vector(7 downto 0) := (others => '0');
     signal Sum: std_logic_vector (8 downto 0);
     signal Cin: std_logic;
begin
uut: bcd_2digit port map(
    A => A,
    B => B,
    Cin => Cin,
    Sum => Sum);
    
sim: process
    begin
    A <= x"71";
    B <= x"56";
    Cin <= '0';
    wait for 10ps;
    end process;
end Behavioral;
