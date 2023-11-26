library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FullAdder8bits is
    port (
        Eu: in std_logic;
        A, B: in std_logic_vector(7 downto 0);
        Su: in std_logic;
        Result: out std_logic_vector(7 downto 0);
        Cout: out std_logic
    );
end entity FullAdder8bits;

architecture behv of FullAdder8bits is
    signal C: std_logic_vector(8 downto 0) := (others => '0');
    signal CinxB: std_logic_vector(7 downto 0) := (others => '0');
    signal S: std_logic_vector(7 downto 0) := (others => '0');
begin

    process(Eu)
    begin
        if Eu = '1' then
				 for i in 0 to 7 loop 
					  CinxB(i) <= B(i) xor Su;
				 end loop;

				 C(0) <= Su;

				 for item in 0 to 7 loop 
					  S(item) <= (std_logic(A(item)) xor CinxB(item)) xor C(item);
					  C(item+1) <= (std_logic(A(item)) and CinxB(item)) or (C(item) and (std_logic(A(item)) xor CinxB(item)));
				 end loop; 

				 Cout <= C(8);
				 Result <= S;
			else
				 Result <= (others => 'Z');
				 Cout <= 'Z';
			end if;
    end process;
end behv;



