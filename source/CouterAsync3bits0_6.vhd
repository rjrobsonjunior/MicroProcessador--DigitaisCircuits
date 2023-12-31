library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Counter3bits06 is 
    port(
    clk, reset : in std_logic;
    S : out std_logic_vector ( 2 downto 0) := "000"
    );
end entity Counter3bits06;

architecture Counter3bits06_arch of Counter3bits06 is 

	component tff is 
	port    (
		T, PRN , CLRN  , CLK: in std_logic;
		Q : out std_logic
	);
	end component;
 
	signal Ti_Qiis  : std_logic_vector (3 downto 0);
	signal Q_s : std_logic_vector (2 downto 0);
	signal clk_s  : std_logic ;
	signal state6 : std_logic;
	signal resetState : std_logic;
	
	begin
	
		
		gen00:for i in 0 to 2 generate
		
			a00: tff
			port map	(
				T=>'1' ,PRN=>'1' , CLRN=> resetState  , CLK=> not Ti_Qiis(i) ,
				Q=>Ti_Qiis(i+1)
				);
			
			aa01: 
				Q_s(i)<=Ti_Qiis(i+1);
		end generate;
		
		state6 <= Q_s(0) and Q_s(1) and Q_s(2);
		resetState <= reset xor state6;
		Ti_Qiis(0)<= not clk_s;
		S<=Q_s;
		clk_s<=clk;
	end Counter3bits06_arch;