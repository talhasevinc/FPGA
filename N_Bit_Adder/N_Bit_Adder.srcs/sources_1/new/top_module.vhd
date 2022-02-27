library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity top_module is
Generic
(
   N_Bit : integer :=  8
);
 Port
 ( 
    inp1_in : in std_logic_vector(N_Bit-1 downto 0);
    inp2_in : in std_logic_vector(N_Bit-1 downto 0);
    outp1_out: out std_logic_vector(N_Bit downto 0)
 );
end top_module;

architecture Behavioral of top_module is

signal temp_1:std_logic_vector(N_Bit downto 0):= (others=>'0');
signal temp_2:std_logic_vector(N_Bit downto 0):= (others=>'0');

component FullAdder is

Port
(
   input1_in: in std_logic;
   input2_in: in std_logic;
   carry_in : in std_logic;
   
   output1_out : out std_logic;
   carryout_out: out std_logic 
);
end component;


begin
Full_Adders:  for I in 0 to N_Bit-1 generate
     Full_Adder:FullAdder port map
     (
         input1_in => inp1_in(I),
         input2_in => inp2_in(I),
         carry_in  => temp_2(I),
         output1_out=>temp_1(I),
         carryout_out =>temp_2(I+1)
         
     );

   end generate Full_Adders;
 
outp1_out<=  temp_2(N_Bit) & temp_1(N_Bit-1 downto 0 );
end Behavioral;
