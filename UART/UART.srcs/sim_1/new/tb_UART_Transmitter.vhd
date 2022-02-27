----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.01.2022 16:23:20
-- Design Name: 
-- Module Name: tb_UART_Transmitter - Behavioral
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

entity tb_UART_Transmitter is
   generic
   (
        bitNumber : integer := 8 ;
		baudRate  : integer := 1000000;
		parity    : std_logic := 'U' ;     --0:Even Parity 1:Odd Parity Others: None
		stopBits  : integer := 2;
		stopLogic : integer := 0;
		clockFreq : integer := 100_000_000
   );

end tb_UART_Transmitter;

architecture Behavioral of tb_UART_Transmitter is

component UART_Transmitter is
   generic
   (
        bitNumber : integer := 8 ;
		baudRate  : integer := 9600;
		parity    : std_logic := 'U' ;     --0:Even Parity 1:Odd Parity Others: None
		stopBits  : integer := 1;
		stopLogic : integer := 1;
		clockFreq : integer := 100_000_000
   );
   
   port
   (
        clock     : in std_logic;
		startTX   : in std_logic;
		sendData  : in std_logic_vector( ( bitNumber-1) downto 0);
		txOut     : out std_logic;
		txFinish  : out std_logic;
		ones      : out integer
   
   );
end component;

signal      clock     :  std_logic :='0';
signal		startTX   :  std_logic :='0';
signal		sendData  :  std_logic_vector( ( bitNumber-1) downto 0):=(others=>'0');
signal		txOut     :  std_logic;
signal      txFinish  :  std_logic;
signal      ones      :  integer;
begin

STIM1:UART_Transmitter
generic map
(
        bitNumber => bitNumber ,
		baudRate => baudRate,
		parity   => parity ,     --0:Even Parity 1:Odd Parity Others: None
		stopBits  => stopBits,
		stopLogic  => stopLogic,
		clockFreq  => clockFreq
)

port map
(
    clock    => clock,
    startTX  => startTX,
    sendData => sendData,
    txOut    => txOut,
    txFinish => txFinish,
    ones     => ones

);

Clk: process
begin
clock <= '0';
wait for 5 ns;
clock <= '1';
wait for 5 ns;

end process;

transmit: process
begin

		startTX   <= '0';
		sendData  <= "10101010";
		wait for 1 ms;

		startTX   <= '1';

		wait for 1 ms;
		startTX   <= '0';

		wait for 3 ms;	
		
		assert false
		report  "SIM DONE"
		severity failure;
		
end process;

end Behavioral;


