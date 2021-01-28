----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/18/2020 04:14:09 PM
-- Design Name: 
-- Module Name: hex_to_sevseg - Behavioral
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

entity hex_to_sevseg is
    Port ( in_hex : in STD_LOGIC_VECTOR (3 downto 0);
           out_seg : out STD_LOGIC_VECTOR (7 downto 0));
end hex_to_sevseg;

architecture Behavioral of hex_to_sevseg is

begin

process(in_hex)
begin
    case(in_hex) is
        when "0000" => out_seg <= "01111110"; -- 0
        when "0001" => out_seg <= "00110000"; -- 1
        when "0010" => out_seg <= "01011010"; -- 2
        when "0011" => out_seg <= "01001111"; -- 3
        when "0100" => out_seg <= "01100110"; -- 4
        when "0101" => out_seg <= "01101101"; -- 5
        when "0110" => out_seg <= "01111101"; -- 6
        when "0111" => out_seg <= "00000111"; -- 7
        when "1000" => out_seg <= "01111111"; -- 8
        when "1001" => out_seg <= "01101111"; -- 9
        when "1010" => out_seg <= "01110111"; -- a
        when "1011" => out_seg <= "01111100"; -- b
        when "1100" => out_seg <= "00111001"; -- c
        when "1101" => out_seg <= "01011110"; -- d
        when "1110" => out_seg <= "01111001"; -- e
        when "1111" => out_seg <= "01110001"; -- f
        when others => NULL;
    end case;
end process;
end Behavioral;
