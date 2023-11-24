library ieee;
use iee.std_logic_1164.all;
use iee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Accumulator is 
port(
    I : in std_logic_vector (7 downto 0 );
    clk : in std_logic;
    reset : in std_logic;
    La, Ea : in std_logic; -- ~La Ea
    Qarithmetic : out std_logic_vector ( 7 downto 0); -- to arithmetic unit
    Qbus : out std_logic_vector ( 7 downto 0); -- to W bus
    );
end Accumulator;



architecture Accumulator_arch of Accumulator is 

signal I_bo: std_logic_vector (7 downto 0); -- I buffer output
signal Q_bi: std_logic_vector (7 downto 0); -- Q buffer input
signal Q_tmp: std_logic_vector (7 downto 0);
signal Q_dup: std_logic_vector (7 downto 0);

begin

process(clk, reset)
    begin
    if reset = '1' then
        Q_tmp <= (Q_tmp'range' => '0');
    else if (clk = '1' and clk'event') then
        Q_tmp <= I_bo;
    end if;
end process;

Q_bi <= Q_tmp;
Q_dup <= Q_tmp;

process(La)
    begin 
    if La = '1' then
        I_bo <= Q_dup;
    else then
        I_bo <= I;
    end if;
end process;

process(Ea)
    begin 
    if Ea = '1' then
        Qbus <= Q_bi;
    else then
        Qbus <= 'ZZZZZZZZ';
    end if;
end process;
Qarithmetic <= Q_bi;
end Accumulator_arch;