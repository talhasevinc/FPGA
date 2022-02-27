
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PWM_Module is
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
end PWM_Module;

architecture Behavioral of PWM_Module is

type Generate_PWM is ( IDLE,GENERATEPWM);
signal stateOfPWM : Generate_PWM:= IDLE;
signal duty:integer := 0;
signal frequency :integer:=0;
signal clockCounter:integer;

signal highTime : integer:= 0;
signal lowTime  : integer := 0;
signal period   : integer range 0 to System_clock := 0;

begin


timeHigh<=highTime;

PWM: process(clock)
begin
   
   if(rising_edge(clock)) then
   
       case (stateOfPWM) is
       
          when IDLE =>
       
                 clockCounter <= 0;
                 
                 if(enablePWM = '1') then
                 
                     stateOfPWM <= GENERATEPWM;
                     duty      <=  dutyCycle;
                     frequency <=  freq;
                     
                     if(dutyCycle <= 100 and dutyCycle >= 0) then
                     
                       period   <=         System_clock/freq;
                       highTime <=  ( dutyCycle *( (System_clock / 100) / freq )   );                  
                     
                     end if;
                     
                 end if;
          
         when GENERATEPWM =>
         
                 clockCounter <= clockCounter + 1;
                 
                 if(clockCounter  >= period ) then
                                
                      clockCounter <= 0;
                      
                      if( duty /= dutyCycle or frequency /= freq) then
                      
                         duty      <=  dutyCycle;
                         frequency <=  freq;
                         period   <=         System_clock/freq;           
                         highTime <=  ( dutyCycle *( (System_clock / 100) / frequency )   );  
                          
                      end if;                       
                     
                 elsif ( clockCounter <= highTime ) then
                     
                     outPWM <= '1';
                     
                 else
                 
                    outPWM <= '0';
                 
                 end if;
                 
                 if( enablePWM = '0') then
                     
                     stateOfPWM <= IDLE;
                     
                 end if;
                 
         when others =>
         
             stateOfPWM <=  IDLE;
       
       end case;
   end if;

end process PWM;

end Behavioral;
