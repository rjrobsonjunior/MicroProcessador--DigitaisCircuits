library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity XORoperation is
    port (
        A, B: in std_logic_vector(7 downto 0);
        Result: out std_logic_vector(7 downto 0)
    );
end entity XORoperation;

architecture arch_XORoperation of XORoperation is

    signal C: std_logic_vector(7 downto 0);
begin

	aa: for i in 0 to 7 loop generate
		C(i) <= B(i) xor A(i);
	end loop aa;


	Result <= C;


end arch_XORoperation;