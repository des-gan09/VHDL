----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/08/2020 09:51:54 PM
-- Design Name: 
-- Module Name: check_digit - Behavioral
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

entity check_digit is
    Port ( A : in std_logic_vector (3 downto 0);
           sel : out STD_LOGIC);
end check_digit;

architecture Behavioral of check_digit is

begin
process(A)
begin
    if A > x"9" then
        sel <= '1';
    else 
        sel <= '0';
    end if;  
    end process;
end Behavioral;
