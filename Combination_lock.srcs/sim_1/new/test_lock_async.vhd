----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/25/2020 03:03:39 PM
-- Design Name: 
-- Module Name: test_lock_async - Behavioral
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

entity test_lock_async is
--  Port ( );
end test_lock_async;

architecture Behavioral of test_lock_async is
    component lock_async 
        port (in1 : IN std_logic_vector (3 downto 0);
               in2: IN std_logic_vector (7 downto 4);
               in3: IN std_logic_vector (11 downto 8);
               in4: IN std_logic_vector (15 downto 12);
               lock: OUT std_logic ;
               unlock: OUT std_logic);
    end component; 
signal in1: std_logic_vector (3 downto 0) := x"1";
signal in2: std_logic_vector (3 downto 0) := x"0";
signal in3: std_logic_vector (3 downto 0) := x"4";
signal in4: std_logic_vector (3 downto 0) := x"4";
signal lock: std_logic;
signal unlock: std_logic;

begin
uut: lock_async port map(
    in1 => in1,
    in2 => in2,
    in3 => in3,
    in4 => in4,
    lock => lock,
    unlock => unlock);
    
    sim: process
    begin
    end process;
end Behavioral;
