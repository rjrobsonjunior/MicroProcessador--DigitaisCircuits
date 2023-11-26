library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity MicroProcessador is
	port(
		CLKboard, RESETboard, STOPboard: in std_logic;
      Hex0counter: out std_logic_vector(3 downto 0);
		Hex1instruction: out std_logic_vector(3 downto 0);
		Hex2adress: out std_logic_vector(3 downto 0);
		Hex3data0: out std_logic_vector(3 downto 0);
		Hex4data1: out std_logic_vector(3 downto 0);
		Hex5accumulator0: out std_logic_vector(3 downto 0)
	);
end entity MicroProcessador;

architecture MicroProcessador_arch of MicroProcessador is

-- ===============BEGIN COMPONENTS========================= --
	
	
	component Counter3bits06 is 
    port(
    clk, reset : in std_logic;
    S : out std_logic_vector ( 2 downto 0)
    );
	end component;

	component Counter4bits is 
    port(
    clk, reset : in std_logic;
    S : out std_logic_vector ( 3 downto 0)
    );
	end component;

	
	component FullAdder8bits is
		port(	
			Eu: in std_logic;
			A, B: in std_logic_vector(7 downto 0);
			Su: in std_logic;
			Result: out std_logic_vector(7 downto 0);
			Cout: out std_logic
		);
		end component;
		
		
		component ram IS
	PORT(
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

-- ================COMPONENT--END==================================--

signal sCounter : std_logic_vector(2 downto 0);
signal sAdress : std_logic_vector(3 downto 0);
signal sRom : std_logic_vector( 15 downto 0);
--signal sAdressRom : std_logic_vector (4 downto 0);

--BEGIN--
	begin
	
	-- =========PROGRAM COUNTER================== --
	CouterState: Counter3bits06 port map( CLKboard, RESETboard, sCounter);
	CouterAdress:Counter4bits port map(sCounter(2), RESETboard, sAdress);
	Hex0counter <= sAdress; 
	RomMemory : ROMoneport port map( sAdress, sCounter(2), sRom);
	

	Hex1instruction<= sRom(15 downto 12);
	Hex2adress<= sRom(11 downto 8);
	Hex3data0 <= sRom(7 downto 4);
	Hex4data1<= sRom(3 downto 0);

	-- Hex4accumulator0 sRom(3 downto 0);
	-- Hex5accumulator1 sRom(3 downto 0);
	
end MicroProcessador_arch;