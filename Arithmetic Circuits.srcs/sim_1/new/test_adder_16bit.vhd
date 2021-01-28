----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/07/2020 03:27:04 PM
-- Design Name: 
-- Module Name: test_adder_16bit - Behavioral
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

entity test_adder_16bit is
--  Port ( );
end test_adder_16bit;

architecture Behavioral of test_adder_16bit is

    component adder_16bit port (
        A : in std_logic_vector (15 downto 0);
        B : in std_logic_vector (15 downto 0);
        C_IN : in std_logic;
        SAT_EN : in STD_LOGIC;
        SUM : out STD_LOGIC_VECTOR (15 downto 0);
        V : out std_logic;
        Z : out std_logic;
        N : out std_logic;   
        C : out STD_LOGIC);
    end component;
    
    signal A: std_logic_vector (15 downto 0);
    signal B: std_logic_vector (15 downto 0);
    signal C_IN: std_logic;
    signal SAT_EN: std_logic;
    signal SUM:  STD_LOGIC_VECTOR (15 downto 0):=x"0000";
    signal V : std_logic:= '0';
    signal N : std_logic:= '0';
    signal Z : std_logic:= '0';
    signal C : std_logic:= '0';
    
    type NumericCodeType is array (4 downto 0) of Integer range -32768 to 32767;
    constant INPUTA: NumericCodeType := (125,8,145,15767,-32000);
    constant INPUTB: NumericCodeType := (125,-8,-70,32000,-10000);
    constant flag : Integer := 0;
begin
uut: adder_16bit port map (
    A => A,
    B => B,
    C_IN => C_IN,
    SAT_EN => SAT_EN,
    SUM => SUM,
    V => V,
    Z => Z,
    N => N,
    C => C);
sim: process
    begin
    for i in 4 downto 0 loop
        
        A <= std_logic_vector(to_signed(INPUTA(i),16));
        B <= std_logic_vector(to_signed(INPUTB(i),16));
        C_IN <= '0';
        SAT_EN <= '1';
        wait for 100ps;
     end loop;
     end process;
end Behavioral;
