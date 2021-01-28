----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/19/2020 10:51:52 AM
-- Design Name: 
-- Module Name: test_hex_to_seg - Behavioral
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
USE ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_hex_to_seg is
--  Port ( );
end test_hex_to_seg;

architecture Behavioral of test_hex_to_seg is
    component hex_to_sevseg
        port( in_hex: IN std_logic_vector (3 downto 0);
             out_seg: OUT std_logic_vector (7 downto 0));
    end component;
    
signal in_hex: std_logic_vector (3 downto 0):= "0000";
signal out_seg: std_logic_vector (7 downto 0);
  
begin
uut: hex_to_sevseg port map(
    in_hex => in_hex,
    out_seg => out_seg);
    
    sim: process 
    begin
    in_hex <= "0000";
        for i in 1 to 16 loop 
            wait for 10ps;
            if (in_hex = "0000") then
                assert (out_seg = "01111110") report "bad vector" severity error; -- 0
            elsif (in_hex = "0001") then
                assert (out_seg = "00110000") report "bad vector" severity error; -- 1
            elsif (in_hex = "0010") then
                assert (out_seg = "01011010") report "bad vector" severity error; -- 2
            elsif (in_hex = "0011") then
                assert (out_seg = "01001111") report "bad vector" severity error; -- 3
            elsif (in_hex = "0100") then
                assert (out_seg = "01100110") report "bad vector" severity error; -- 4
            elsif (in_hex = "0101") then
                assert (out_seg = "01101101") report "bad vector" severity error; -- 5
             elsif (in_hex = "0110") then
                assert (out_seg = "01111101") report "bad vector" severity error; -- 6
            elsif (in_hex = "0111") then
                assert (out_seg = "00000111") report "bad vector" severity error; -- 7
            elsif (in_hex = "1000") then
                assert (out_seg = "01111111") report "bad vector" severity error; -- 8
            elsif (in_hex = "1001") then
                assert (out_seg = "01101111") report "bad vector" severity error; -- 9
            elsif (in_hex = "1010") then
                assert (out_seg = "01110111") report "bad vector" severity error; -- a
            elsif (in_hex = "1011") then
                assert (out_seg = "01111100") report "bad vector" severity error; -- b
            elsif (in_hex = "1100") then
                assert (out_seg = "00111001") report "bad vector" severity error; -- c
            elsif (in_hex = "1101") then
                assert (out_seg = "01011110") report "bad vector" severity error; -- d
            elsif (in_hex = "1110") then
                assert (out_seg = "01111001") report "bad vector" severity error; -- e
            elsif (in_hex = "1111") then
                assert (out_seg = "01110001") report "bad vector" severity error; -- f
            end if;
            in_hex <= in_hex + '1';
        end loop;
        wait;
    end process;

end Behavioral;
