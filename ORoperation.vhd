library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ORoperation is
    port (
        A, B: in std_logic_vector(7 downto 0);
        Result: out std_logic_vector(7 downto 0)
    );
end entity ORoperation;

architecture arch_ORoperation of ORoperation is

begin

	Result(0) <= A(0) or B(0);
	Result(1) <= A(1) or B(1);
	Result(2) <= A(2) or B(2);
	Result(3) <= A(3) or B(3);
	Result(4) <= A(4) or B(4);
	Result(5) <= A(5) or B(5);
	Result(6) <= A(6) or B(6);
	Result(7) <= A(7) or B(7);



end arch_ORoperation;