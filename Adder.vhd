library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Adder is
    port (
        A, B : in std_logic_vector(7 downto 0); -- two operands
        Cin  : in std_logic;
        Sum  : out std_logic_vector(7 downto 0); -- Result
        Cout : out std_logic
    );
end Adder;

 
begin Adder_arch of Adder is
    process(A, B, Cin)
        variable temp_sum : unsigned(8 downto 0);
    begin
        temp_sum := ("0" & A) + ("0" & B) + ("0" & Cin);
        Sum <= std_logic_vector(temp_sum(7 downto 0));
        Cout <= temp_sum(8);
    end process;
end Adder_arch;


