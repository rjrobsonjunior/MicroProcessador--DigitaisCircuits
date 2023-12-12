library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity XORandAND is
    port (
        A, B: in std_logic_vector(7 downto 0);
        ANDoperation: in std_logic;
        Result: out std_logic_vector(7 downto 0);
    );
end entity XORandAND;

architecture arch_XORandAND of XORandAND is

    signal C: std_logic_vector(7 downto 0);
begin

    if ANDoperation = '1' then
        for i in 0 to 7 loop 
            C(i) <= B(i) and A(i);
        end loop;
        
    else if ANDoperation = '0' then
        for i in 0 to 7 loop 
            C(i) <= B(i) xor A(i);
        end loop;
    end if;

    Result <= C;

end arch_XORandAND;