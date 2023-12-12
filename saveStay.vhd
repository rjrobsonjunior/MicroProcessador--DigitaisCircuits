library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SaveStay is 
    port(
    clk, stop : in std_logic;
    s : out std_logic
    );
end SaveStay;

architecture SaveStay_arch of SaveStay is 

	component tff is 
	port    (
		T, PRN , CLRN  , CLK: in std_logic;
		Q : out std_logic
	);
	end component;
	
	signal outPort : std_logic;
	
	begin
	
		a00: tff
		port map	(
			T=>'1' ,PRN=>'1' , CLRN=> '1'  , CLK=> stop  ,
			Q=>outPort
			);

		s <= clk and outPort;
		
	end SaveStay_arch;