library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity MicroProcessador is
	port(
		clk: in std_logic;
      A, B: in std_logic_vector(7 downto 0);
      CTRL: in std_logic;
      Couts: out std_logic_vector(7 downto 0);
      Msig: out std_logic
	);
end MicroProcessador;

architecture MicroProcessador_arch of MicroProcessador is
	
	component FullAdder8bits is
		port(	
			Eu: in std_logic;
			A, B: in std_logic_vector(7 downto 0);
			Su: in std_logic;
			Result: out std_logic_vector(7 downto 0);
			Cout: out std_logic
		);
		end component;
--COMPONENT--END--


--BEGIN--
	begin
	
	contador: FullAdder8bits port map(  clk, A, B, CTRL, Couts, Msig );
	
end MicroProcessador_arch;