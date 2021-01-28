----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/08/2020 09:06:39 PM
-- Design Name: 
-- Module Name: bcd_2digit - Behavioral
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

entity bcd_2digit is
    Port ( A : in std_logic_vector (7 downto 0);
           B : in std_logic_vector (7 downto 0);
           Cin : in STD_LOGIC;
           Sum : out std_logic_vector (8 downto 0));
end bcd_2digit;

architecture Behavioral of bcd_2digit is
    component bcd_adder is 
        port (
        A, B: in unsigned (3 downto 0);
        Cin : in std_logic;
        SUM : out unsigned (3 downto 0);
        Cout : out std_logic);
    end component;
    
    component check_digit is
        port (
           A : in std_logic_vector (3 downto 0);
           sel : out STD_LOGIC);
    end component;
    
    component mux_digit is
        port (
           s1 : in STD_LOGIC;
           s2 : in STD_LOGIC;
           s3 : in STD_LOGIC;
           s4 : in STD_LOGIC;
           preSum : in unsigned (8 downto 0);
           Sum : out unsigned (8 downto 0));
    end component;
    
    signal carry,sel1,sel2,sel3,sel4 : std_logic;
    signal in_A,in_B : unsigned (7 downto 0);
    signal out_S,pre_S: unsigned (8 downto 0);
    
begin
    in_A <= unsigned(A);
    in_B <= unsigned(B);
    
    
    s0: bcd_adder port map(
        in_A(3 downto 0), in_B(3 downto 0), Cin, pre_S(3 downto 0), carry);
    s1: bcd_adder port map(
        in_A(7 downto 4), in_B(7 downto 4), carry, out_S (7 downto 4), out_S(8)); 
        
--    s2: check_digit port map(A(3 downto 0), sel1);
--    s3: check_digit port map(B(3 downto 0), sel2);
--    s4: check_digit port map(A(7 downto 4), sel3);
--    s5: check_digit port map(B(7 downto 4), sel4);
--    s6: mux_digit port map(
--        sel1, sel2, sel3, sel4, pre_S, out_S);
    SUM <= std_logic_vector(out_S);
end Behavioral;
