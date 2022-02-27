----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.02.2022 17:12:32
-- Design Name: 
-- Module Name: top_UART_Simulation - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_UART_Simulation is
	Generic
	(

			bitNumber : integer    := 8 ;
			baudRate  : integer    := 2000000;
			parity    : std_logic  := 'U' ;     --0:Even Parity 1:Odd Parity Others: None
			stopBits  : integer    := 1;
			stopLogic : std_logic  := '1';
			clockFreq : integer    := 100_000_000;
			txNumber  : integer    := 10;
 			receiveNumber: integer := 100

	);
end top_UART_Simulation;

architecture Behavioral of top_UART_Simulation is


component top_UART is
	Generic
	(

			bitNumber : integer    := 8 ;
			baudRate  : integer    := 9600;
			parity    : std_logic  := 'U' ;     --0:Even Parity 1:Odd Parity Others: None
			stopBits  : integer    := 1;
			stopLogic : std_logic  := '1';
			clockFreq : integer    := 100_000_000;
			txNumber  : integer    := 10;
 			receiveNumber: integer := 100

	);
	
	port
	(
              -- System Clock
        clock     : in  std_logic;
        txOut     : out std_logic;
        rxPin     : in std_logic ;
        
        txOK      : out std_logic;        
		txStart   : out std_logic;
		
		rxOK      : out std_logic;
		rxStart   : out std_logic;
		rxOutS    : out std_logic_vector(bitNumber-1 downto 0)
        
		
   

	);
end component;

constant delay:integer:= (1000000000/baudRate) ;
constant waitTime : time := delay*1 ns; 

signal clock : std_logic := '0';
signal txOut : std_logic ;
signal simulSt: std_logic:='0';
signal rxPin : std_logic := '0';
signal txOK  :std_logic;
signal txStart :std_logic;
signal rxOK  :std_logic;
signal rxStart :std_logic;
signal rxOutS  :std_logic_vector(bitNumber-1 downto 0);
signal sendData : std_logic_vector(bitNumber-1 downto 0):=(others =>'0');

begin

STIM1: top_UART
	Generic map
	(
        bitNumber =>bitNumber ,
		baudRate  =>baudRate  ,
		parity    =>parity    ,
		stopBits  =>stopBits  ,
		stopLogic =>stopLogic ,
		clockFreq =>clockFreq ,
		txNumber  => txNumber,
		receiveNumber=>receiveNumber
	)
    Port map
	(

        clock     => clock,
		rxPin     => rxPin,
		txOut     => txOut, 
		
		txOK      => txOK,
		txStart   => txStart,
		rxOK      => rxOK,
		rxStart   => rxStart,
		rxOutS    => rxOutS
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
end process Sample;

end Behavioral;
