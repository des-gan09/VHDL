----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/07/2020 03:13:51 PM
-- Design Name: 
-- Module Name: adder_16bit - Behavioral
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

entity adder_16bit is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           C_IN : in STD_LOGIC;
           SAT_EN : in STD_LOGIC;
           SUM : out STD_LOGIC_VECTOR (15 downto 0);
           V : out std_logic;
           Z : out std_logic;
           N : out std_logic;   
           C : out STD_LOGIC);
          
end adder_16bit;

architecture Behavioral of adder_16bit is

    component fulladder port (
        Cin, A, B : in std_logic;
        S, Cout: out std_logic);
    end component;
    
    component N_flag port (
        SUM : in std_logic;
        N : out std_logic);
    end component;
    
    component V_flag port (
        Cin, Cout: in std_logic;
        V : out std_logic);
     end component;
     
    component Z_flag port (
        SUM : in std_logic_vector;
        Z : out std_logic);
    end component;
    
    component sat port (
        SAT_EN,overflow,neg : in std_logic;
        sum : in std_logic_vector (15 downto 0);
        sat_sum: out std_logic_vector (15 downto 0));  
    end component;
    
    signal c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15 : std_logic;
    signal Cin : std_logic;
    signal Cout : std_logic;
    signal preSum : std_logic_vector (15 downto 0);
    signal neg : std_logic;
    signal over : std_logic;
    signal zero : std_logic;
    
begin
    -- 16 bit adder 
    s0: fulladder port map(C_IN, A(0), B(0), preSum(0), c1);
    s1: fulladder port map(c1, A(1), B(1), preSum(1), c2);
    s2: fulladder port map(c2, A(2), B(2), preSum(2), c3);
    s3: fulladder port map(c3, A(3), B(3), preSum(3), c4);
    s4: fulladder port map(c4, A(4), B(4), preSum(4), c5);
    s5: fulladder port map(c5, A(5), B(5), preSum(5), c6);
    s6: fulladder port map(c6, A(6), B(6), preSum(6), c7);
    s7: fulladder port map(c7, A(7), B(7), preSum(7), c8);
    s8: fulladder port map(c8, A(8), B(8), preSum(8), c9);
    s9: fulladder port map(c9, A(9), B(9), preSum(9), c10);
    s10: fulladder port map(c10, A(10), B(10), preSum(10), c11);
    s11: fulladder port map(c11, A(11), B(11), preSum(11), c12);
    s12: fulladder port map(c12, A(12), B(12), preSum(12), c13);
    s13: fulladder port map(c13, A(13), B(13), preSum(13), c14);
    s14: fulladder port map(c14, A(14), B(14), preSum(14), c15);
    s15: fulladder port map(c15, A(15), B(15), preSum(15), Cout);
    -- ZNV flag 
    s16: Z_flag port map(preSum, Z);
    s17: N_flag port map(preSum(15), neg);
    s18: V_flag port map(c15, Cout, over);
    s19: sat port map(SAT_EN, over, neg, preSum, SUM);
    N <= neg;
    V <= over;
    C <= Cout;
    
end Behavioral;
