library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity RingCounter is
Port (  CLK: in std_logic;
        T: inout std_logic_vector (5 downto 0):= "100000" );
end Ringcounter;

architecture RingCounter_arch of RingCounter is

begin

    process(CLK)
        begin
            if (CLK = '1' and CLK'event) then
                if T = "000001" then
                T <= "000010";
                elsif T = "000010" then
                T <= "000100";
                elsif T = "000100" then
                T <= "001000";
                elsif T = "001000" then
                T <= "010000";
                elsif T = "010000" then
                T <= "100000";
                elsif T = "100000" then
                T <= "000001";
                end if;
            end if;
    end process;

end RingCounter_arch;