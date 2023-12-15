library ieee;
use iee.std_logic_1164.all;
use iee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ArithmeticUnit is 
port(
    Acc, Reg : in std_logic_vector( 7 downto 0); --- Acc is from Accumulator and Reg Registrator
    Adder, Subt ,  XORs, ANDs, Eu: in std_logic;
    Result: out std_logic_vector(7 downto 0);
)
end ArithmeticUnit;

component FullAdder8bits is
    port (
        A, B: in std_logic_vector(7 downto 0);
        Su: in std_logic;
        Result: out std_logic_vector(7 downto 0);
    );
end component;

component XORandAND is
    port (
        A, B: in std_logic_vector(7 downto 0);
        ANDoperation: in std_logic;
        Result: out std_logic_vector(7 downto 0);
    );
end component;

architecture ArithmeticUnit_arch of ArithmeticUnit is 
signal outs : std_logic_unsigned(7 downto 0);
begin
process( Adder, Subt ,XORs, ANDs)
    begin
        if Adder = '1' then
            fulladder1: FullAdder8bits port map (Acc, Reg, '0', outs);
        elsif Subt = '1' then
            fulladder2: FullAdder8bits port map (Acc, Reg, '1', outs );
        elsif XORs = '1' then
            xorand1: XORandAND port map(Acc, Reg, '0', outs);
        elsif Ands = '1' then
            xorand2: XORandAND port map(Acc, Reg, '1', outs);            
        end if;
    Result <= outs;
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