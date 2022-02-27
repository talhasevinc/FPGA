library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity FullAdder is

Port
(
   input1_in: in std_logic;
   input2_in: in std_logic;
   carry_in : in std_logic;
   
   output1_out : out std_logic;
   carryout_out: out std_logic 
);
end FullAdder;

architecture Behavioral of FullAdder is

signal temp1_out : std_logic := '0';
signal temp2_out : std_logic := '0';
signal temp3_out : std_logic := '0';
component Half_Adder is

  Port 
  (
     number1_in : in  std_logic;
	 number2_in : in  std_logic; 
     out_out    : out std_logic;
     carry_out  : out std_logic	 
  );
end component;
begin
First_HalfAdder: Half_Adder port map
(
        number1_in => input1_in,
        number2_in => input2_in,
        out_out    => temp1_out,
        carry_out=>   temp2_out
);

Second_HalfAdder: Half_Adder port map
(
        number1_in => temp1_out,
        number2_in => carry_in,
        out_out    => output1_out,
        carry_out  => temp3_out
);
carryout_out <= temp2_out or temp3_out;
end Behavioral;