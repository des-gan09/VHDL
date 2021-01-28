----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/25/2020 02:33:13 PM
-- Design Name: 
-- Module Name: lock_async - Behavioral
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

entity lock_async is
    Port ( in1 : in STD_LOGIC_VECTOR (3 downto 0);
           in2 : in STD_LOGIC_VECTOR (7 downto 4);
           in3 : in STD_LOGIC_VECTOR (11 downto 8);
           in4 : in STD_LOGIC_VECTOR (15 downto 12);
           lock : out STD_LOGIC;
           unlock : out STD_LOGIC);
end lock_async;



architecture Behavioral of lock_async is

constant num1 : std_logic_vector(3 downto 0) := x"4";
constant num2 : std_logic_vector(3 downto 0) := x"4";
constant num3 : std_logic_vector(3 downto 0) := x"1";
constant num4 : std_logic_vector(3 downto 0) := x"0";

begin

process(in1, in2, in3, in4) is
begin
    if ((in1 = num1) and (in2 = num2) and (in3 = num3) and (in4 = num4)) then
        unlock <= '1';
        lock <= '0';
    else 
        unlock <= '0';
        lock <= '1';
    end if;
    end process;
end Behavioral;
