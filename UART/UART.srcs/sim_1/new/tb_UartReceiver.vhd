----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.01.2022 14:29:29
-- Design Name: 
-- Module Name: tb_UartReceiver - Behavioral
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

entity tb_UartReceiver is
	Generic
	(
        bitNumber : integer := 8 ;
		baudRate  : integer := 115200;
		parity    : std_logic := 'U' ;     --0:Even Parity 1:Odd Parity Others: None
		stopBits  : integer := 1;
		stopLogic : std_logic := '1';
		clockFreq : integer := 100_000_000;
		receiveNumber: integer := 100
	);
end tb_UartReceiver;

architecture Behavioral of tb_UartReceiver is

component UART_Receiver is
	Generic
	(
        bitNumber : integer := 8 ;
		baudRate  : integer := 9600;
		parity    : std_logic := 'U' ;     --0:Even Parity 1:Odd Parity Others: None
		stopBits  : integer := 1;
		stopLogic : std_logic := '1';
		clockFreq : integer := 100_000_000;
		receiveNumber: integer := 100
	);
    Port 
	(

        clock     : in  std_logic;
		rxPin     : in std_logic;
		rxOut     : out std_logic_vector(bitNumber-1 downto 0)       

	);
end component;

constant delay:integer:= (1000000000/baudRate) ;
constant waitTime : time := delay*1 ns; 
signal clock : std_logic := '0';
signal rxPin : std_logic := '1';
signal rxOut : std_logic_vector(bitNumber-1 downto 0 ) := (others =>'0');
signal sendData : std_logic_vector(bitNumber-1 downto 0):=(others =>'0');
begin

STIM1: UART_Receiver
	Generic map
	(
        bitNumber =>bitNumber ,
		baudRate  =>baudRate  ,
		parity    =>parity    ,
		stopBits  =>stopBits  ,
		stopLogic =>stopLogic ,
		clockFreq =>clockFreq ,
		receiveNumber=>receiveNumber
	)
    Port map
	(

        clock     => clock,
		rxPin     => rxPin,
		rxOut     => rxOut   

	);
	
Clk: process
        begin
        clock <= '0';
        wait for 5 ns;
        clock <= '1';
        wait for 5 ns;
end process;

Sample: process
begin
    rxPin <= '0';
    wait for waitTime;
    loopBit : for k in 0 to bitNumber-1 loop
      rxPin <= sendData(k);
      wait for waitTime;
    end loop loopBit;
    
    rxPin <= '1';
    wait for waitTime;   
    wait for waitTime; 
    sendData <= sendData + 1;
end process;

end Behavioral;
