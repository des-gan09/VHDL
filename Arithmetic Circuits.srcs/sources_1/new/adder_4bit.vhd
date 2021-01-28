----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/08/2020 12:21:37 PM
-- Design Name: 
-- Module Name: adder_4bit - Behavioral
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

entity adder_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end adder_4bit;

architecture Behavioral of adder_4bit is
component fulladder port (
        A : in std_logic;
        B : in std_logic;
        Cin : in std_logic;
        S : out std_logic;
        Cout: out std_logic);
    end component;
    
    signal c1,c2,c3 : std_logic;
begin

    s0: fulladder port map(A(0), B(0), Cin, Sum(0), c1);
    s1: fulladder port map(A(1), B(1), c1, Sum(1), c2);
    s2: fulladder port map(A(2), B(2), c2, Sum(2), c3);
    s3: fulladder port map(A(3), B(3), c3, Sum(3), Cout);

end Behavioral;
