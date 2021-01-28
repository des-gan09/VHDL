----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/07/2020 06:16:27 PM
-- Design Name: 
-- Module Name: sat - Behavioral
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

entity sat is
    Port ( SAT_EN : in STD_LOGIC;
           overflow : in STD_LOGIC;
           neg : in STD_LOGIC;
           sum : in STD_LOGIC_VECTOR (15 downto 0);
           sat_sum : out STD_LOGIC_VECTOR (15 downto 0));
end sat;

architecture Behavioral of sat is

begin
process(SAT_EN, overflow, sum) is
begin
    if ((SAT_EN and overflow) = '1') then
        if (neg = '0') then
            sat_sum <= x"8000";
        elsif (neg = '1') then
            sat_sum <= x"7fff";
        end if;
    else 
        sat_sum <= sum;
    end if;
    end process;
end Behavioral;
