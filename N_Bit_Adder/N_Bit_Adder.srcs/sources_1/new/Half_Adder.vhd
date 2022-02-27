
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Half_Adder is

  Port 
  (
     number1_in : in  std_logic;
	 number2_in : in  std_logic; 
     out_out    : out std_logic;
     carry_out  : out std_logic	 
  );
end Half_Adder;

architecture Behavioral of Half_Adder is

begin

carry_out<= number1_in and number2_in;
out_out  <= number1_in xor number2_in;

end Behavioral;
