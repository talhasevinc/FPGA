----------------------------------------------------------------------------------

-- Create Date: 03.01.2022 15:17:03
-- Design Name: 
-- Module Name: UART_Transmitter - Behavioral

-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity UART_Transmitter is
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
		sendData  : in  std_logic_vector( ( bitNumber-1) downto 0);
		txOut     : out std_logic;
		txFinish  : out std_logic;
		ones      : out integer 
   
   );
end UART_Transmitter;

architecture Behavioral of UART_Transmitter is

type sendState is (IDLE,STARTBIT,DATA,PARITYBIT,STOPBIT);

signal tempBuffer   : std_logic_vector( ( bitNumber-1) downto 0);
signal currentState : sendState := IDLE;
signal clockCounter : integer   := 0   ;
signal waitClock    : integer   := clockFreq/baudRate;
signal stopCycle    : integer   := (clockFreq/baudRate) * stopBits;
signal bitCnt       : integer   := 0   ;
signal paritCalc    : std_logic := '0' ;
signal numOfone     : integer   := 0   ;
signal parityCnt    : integer    := 0;

begin

MainControl:  process(clock)
	begin
		if(rising_edge(clock)) then
		   
		   case currentState is
		   
		        when IDLE =>
		        
		            txFinish        <= '0' ;
			        txOut           <= '1' ; 
			        bitCnt          <=  0  ;
					parityCnt       <=  0  ;
					numOfone        <=  0  ;
		            if(startTX = '1') then
			  
			           
				       currentState <= STARTBIT;
				       txOut        <= '0' ; 
			  
			        end if;
		     
			     
				 when STARTBIT =>
				 
				    clockCounter <= clockCounter + 1;
					if( clockCounter >= waitClock ) then
					
					   currentState <= DATA;
					   clockCounter <= 0   ;
					   
					end if;
					
				when DATA     =>
				
				    if(bitCnt < bitNumber) then
				    	txOut        <= tempBuffer(bitCnt);
					    clockCounter <= clockCounter + 1;
					 end if;
					
					if(clockCounter >= waitClock) then
						
						clockCounter <= 0   ;
						bitCnt       <= bitCnt + 1;
					   
					end if;
					
					if( bitCnt >= (bitNumber) ) then
					
					    if( parity = '0' or parity = '1') then
						
							currentState <= PARITYBIT ;
							
						else
                            currentState <= STOPBIT ; 
							
						end if;	

					
				    end if;
					
				when   	PARITYBIT =>
					
					if(parityCnt < bitNumber) then
                        if( tempBuffer(parityCnt) = '1' ) then
                           numOfone <= numOfone + 1 ;
                        end if;                        
                        parityCnt <= parityCnt + 1;
                    else
                       paritCalc <= '1';
                       
                    end if;
					
					
				    if( parity = '0' and paritCalc = '1' )then
					
					     paritCalc <= '0';
					     
					    if ( numOfone mod 2 = 1 ) then 
						    txOut <= '1';
						else 
						
						    txOut <= '0';
							
						end if;
					
					elsif( parity = '1' and paritCalc = '1') then
					
					    if ( numOfone mod 2 = 1 ) then 
					    
						    txOut <= '0';
						else 
						
						    txOut <= '1';
							
						end if;					
					
					
					end if;
					
					clockCounter <= clockCounter + 1;
					
					if(clockCounter >= waitClock) then
						
						clockCounter <= 0   ;
						currentState <= STOPBIT;
						
					end if;					
					
				when   	STOPBIT =>    
				
					clockCounter <= clockCounter + 1;
					if( stopLogic = '1' ) then
					   txOut <= '1';
					   
					else
					   txOut <= '0';
				    
				    end if;
					
					if(clockCounter >= stopCycle) then
					
					    clockCounter <= 0;
					    txFinish        <= '1';
					    currentState <= IDLE;
					    
					
					end if;
					
				when others =>
		   
		          currentState <= IDLE;
					
		   end case;

		end if;
		
	end process;
	
	
tempBuffer   <= sendData;
ones         <= numOfone;

end Behavioral;
