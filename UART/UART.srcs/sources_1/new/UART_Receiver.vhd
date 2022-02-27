


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UART_Receiver is
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
end UART_Receiver;

architecture Behavioral of UART_Receiver is

	type receiveState is (IDLE,STARTBIT,DATA,PARITYBIT,WRPARITY,STOPBIT,WAITNew);
	type RX_Buffer    is array ( (receiveNumber-1) downto 0 ) of std_logic_vector( bitNumber-1 downto 0);
	
	constant SampleClock : integer :=  clockFreq/baudRate;  
	constant StopClock   : integer :=  ( clockFreq/baudRate ) * stopBits; 
	constant waitFinish  : integer :=  ( clockFreq/baudRate ) * stopBits; 
	
	signal RxProcess: receiveState := IDLE;
	signal ReceiveBuffer : RX_Buffer;
	signal clkCounter : integer := 0;
	signal dataNumber : integer := 0;
	signal bitNum  : integer := 0;
	signal tempBuffer : std_logic_vector( bitNumber-1 downto 0);
	signal numberOne : integer := 0;
	signal parityCnt : integer := 0;
	signal currentParity : std_logic;
	signal parityControl: std_logic := '0';
	signal resetVar     : std_logic :=  '1';
	begin

    ReceiveProcess : process(clock)
	begin
	
	 if( rising_edge(clock)   ) then
	 
	     case RxProcess is
		 
		     when IDLE =>
			 
			     rxFinish <= '0';
			     if( rxPin = '0') then

				    RxProcess <= STARTBIT;
					clkCounter <= 0;
					
			     else
				    RxProcess <= IDLE;
					
				 end if;
			 
			 
			 when STARTBIT =>
			  
			    clkCounter <= clkCounter + 1;
				
				if(rxPin = '1') then
				
				    RxProcess  <=  IDLE;
				   
				end if;
				
				if(clkCounter >= (SampleClock/2) ) then
				
				    if( rxPin = '0' ) then
					    
						RxProcess  <= DATA;
						clkCounter <= 0;
						bitNum     <= 0;

					end if;
				
				end if;
				
			    
			 
		     when DATA =>
			 
			    clkCounter <= clkCounter + 1;
				 
				if(bitNum >= bitNumber) then
				
				    clkCounter <=  0 ;
					
					if( parity = '0' or parity = '1') then
						
						RxProcess <= PARITYBIT ;
						numberOne <=  0;
						parityCnt <=  0;
							
					else
					
                        RxProcess <= STOPBIT ; 
							
					end if;					    
				
				end if;
				
				
				if(clkCounter >= SampleClock ) then
				
				    clkCounter <=  0;
					tempBuffer(bitNum)  <= rxPin ;
					bitNum <= bitNum + 1;
				
				end if;				 
				
			 
			 
			 when PARITYBIT =>	
			 
			    clkCounter <= clkCounter + 1;
				
				if(parityCnt < bitNumber) then
				   
				    if( tempBuffer(parityCnt) = '1' ) then
				      numberOne <= numberOne + 1;
				    end if;
					
					parityCnt <= parityCnt + 1;
					parityControl <= '0';
					
				else
					parityControl <= '1';
					
				end if;
				
				if(parityControl = '1') then
				    
					parityControl <= '0';
					 
					if(parity = '1') then
					
					    if( ( numberOne mod  2) = 0  ) then
					   
					      currentParity <= '1';
						
						else
						
						  currentParity <= '0';
						  
					    end if;
				    else
					
					    if( ( numberOne mod  2) = 0  ) then
					   
					      currentParity <= '0';
						
						else
						
						  currentParity <= '1';
						  
					    end if;					
					
					end if;
					
				end if;
				
				if(clkCounter >= SampleClock ) then
				
	
					if( rxPin = currentParity) then
					
						RxProcess <= STOPBIT ;
					
					else
					
					    RxProcess <= WRPARITY ;
						
					end if;
					
				end if;
				
			 when WRPARITY =>
			    clkCounter <= clkCounter + 1;
			 
				if(clkCounter >= StopClock ) then
				
				    clkCounter <=  0;
					dataNumber <= dataNumber + 1; 
					rxOut      <= tempBuffer;
					
					resetVar <= '1';
                    RxProcess <= WAITNew;					    
				 end if;
				    
		     when STOPBIT =>
			 
			    clkCounter <= clkCounter + 1;
			 
				if(clkCounter >= StopClock ) then
				
				    clkCounter <=  0;
					
					if(rxPin = stopLogic) then
					
					  ReceiveBuffer(dataNumber) <= tempBuffer;
					
					else
					
					  ReceiveBuffer(dataNumber) <= (others=>'0');
					  					
					end if;
					dataNumber <= dataNumber + 1; 
					rxOut      <= tempBuffer;
					
					resetVar <= '1';
					
                    RxProcess <= WAITNew;	
                    
					
				end if;		
				
			when WAITNew =>	 
			
				clkCounter <= clkCounter + 1;
				 
				if(resetVar = '1' ) then
				    resetVar <= '0';
					if(dataNumber >= (receiveNumber-1) ) then
					    dataNumber <= 0;
						
					end if;
					
				end if;
				
				if(clkCounter >= (SampleClock/2) ) then
				
				    clkCounter <=  0;
				    rxFinish <= '1';
					RxProcess <= IDLE;
			
				end if;		
				
			when others =>
		   
		          RxProcess <= IDLE;	
		          		    
		 end case;
	 
	 end if;
	
	end process ReceiveProcess;

end Behavioral;
