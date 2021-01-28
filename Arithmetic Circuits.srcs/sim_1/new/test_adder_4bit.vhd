----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/08/2020 12:26:22 PM
-- Design Name: 
-- Module Name: test_adder_4bit - Behavioral
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
use IEEE.Numeric_Std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_adder_4bit is
--  Port ( );
end test_adder_4bit;

architecture Behavioral of test_adder_4bit is
    component adder_4bit port (   
        A : in std_logic_vector (3 downto 0);
        B : in std_logic_vector (3 downto 0);
        Cin : in std_logic;
        Sum : out STD_LOGIC_VECTOR (3 downto 0);
        Cout : out STD_LOGIC);
    end component;
    
    signal A: std_logic_vector(3 downto 0);
    signal B: std_logic_vector (3 downto 0);
    signal Cin: std_logic;
    signal Sum: std_logic_vector(3 downto 0):= "0000";
    signal Cout:  std_logic := '0';
    
begin
uut: adder_4bit port map (
    A => A,
    B => B,
    Cin => Cin,
    Sum => Sum,
    Cout => Cout);
    
sim: process
    begin
    A <= "1100";
    B <= "1101";
    Cin <= '0';
    wait for 100ns;
    end process;
end Behavioral;
