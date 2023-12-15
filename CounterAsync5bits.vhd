library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CounterAsync5bits is 
    port(
    clk, reset : in std_logic;
    S : out std_logic_vector ( 4 downto 0) := "00000"
    );
end CounterAsync5bits;

architecture CounterAsync5bits_arch of CounterAsync5bits is 

	component tff is 
	port    (
		T, PRN , CLRN  , CLK: in std_logic;
		Q : out std_logic
	);
	end component;
 
	signal Ti_Qiis  : std_logic_vector (5 downto 0);
	signal Q_s : std_logic_vector (4 downto 0);
	signal clk_s  : std_logic ;
	
	begin
	
		gen00:for i in 0 to 4 generate
		
			a00: tff
			port map	(
				T=>'1' ,PRN=>'1' , CLRN=> reset  , CLK=> not Ti_Qiis(i) ,
				Q=>Ti_Qiis(i+1)
				);
			
			aa01: 
				Q_s(i)<=Ti_Qiis(i+1);
		end generate;

		Ti_Qiis(0)<= not clk_s;
		S<=Q_s;
		clk_s<=clk;
	end CounterAsync5bits_arch;