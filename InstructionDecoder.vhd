library ieee;
use iee.std_logic_1164.all;
use iee.std_logic_unsigment.all;

entity InstructionDecoder is 
port ( 
    I0, I2, I2, I3: in std_logic;
    LOAD, ADD, SUB, ANDlogic, XORlogic, OUTPUTs, HALT: out std_logic;
);  
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is 
    LOAD <=  I0 and  I1 and (not I2) and I3 ;
    ADD <=    I0 and (not I1) and  I2 and (not I3) ;
    SUB <=   I0 and I1 and I2 and (not I3) ;
    ANDlogic <=  (not I0) and (not I1)  and I2 and I3;
    XORlogic <=  (not I0) and I1 and (not I2) and I3;
    OUTPUTs <=  (not I0) and (not I1) and (not I2)  and (not I3) ;
    HALT <=  I0 and I1 and (not I2) and I3;
begin

end Behavioral;