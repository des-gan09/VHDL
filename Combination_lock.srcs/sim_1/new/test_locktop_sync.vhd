----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/26/2020 09:34:27 PM
-- Design Name: 
-- Module Name: test_locktop_sync - Behavioral
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

entity test_locktop_sync is
--  Port ( );
end test_locktop_sync;

architecture Behavioral of test_locktop_sync is

component locktop_sync 
        port( digit1 : in std_logic_vector (3 downto 0);
           digit2 : in std_logic_vector (3 downto 0);
           button1 : in STD_LOGIC;
           button2 : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk: in std_logic;
           ssd1: out std_logic_vector (7 downto 0);
           ssd2: out std_logic_vector (7 downto 0);
           ssd3: out std_logic_vector (7 downto 0);
           ssd4: out std_logic_vector (7 downto 0);
           lock, unlock: out std_logic);
     end component;

     signal digit1: std_logic_vector (3 downto 0);
     signal digit2: std_logic_vector (3 downto 0);
     signal button1: std_logic := '0';
     signal button2: std_logic := '0';
     signal lock: std_logic;
     signal unlock: std_logic;
     signal reset: std_logic;
     signal clk: std_logic;
     signal ssd1: std_logic_vector(7 downto 0);
     signal ssd2: std_logic_vector(7 downto 0);
     signal ssd3: std_logic_vector(7 downto 0);
     signal ssd4: std_logic_vector(7 downto 0);
     
     type NumericCodeType is array (23 downto 0) of Integer range 0 to 15;
     constant INPUT : NumericCodeType := (4,5,2,6,4,4,1,0,5,4,3,7,5,5,0,1,6,7,0,4,6,6,3,2);
     constant PERIOD: time:= 1ps;
     signal flag: std_logic := '0'; -- button1 when 0, button2 when 1
begin
uut: locktop_sync port map(
        digit1 => digit1,
        digit2 => digit2,
        button1 => button1,
        button2 => button2,
        reset => reset,
        clk => clk,
        ssd1 => ssd1,
        ssd2 => ssd2,
        ssd3 => ssd3,
        ssd4 => ssd4,
        lock => lock,
        unlock => unlock);
        
CLK_PROC: process
begin 
    wait for PERIOD;
    if clk = '1' then
        clk <= '0';
    else
        clk <= '1';
    end if;
end process;
    
sim: process
   begin
        -- How to set clock???????
        reset <= '1';
        wait for 1ns;
        reset <= '0';
        for i in 11 downto 0 loop
           digit1 <= std_logic_vector(to_unsigned(INPUT(2*i), 4));
           digit2 <= std_logic_vector(to_unsigned(INPUT(2*i + 1), 4)); 
           wait for 10ns;
           
               if flag = '0' then
                    button2 <= '1'; -- button 2
                    wait for 1ns;
                    button2 <= '0';
                    flag <= '1';
                else 
                    button1 <= '1'; -- button 1
                    wait for 1ns;
                    button1 <= '0';
                    flag <= '0';
                end if;
                     
        end loop;
   end process;
   
end Behavioral;
