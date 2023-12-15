library ieee;
use iee.std_logic_1164.all;
use iee.std_logic_unsigment.all;

entity InstructionDecoder is 
port ( 
    instrucution: in std_logic_vector( 3 downto 0);
    LOAD, ADD, SUB, ANDlogic, XORlogic, HALT: out std_logic;
);  
end InstructionDecoder;

architecture arch_InstructionDecoder of InstructionDecoder is 
    LOAD <= instruction(0) and  instruction(1) and (not instruction(2)) and instruction(3) ;                        -- 0xB 1011
    ADD <=   instruction(0) and (not instruction(1)) and  instruction(2) and (not instruction(3)) ;                 -- 0x5 0101
    SUB <=  instruction(0) and instruction(1) and instruction(2) and (not instruction(3)) ;                         -- 0x7 0111
    ANDlogic <=  (not instruction(0)) and (not instruction(1))  and instruction(2) and instruction(3);              --0xC 1100
    XORlogic <=  (not instruction(0)) and instruction(1) and (not instruction(2)) and instruction(3);               --0xA 1010
    HALT <= (not instruction(0)) and (not instruction(1)) and  instruction(2) and (not instruction(3));             --0x4 0100
begin

end arch_InstructionDecoder;