library ieee;
use ieee.std_logic_1164.all;

entity Multiplex8bits is
    port (
        A, B : in std_logic_vector(7 downto 0);
        Selector : in std_logic;
        Outs : out std_logic_vector(7 downto 0)
    );
end entity Multiplexador_8bits;

architecture arch_Multiplex8bits of Multiplex8bits is
begin
    Outs(0) <= (A(0) and not Selector) or (B(0) and Selector);
    Outs(1) <= (A(1) and not Selector) or (B(1) and Selector);
    Outs(2) <= (A(2) and not Selector) or (B(2) and Selector);
    Outs(3) <= (A(3) and not Selector) or (B(3) and Selector);
    Outs(4) <= (A(4) and not Selector) or (B(4) and Selector);
    Outs(5) <= (A(5) and not Selector) or (B(5) and Selector);
    Outs(6) <= (A(6) and not Selector) or (B(6) and Selector);
    Outs(7) <= (A(7) and not Selector) or (B(7) and Selector);
end architecture arch_Multiplex8bits;