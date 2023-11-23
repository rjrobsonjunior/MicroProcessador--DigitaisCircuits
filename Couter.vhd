library ieee;
use iee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Counter8bits is 
    port(
    clk, reset : in std_logic;
    S : out std_logic_vector ( 7 downto 0);
    );
end Counter8bits;

architecture Counter8bits_arch of Counter8bits is 
    component tff is 
    port    (
        D, PRN , CLRN  , CLK: in std_logic;
		Q : out std_logic
    );
    end component;