----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.02.2022 21:53:59
-- Design Name: 
-- Module Name: tb_PWM_Module - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_PWM_Module is
Generic 
(
    System_clock : integer := 100_000_000

);
end tb_PWM_Module;

architecture Behavioral of tb_PWM_Module is

component PWM_Module is

Generic
(
   System_clock : integer := 100_000_000
   
);

Port
(
    clock     : in std_logic;
    dutyCycle : in integer;
    freq      : in integer;
    outPWM    : out std_logic;
    enablePWM : in std_logic;
    timeHigh : out integer

);
end component;

signal   clock      :  std_logic;
signal   dutyCycle  :  integer;
signal   freq       :  integer := 0;
signal   outPWM     :  std_logic;
signal   enablePWM  :  std_logic;
signal   timeHigh   :  integer := 0;

begin

PWMSML : PWM_Module

Generic map
(
    System_clock => System_clock
)
Port map 
(
    clock       => clock     ,
    dutyCycle   => dutyCycle ,
    freq        => freq      ,
    outPWM      => outPWM    ,
    enablePWM   => enablePWM ,
    timeHigh    => timeHigh

); 
	
    Clk: process
         
            begin
            clock <= '0';
            wait for 5 ns;
            clock <= '1';
            wait for 5 ns;
            
    end process Clk;
    
    PWM_Sample : process
    begin
    
           enablePWM <= '0';
           
           freq <= 1000;
           dutyCycle <= 0;
           wait for 1 ms;
           
           enablePWM <= '1'; 
           for I in 0 to 19 loop
           
             wait for 1 ms;
             dutyCycle <= dutyCycle +5 ;

            end loop;      
            enablePWM <= '0'; 
            wait for 5 ms;   
            
              
            freq <= 20000;
            dutyCycle<= 0;
            enablePWM <= '1'; 
            
            for I in 0 to 19 loop
           
              wait for 50 us;
              dutyCycle <= dutyCycle +5 ;

            end loop;   
                 
    end process PWM_Sample;
    

end Behavioral;
