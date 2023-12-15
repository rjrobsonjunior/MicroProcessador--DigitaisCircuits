library ieee;
use ieee.std_logic_1164.all;

entity InstructionDecoder is 
port ( 
    instruction: in std_logic_vector( 3 downto 0);
    LOAD, ADDER, SUBT, ANDlogic, XORlogic, ORlogic: out std_logic
);  
end InstructionDecoder;

architecture arch_InstructionDecoder of InstructionDecoder is 

begin
    LOAD <= instruction(0) and  instruction(1) and (not instruction(2)) and instruction(3) ;                        -- 0xB 1011
    ADDER <=   instruction(0) and (not instruction(1)) and  instruction(2) and (not instruction(3)) ;                 -- 0x5 0101
    SUBT <=  instruction(0) and instruction(1) and instruction(2) and (not instruction(3)) ;                         -- 0x7 0111
    ANDlogic <=  (not instruction(0)) and (not instruction(1))  and instruction(2) and instruction(3);              --0xC 1100
    XORlogic <=  (not instruction(0)) and instruction(1) and (not instruction(2)) and instruction(3);               --0xA 1010
    ORlogic <= (not instruction(0)) and (not instruction(1)) and  (not instruction(2)) and (not instruction(3));          --0x4 0100


end arch_InstructionDecoder;