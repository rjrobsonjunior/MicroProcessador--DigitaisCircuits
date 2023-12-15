library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity MicroProcessador is
	port(
		CLKboard, RESETboard, STOPboard: in std_logic;
      LEDcounter: out std_logic_vector(3 downto 0);
		LEDinstruction: out std_logic_vector(3 downto 0);
		Hex0Rom: out std_logic_vector(6 downto 0);
		Hex1Rom: out std_logic_vector(6 downto 0);
		Hex2Ram: out std_logic_vector(6 downto 0);
		Hex3Ram: out std_logic_vector(6 downto 0);
		Hex4Arithmetic: out std_logic_vector(6 downto 0);
		Hex5Arithmetic: out std_logic_vector(6 downto 0)
	);
end entity MicroProcessador;

architecture MicroProcessador_arch of MicroProcessador is

-- ===============BEGIN COMPONENTS========================= --
	
	component ConversorDisplay7seg is
	port (
		x: in std_logic_vector(3 downto 0);
		seg: out std_logic_vector(6 downto 0)
		);
	end component;
	
	component TimRef is
		port (
			clk: in std_logic;   -- Pin connected to P11 (N14)
			clk_2Hz: out std_logic  -- Can check it using PIN A8 - LEDR0
		);
	end component;
	

	component Counter4bits is 
    port(
    clk, reset : in std_logic;
    S : out std_logic_vector ( 3 downto 0)
    );
	end component;
	
	component StateMachine3bits04 is 
    port(
    clk, reset : in std_logic;
	 State : out std_logic_vector ( 4 downto 0);
	 CLKout : out std_logic
    );
	end component;
	
	component InstructionDecoder is 
	port ( 
		instruction: in std_logic_vector( 3 downto 0);
		LOAD, ADDER, SUBT, ANDlogic, XORlogic, ORlogic: out std_logic
	); 	 
	end component;
	
	
	component ArithmeticUnit is 
	port(
       CLK:  in std_logic;
		Acu, Registe : in std_logic_vector( 7 downto 0); --- Acu is from Acuumulator and Registe Registeistrator
		LOAD, ADDER, SUBT, ANDlogic, XORlogic, ORlogic: in std_logic;
		Result: out std_logic_vector(7 downto 0)
	);
	end component;
		
		
	component RamMicro IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	END component;
	

	component ROMoneport IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
	END component;

	component SaveStay is 
    port(
		clk, stop : in std_logic;
		s : out std_logic
    );
	end component;
	

	component AccumulatorFFD is
	port(
    clk, reset: in std_logic;
    d: in std_logic_vector(7 downto 0);
    q: out std_logic_vector(7 downto 0)
	  );
	end component;

-- ================COMPONENT--END==================================--
	signal sState: std_logic_vector(4 downto 0);
	signal sAdressRom : std_logic_vector(3 downto 0);
	signal sRom : std_logic_vector( 15 downto 0);
	--signal sAdressRomRom : std_logic_vector (4 downto 0);
	signal CLKstop : std_logic;
	signal RAMoutput: std_logic_vector (7 downto 0);
	signal data, outUnitArith, outRam, outRegisterRom, outRegisterRam: std_logic_vector (7 downto 0);
	signal instruction, adress : std_logic_vector (3 downto 0);
	signal CLKtiming : std_logic;
	signal CLKsave, CLKstatemachine : std_logic;
	signal LOAD, ADDER, SUBT, ANDlogic, XORlogic, ORlogic : std_logic;
	
	
	
	--BEGIN--
	begin
	
	-- =========PROGRAM COUNTER================== --
	timingReference : TimRef port map (CLKboard, CLKtiming );

	saveState : saveStay port map ( CLKtiming , STOPboard, CLKsave);
	
	CouterState: StateMachine3bits04 port map( CLKsave, RESETboard, sState, CLKstatemachine ); 
	
	CouterAdress:Counter4bits port map(CLKstatemachine, RESETboard, sAdressRom);
	
	-- =========PROGRAM EXECUTION ================== --
	RomMemory : ROMoneport port map( sAdressRom, sState(0), sRom);
	
	instruction <= sRom(15 downto 12);
	adress<= sRom(11 downto 8);
	data <= sRom(7 downto 0);
	
	InstructioDecoder1: InstructionDecoder port map ( instruction, LOAD, ADDER, SUBT, ANDlogic, XORlogic, ORlogic);  
	
	
	ramPROJECT : RamMicro port map ( adress, sState(1), outUnitArith, sState(4), outRam);

	register0 : AccumulatorFFD port map( sState(2), '1', outRam, outRegisterRam);
	register1 : AccumulatorFFD port map( sState(2), '1', data, outRegisterRom);
	
	UnitArithmetic1 : ArithmeticUnit port map ( sState(3), outRegisterRom, outRegisterRam, LOAD, ADDER, SUBT, ANDlogic, XORlogic, ORlogic, outUnitArith);
																													
	disp0Rom : ConversorDisplay7seg port map ( outRegisterRom( 3 downto 0), Hex0Rom ); 
	disp1Rom : ConversorDisplay7seg port map ( outRegisterRom( 7 downto 4), Hex1Rom);
	
	disp2Ram : ConversorDisplay7seg port map ( outRam(3 downto 0), Hex2Ram); 
	disp3Ram : ConversorDisplay7seg port map ( outRam(7 downto 4), Hex3Ram); 
	
	disp4Arithmetic : ConversorDisplay7seg port map ( outUnitArith(3 downto 0), Hex4Arithmetic);
	disp6Arithmetic : ConversorDisplay7seg port map ( outUnitArith(7 downto 4), Hex5Arithmetic);
	
	LEDcounter <= sAdressRom;
	
	LEDinstruction <= instruction;

	
end MicroProcessador_arch;