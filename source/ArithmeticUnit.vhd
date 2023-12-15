library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ArithmeticUnit is 
	port(
      CLK:  in std_logic;
		Acu, Registe : in std_logic_vector( 7 downto 0); --- Acu is from Acuumulator and Registe Registeistrator
		LOAD, ADDER, SUBT, ANDlogic, XORlogic, ORlogic: in std_logic;
		Result: out std_logic_vector(7 downto 0)
	);
end entity ArithmeticUnit;



architecture ArithmeticUnit_arch of ArithmeticUnit is 

component AccumulatorFFD is
    port(
      clk, reset: in std_logic;
      d: in std_logic_vector(7 downto 0);
      q: out std_logic_vector(7 downto 0)
    );
end component;

component FullAdder8bits is
    port (
        A, B: in std_logic_vector(7 downto 0);
        Su: in std_logic;
        Result: out std_logic_vector(7 downto 0)
);
end component;

component XORoperation is
    port (
        A, B: in std_logic_vector(7 downto 0);
        Result: out std_logic_vector(7 downto 0)
    );
end component;

component ORoperation is
    port (
        A, B: in std_logic_vector(7 downto 0);
        Result: out std_logic_vector(7 downto 0)
    );
end component;

component ANDoperation is
    port (
        A, B: in std_logic_vector(7 downto 0);
        Result: out std_logic_vector(7 downto 0)
    );
end component;

---------- ADDER----------------------
signal outAdder : std_logic_vector(7 downto 0);
---------- SUBTRACT -----------------
signal outSubt : std_logic_vector(7 downto 0);
---------- XOR ----------------------
signal outXORs: std_logic_vector(7 downto 0);
----------- AND -----------------------
signal outAND: std_logic_vector(7 downto 0);
----------- AND -----------------------
signal outOR: std_logic_vector(7 downto 0);
----------- LOAD -----------------------
signal outLOAD: std_logic_vector(7 downto 0);

signal Stemp: std_logic_vector(7 downto 0);

begin

	 fulladder1: FullAdder8bits port map (Acu, Registe, '0', outAdder);
	 fulladder2: FullAdder8bits port map (Registe, Acu,  '1', outSubt);
	 and1: ANDoperation port map(Acu, Registe,outAND);
	 xor1: XORoperation port map(Acu, Registe,outXORs); 
	 or1 : ORoperation port map(Acu, Registe, outOR);
	 register1: AccumulatorFFD port map (CLK, '1', Stemp, Result);
	 outLoad <= Acu;

    aa: for i in 0 to 7 generate
		Stemp(i) <= (outAdder(i) and ADDER ) or ( outSubt(i) and SUBT ) or ( outXORs(i) and XORlogic ) or ( outAND(i) and ANDlogic ) or ( outOR(i) and ORlogic ) or (outLoad(i) and LOAD);
	end generate aa;




end ArithmeticUnit_arch;