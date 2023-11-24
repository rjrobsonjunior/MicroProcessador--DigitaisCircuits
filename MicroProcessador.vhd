library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity MicroProcessador is
	port(
		clk, reset, stop: in std_logic;
      Hex0counter, Hex1instruction, Hex2instruction, Hex3instruction, Hex1instruction: in std_logic_vector(7 downto 0);
      CTRL: in std_logic;
      Couts: out std_logic_vector(7 downto 0);
      Msig: out std_logic
	);
end MicroProcessador;

architecture MicroProcessador_arch of MicroProcessador is

-- ===============BEGIN COMPONENTS========================= --
	
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
	
	Component ROM IS
	PORT(
		address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END component;

--COMPONENT--END--


--BEGIN--
	begin
	
	Counter(
	RomMemory : ROM(
	
end MicroProcessador_arch;