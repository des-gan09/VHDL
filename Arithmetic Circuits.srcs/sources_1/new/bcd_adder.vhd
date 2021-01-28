----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/08/2020 05:03:03 PM
-- Design Name: 
-- Module Name: bcd_adder - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd_adder is
    Port ( A : in unsigned (3 downto 0);
           B : in unsigned (3 downto 0);
           Cin : in STD_LOGIC;
           SUM : out unsigned (3 downto 0);
           Cout : out STD_LOGIC);
end bcd_adder;

architecture Behavioral of bcd_adder is

begin
process(A,B,Cin)
variable temp : unsigned (4 downto 0);
begin
    temp := ('0' & A) + ('0' & B) + ("0000" & Cin);
    if (temp > 9) then
        Cout <= '1';
        SUM <= RESIZE((temp + "00110"),4);
    else 
        Cout <= '0';
        SUM <= temp(3 downto 0);
    end if;
    end process;
end Behavioral;
