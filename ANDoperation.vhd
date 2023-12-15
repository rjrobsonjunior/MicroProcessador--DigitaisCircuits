library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ANDoperation is
    port (
        A, B: in std_logic_vector(7 downto 0);
        Result: out std_logic_vector(7 downto 0)
    );
end entity ANDoperation;

architecture arch_ANDoperation of ANDoperation is

begin

	Result(0) <= A(0) and B(0);
	Result(1) <= A(1) and B(1);
	Result(2) <= A(2) and B(2);
	Result(3) <= A(3) and B(3);
	Result(4) <= A(4) and B(4);
	Result(5) <= A(5) and B(5);
	Result(6) <= A(6) and B(6);
	Result(7) <= A(7) and B(7);

end arch_ANDoperation;