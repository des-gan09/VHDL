----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/08/2020 09:57:59 PM
-- Design Name: 
-- Module Name: mux_digit - Behavioral
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
use ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_digit is
    Port ( s1 : in STD_LOGIC;
           s2 : in STD_LOGIC;
           s3 : in STD_LOGIC;
           s4 : in STD_LOGIC;
           preSum : in unsigned (8 downto 0);
           Sum : out unsigned (8 downto 0));
end mux_digit;

architecture Behavioral of mux_digit is

begin
process(s1,s2,s3,s4,preSum)
begin
    if ((s1 and s2 and s3 and s4) = '1') then
        Sum <= "000000000";
    else 
        Sum <= preSum;
    end if;
    end process;
end Behavioral;
