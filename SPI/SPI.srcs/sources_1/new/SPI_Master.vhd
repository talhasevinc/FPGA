


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity spiMaster is
Generic
(
    CPOL              : std_logic := '1';
	CPHA              : std_logic := '1';
	transmitLength    : integer   := 8 ;
	SPI_Speed         : integer   := 5000000;
	SystemClock       : integer   := 100000000
	
);

port
(
    clock            : in std_logic  ;
	transmitB        : in std_logic_vector( transmitLength-1 downto 0 );
	Miso             : in std_logic;	
	enableTransmit   : in std_logic;
	enableReceive    : in std_logic;
	
	received         : out std_logic_vector( transmitLength-1 downto 0 );
	receiveOk        : out std_logic;
    transmitOk	     : out std_logic;
	Mosi             : out std_logic;
    busyTransmit     : out std_logic;
    busyReceive      : out std_logic;
	SPIClk           : out std_logic;      	
	CS               : out std_logic  

);

end spiMaster;

architecture Behavioral of spiMaster is

type StateOfSPI is (IDLE,CONTROL,TRANSMIT,RECEIVE ,SAMPLE );

constant SPI_Period   : integer   := ( SystemClock / (2*SPI_Speed ) );
constant halfPeriod   : integer   :=  SPI_Period/2;
signal state          : StateOfSPI:= IDLE;
signal SPIClkCounter  : integer   :=  0  ;
signal sampleCounter  : integer   :=  0  ;
signal enableSPIClock : std_logic := '0' ;
signal spiClockBuf    : std_logic := '0' ;
signal controlCS      : std_logic  := '0' ;
signal IdleClock      : std_logic  := '0' ;
signal transmitBuf    : std_logic_vector ( transmitLength-1 downto 0 ):=(others =>'0');
signal receiveBuf     : std_logic_vector ( transmitLength-1 downto 0 ):=(others =>'0');
signal transmitState  : std_logic  :='0';
signal dataCounter    : integer := 7;
signal receiveBit     : integer := 0;
signal receiveFirst   : std_logic := '0';
signal firstSample    : std_logic :='0';
signal startControl   : std_logic := '0';
signal tempMosi       : std_logic := '0';
signal firstSclk      : std_logic := '0';
signal CPHOFirst      : std_logic := '0';
signal tempMiso       : std_logic := '0';
begin


	SPIClk <= spiClockBuf;
	Mosi   <= tempMosi;
	tempMiso <= Miso;


	SPIClock: process( clock )
	begin
	
		if( rising_edge( clock ) ) then
         
           if( enableSPIClock = '1' )  then
              
              if(firstSclk = '0') then
                 firstSclk <= '1';
                 spiClockBuf<= not(CPOL);
              
              else 
                  SPIClkCounter <= SPIClkCounter + 1;
                  if( SPIClkCounter >= SPI_Period - 1  ) then
                     SPIClkCounter <= 0;
                     spiClockBuf <= not spiClockBuf;
                     
                  
                  end if;
              end if;
           elsif( enableSPIClock = '0') then
              SPIClkCounter <= 0 ;
              firstSclk<= '0';
              spiClockBuf <= CPOL;
           end if;  
		end if;
		
	end process SPIClock;	
	
	
	
	ControlState : process( clock )
	begin
		if( rising_edge( clock ) ) then
 
            case state is
			   
			   when IDLE =>
			   
			       CS <= '1';
				   busyTransmit <= '0';
				   busyReceive  <= '0';

				   received     <= (others => '0');
				   transmitBuf  <= (others => '0');
				   sampleCounter<=  0;
				   transmitState <= '0';
				   firstSample   <= '0';
				   enableSPIClock <= '0';
				   dataCounter    <= transmitLength-1;
				   CPHOFirst <= '0';
				   receiveBit <= transmitLength-1;
				   receiveFirst <= '0';
				   
				   if( enableTransmit = '1' or enableReceive = '1' ) then
				   
				      transmitBuf <= transmitB;
				      CS <= '0';
				      state <=CONTROL;
					  
				   end if;				   
			   
			   when CONTROL =>
			   
			       if( enableReceive = '1' ) then
			           busyReceive <= '1';
				       state <= RECEIVE;
				   elsif (enableTransmit = '1' ) then
				       busyTransmit <= '1';
				       state <= TRANSMIT;
				   end if;
				   
				   
			   
			   when TRANSMIT =>
			        
				   transmitState <= '1';
			       if( CPHA = '0') then
			       
			          sampleCounter <= sampleCounter + 1;
                      if( CPHOFirst = '0') then
                            
                          CPHOFirst <= '1';
					      tempMosi <= transmitBuf(dataCounter);
					      dataCounter <= dataCounter-1;
					      
					      
					  end if;
					  
					  if( sampleCounter >= SPI_Period - 1) then
					     enableSPIClock <= '1';
						 sampleCounter <= 0;
						 firstSample <= '1';
						 state <= SAMPLE;

					  end if;
				   
				   elsif( CPHA = '1')  then
				   
					     tempMosi <= transmitBuf(dataCounter);
					     dataCounter <= dataCounter-1;				   
					     enableSPIClock <= '1';
						 sampleCounter <= 0;
						 firstSample <= '1';
						 state <= SAMPLE;	
						 		   
				          
				   end if;
			   
			       
			   
			   when RECEIVE =>
			   
			       if( CPHA = '0') then
				   
				      sampleCounter <= sampleCounter + 1;
				      
					  if( sampleCounter >= SPI_Period - 1 and receiveFirst = '0') then  
					  
					     sampleCounter <= 0;
						 
						 receiveFirst <= '1';
					     enableSPIClock <= '1';
						 receiveBuf(receiveBit) <= tempMiso;
						 receiveBit <= receiveBit - 1;
						 
					  elsif(  sampleCounter >= 2*SPI_Period -1 and receiveBit > -1) then
					  
					     sampleCounter <= 0;
						 receiveBuf(receiveBit) <= tempMiso;
						 receiveBit <= receiveBit - 1;						 
					  
					  
						 
					  end if;
					  
					  if( receiveBit < 0 and sampleCounter >= SPI_Period -1) then
					     
						 receiveBit<= transmitLength - 1 ;
						 sampleCounter<= 0;
						 state <= IDLE;
						 received <= receiveBuf;
						 receiveOk <= '1';
						 busyReceive <= '0';
						 
					  
					  end if;
					  
				   elsif( CPHA = '1')  then

				      
					  
					  if( sampleCounter = 0 ) then					  						 

					     enableSPIClock <= '1';
					     
                      end if;
                      
                      sampleCounter <= sampleCounter + 1;
                                  
					  if(  sampleCounter >= SPI_Period - 1 and receiveFirst = '0' ) then
					  
					     sampleCounter <= 0;
						 
						 receiveFirst <= '1';
						 receiveBuf(receiveBit) <= tempMiso;
						 receiveBit <= receiveBit - 1;						 
					  
					  
					  else if(sampleCounter >= 2*SPI_Period - 1 and receiveBit> -1 ) then
					  
					     sampleCounter <= 0;

						 receiveBuf(receiveBit) <= tempMiso;
						 receiveBit <= receiveBit - 1;	
						 
					  end if;
					  
					  
					  
					  if( receiveBit < 0  and sampleCounter >= SPI_Period -1) then
					     
						 receiveBit<= transmitLength - 1 ;
						 state <= IDLE;
						 received <= receiveBuf;
						 receiveOk <= '1';
						 busyReceive <= '0';
						 
					  
					  end if;				   
				   
				   end if;
				 end if;
			       
			   when SAMPLE =>
			   
			        sampleCounter <= sampleCounter + 1;
					
			        if( transmitState = '1') then
					   
					   if( CPHA = '0') then
					   
					      if( firstSample = '1' and sampleCounter >= (SPI_Period  )) then  --(SPI_Period  - 1)
						      
							  firstSample <= '0';
						      sampleCounter <= 0;
							  tempMosi <= transmitBuf(dataCounter);
							  dataCounter <= dataCounter - 1;
	
					      elsif( sampleCounter >= (SPI_Period * 2 - 1) and dataCounter >=  0  ) then  --(SPI_Period * 2) -1
						  
						  
								 sampleCounter <= 0;
								 tempMosi <= transmitBuf(dataCounter);
								 dataCounter <= dataCounter - 1;
						
					   	 elsif( dataCounter < 0 and sampleCounter >= 2*SPI_Period-1 ) then
						 
						 			sampleCounter <= 0;
									dataCounter    <= transmitLength-1;
									state <= IDLE;
									enableSPIClock <= '0';
							
								 
						  end if;
						
                       elsif( CPHA = '1')  then

                            if( firstSample = '1' and sampleCounter >= (SPI_Period * 2 ) ) then
                                
                                 firstSample<='0';
								 sampleCounter <= 0;
								 tempMosi <= transmitBuf(dataCounter);
								 dataCounter <= dataCounter - 1;       
								                          
                            elsif(firstSample = '0' and sampleCounter >= (SPI_Period * 2 -1) and dataCounter >=  0 ) then --(SPI_Period * 2) -1
							
								 sampleCounter <= 0;
								 tempMosi <= transmitBuf(dataCounter);
								 dataCounter <= dataCounter - 1;
								 
						     elsif( dataCounter < 0 and sampleCounter >= 2*SPI_Period - 2 ) then
						 
						 			sampleCounter<= 0;
									dataCounter    <= transmitLength-1;
									state <= IDLE;
									enableSPIClock <= '0';						   
							
							end if;
                   					   
					   end if;
					   
					   
					
					end if;
			   
			   
			   when others =>
			       state <= IDLE;
			   
			
			end case;

		end if;
	end process ControlState;



end Behavioral;
