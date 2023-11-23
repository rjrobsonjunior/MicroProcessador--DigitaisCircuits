library ieee;
use iee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MicroProcessador is 
    port(
    clk, PB0 : in std_logic;
    Display : out std_logic_vector ( 7 downto 0);
    );
end MicroProcessador;

