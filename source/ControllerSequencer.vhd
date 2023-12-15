library ieee;
use iee.std.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ControllerSequence is 
    port(
        I : in std_logic_vector (7 downto 0 );
        clk : in std_logic;
        Cp, Lm, CE, Li, Ei, La, Ea, Su, Eu, Lb, Lo, Halt  : in std_logic; -- ~La Ea
        );
    end ControllerSequence;
    
    
    
    architecture ControllerSequence_arch of ControllerSequence is 
  
    begin
    
    end ControllerSequence_arch;