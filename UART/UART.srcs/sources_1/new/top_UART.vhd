



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top_UART is
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
        
              --  For Simulation
              
        txOK      : out std_logic;        
		txStart   : out std_logic;
		
		rxOK      : out std_logic;
		rxStart   : out std_logic;
		rxOutS    : out std_logic_vector(bitNumber-1 downto 0)
   

	);
end top_UART;

architecture Behavioral of top_UART is

	type   TX_Buffer    is array ( (txNumber-1) downto 0 ) of std_logic_vector( bitNumber-1 downto 0);
	signal tXBuffer : TX_Buffer;
	
	type Tx_State is (IDLE,SEND,S_FINISH);
	signal txState : Tx_State := IDLE;
	
	type Rx_State is (IDLE,RECEIVE);
	signal rxState : Rx_State := IDLE;	
	
	type   RX_Buffer    is array ( (receiveNumber-1) downto 0 ) of std_logic_vector( bitNumber-1 downto 0);
	signal rXBuffer : RX_Buffer;
	
	constant firstDelay : integer := clockFreq / baudRate;
	signal sendNumber   : integer := 4;
	signal currentNumber: integer := 0;
	signal startTX      : std_logic := '0';
	signal sendData     : std_logic_vector(bitNumber-1 downto 0);
	signal txFinish     : std_logic :='0';
	signal ones         : integer   := 0;
	signal rxOut        : std_logic_vector(  bitNumber-1 downto 0) ;
	signal rxFinish     : std_logic:='0';
	signal countClock   : integer :=0;
                   -- TX Module 
component UART_Transmitter is
   generic
   (
        bitNumber : integer   := 8 ;
		baudRate  : integer   := 9600;
		parity    : std_logic := 'U' ;     --0:Even Parity 1:Odd Parity Others: None
		stopBits  : integer   := 1;
		stopLogic : std_logic := '1';
		clockFreq : integer   := 100_000_000
   );
   
   port
   (
        clock     : in  std_logic;
		startTX   : in  std_logic;
		txOut     : out std_logic;
		sendData  : in  std_logic_vector( ( bitNumber-1) downto 0);
		txFinish  : out std_logic;
		ones      : out integer 
   
   );
end component;

                   -- RX Module 
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
		rxPin     : in std_logic ;
		rxFinish  : out std_logic;
		rxOut     : out std_logic_vector(  bitNumber-1 downto 0)     

	);
end component;


begin


-- TX Module Port map


TX_Module:UART_Transmitter
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
    txOut    => txOut,
    sendData => sendData,
    txFinish => txFinish,
    ones     => ones

);


-- RX Module Port map

RX_Module: UART_Receiver
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
		rxOut     => rxOut,
		rxFinish  => rxFinish   

	);


UART_TX: process(clock)
begin
      
	 if( rising_edge(clock)) then
        

		 case txState is
		   
		        when IDLE =>
				
				   countClock <= countClock + 1;
				   
				   currentNumber <= 0 ;
				   
				   tXBuffer(0) <= X"5A";
				   tXBuffer(1) <= X"A4";
				   tXBuffer(2) <= X"F0";
				   tXBuffer(3) <= X"45";
				
				   if(countClock>=firstDelay ) then
				
                       txState <= SEND;
				
				   end if;
				   
		        when SEND =>
				
				  
                   if( currentNumber<=sendNumber-1) then 
                       sendData <= tXBuffer(currentNumber);
                       startTX <='1';
                       txOK<='0';
                       txStart<='1';
                       if( txFinish = '1') then
                          
                          
                          txOK<='1';
                          txStart<='0';
                          currentNumber <= currentNumber + 1;
    
                       end if;
                       
                    else
                       startTX <='0';
                       sendData<= x"00";
                       txState <= S_FINISH;
                    end if;	
                    
                    when S_FINISH =>
                    		startTx <= '0'	;
                    		sendData<= x"00";
                    		
		 end case;

	 end if;	 

end process UART_TX;

UART_Receive: process(clock)
begin
   
   if(rising_edge(clock))  then
   
       if( rxFinish = '1') then
       
         rxOutS <=rxOut;
         rxOk<='1';
         rxStart <='0';         
       else
         rxOk<='0';
         rxStart <='1';
          
       end if;
   
   end if;
   
   
end process UART_Receive;

end Behavioral;
