library ieee;
use iee.std_logic_1164.all;
use iee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ArithmeticUnit is 
port(
    Acc, Reg : in std_logic_vector( 7 downto 0); --- Acc is from Accumulator and Reg Registrator
    Adder, Subt ,  XORs, ANDs, Eu: in std_logic;
    Result: out std_logic_vector(8 downto 0);
)
end ArithmeticUnit;



architecture ArithmeticUnit_arch of ArithmeticUnit is 

signal C: std_logic_vector(8 downto 0);
signal CinxB: std_logic_vector(7 downto 0);
signal S: std_logic_vector(7 downto 0);

begin

process( Adder, Subt ,XORs, ANDs)
    begin
        if Adder = '1' then
        
        elsif Subt = '1' then
            
            Result(8) <= '0';
        elsif XORs = '1' then
            
            Result(8) <= '0';
        elsif Ands = '1' then

            Result(8) <= '0';
        end if;
    
end process;

process(Eu)
begin
    if Eu = '1' then
    Result <= S;
    elsif Eu = '0' then
    Result <= "ZZZZZZZZ";
    end if;

end process;

end ArithmeticUnit_arch;