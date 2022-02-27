----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.02.2022 13:32:35
-- Design Name: 
-- Module Name: tb_spiMaster - Behavioral
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


entity tb_spiMaster is
Generic
(
    CPOL              : std_logic := '0';
	CPHA              : std_logic := '1';
	transmitLength    : integer   := 8 ;
	SPI_Speed         : integer   := 5000000;
	SystemClock       : integer   := 100000000
	
);
end tb_spiMaster;

architecture Behavioral of tb_spiMaster is


    component spiMaster is
    Generic
    (
        CPOL              : std_logic := '0';
        CPHA              : std_logic := '0';
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
        Mosi             : out std_logic;
        busyTransmit     : out std_logic;
        busyReceive      : out std_logic;
	    SPIClk           : out std_logic;      	
	    CS               : out std_logic     	
    
    
    );
    end component;
    
    signal    clock            :  std_logic :='0' ;
    signal    transmitB        :  std_logic_vector( transmitLength-1 downto 0 ) :=(others =>'0');
    signal    Miso             :  std_logic  :='0';	
    signal    enableTransmit   :  std_logic  :='0';
    signal    enableReceive    :  std_logic  :='0';
        
    signal    received         :  std_logic_vector( transmitLength-1 downto 0 );
    signal    Mosi             :  std_logic;
    signal    busyTransmit     :  std_logic;
    signal    busyReceive      :  std_logic;
    signal    SPIClk           :  std_logic; 
    signal    CS               :  std_logic;    	
    signal    receiveSamle     : std_logic_vector(7 downto 0) := "11001001";
    signal    sampleReceive    : integer := 7;
    begin
    STIM1: spiMaster
    Generic map
    (
      
	  CPOL            =>CPOL  ,        
	  CPHA            =>CPHA   ,       
	  transmitLength  =>transmitLength,
	  SPI_Speed       =>SPI_Speed     ,
	  SystemClock     =>SystemClock   
	  
	  
	  
	  
    )
	Port map
	(
	
	  clock          =>  clock          ,
	  transmitB      =>  transmitB       ,
	  Miso           =>  Miso           ,
	  enableTransmit =>  enableTransmit ,
	  enableReceive  =>  enableReceive  ,
					      
	  received       =>  received       ,
	  Mosi           =>  Mosi           ,
	  busyTransmit   =>  busyTransmit   ,
	  busyReceive    =>  busyReceive    ,
	  SPIClk         =>  SPIClk    ,
	  CS             =>  CS      
	
	);
	
    Clk: process
            begin
            clock <= '0';
            wait for 5 ns;
            clock <= '1';
            wait for 5 ns;
    end process Clk;
    
 
Sample: process
begin

    wait for 1 ms;
    receiveSamle <= "11001001";
    sampleReceive <= 7;
    enableReceive <= '1';
    enableTransmit <= '0';
    
    if( CPHA = '1') then
      
        for I in 0 to 7 loop
            wait until SPIClk = not(CPOL);
            Miso <= receiveSamle(sampleReceive);
            sampleReceive <= sampleReceive - 1;
            wait for 150 ns;
        end loop;
        
    else
    
         Miso <= receiveSamle(sampleReceive);
         sampleReceive <= sampleReceive - 1;     
         wait for 100 ns;
            
         for I in 0 to 6 loop
            wait until SPIClk = (CPOL);
            Miso <= receiveSamle(sampleReceive);
            sampleReceive <= sampleReceive - 1;
            wait for 150 ns;
        end loop;   
      
    end if;
    enableReceive <= '0';
    enableTransmit <= '0';
    wait for 1 ms;
    
    transmitB <= "01010110";
    enableReceive <= '0';
    enableTransmit <= '1';
    wait for 20 ns;
    enableTransmit <= '0';
    wait for 10 ms;  
  
      
end process;   
    
end Behavioral;
