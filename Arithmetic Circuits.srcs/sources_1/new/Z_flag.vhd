----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/07/2020 05:22:42 PM
-- Design Name: 
-- Module Name: Z_flag - Behavioral
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

entity Z_flag is
    Port ( SUM : in STD_LOGIC_VECTOR (15 downto 0);
           Z : out STD_LOGIC);
end Z_flag;

architecture Behavioral of Z_flag is
constant num : std_logic_vector(15 downto 0) := x"0000";
begin
    process(SUM) is
    begin
    if (SUM = num) then
        Z <= '1';
    else 
        Z <= '0';
    end if;
    end process;
end Behavioral;
