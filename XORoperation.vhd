library ieee;
use ieee.std_logic_1164.all;

entity XORoperation is
    port (
        A, B: in std_logic_vector(7 downto 0);
        Result: out std_logic_vector(7 downto 0)
    );
end entity XORoperation;

architecture arch_XORoperation of XORoperation is

begin

	Result(0) <= A(0) xor B(0);
	Result(1) <= A(1) xor B(1);
	Result(2) <= A(2) xor B(2);
	Result(3) <= A(3) xor B(3);
	Result(4) <= A(4) xor B(4);
	Result(5) <= A(5) xor B(5);
	Result(6) <= A(6) xor B(6);
	Result(7) <= A(7) xor B(7);

end arch_XORoperation;