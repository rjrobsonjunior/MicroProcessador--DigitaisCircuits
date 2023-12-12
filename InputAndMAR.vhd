library ieee;
use iee.std_logic_1164.all;
use iee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity InputAndMAR is 
port(
    I : in std_logic_vector (3 downto 0 ); -- from bus
    clk : in std_logic;
    clear : in std_logic;
    Lm : in std_logic;
    Q : out std_logic_vector ( 3 downto 0)  
    );
end InputAndMAR;



architecture InputAndMAR_arch of InputAndMAR is 

signal I_bo: std_logic_vector (3 downto 0); -- I buffer output
signal Q_tmp: std_logic_vector (3 downto 0);
signal Q_dup: std_logic_vector (3 downto 0);

begin

process(clk, clear)
    begin
    if clear = '1' then
        Q_tmp <= (Q_tmp'range' => '0');
    else if (clk = '1' and clk'event') then
        Q_tmp <= I_bo;
    end if;
end process;

Q <= Q_tmp;
Q_dup <= Q_tmp;

process(Lm)
    begin 
    if Lm = '0' then
        I_bo <= I;
    else then
        I_bo <= Q_dup;
    end if;
end process;

end InputAndMAR_arch;