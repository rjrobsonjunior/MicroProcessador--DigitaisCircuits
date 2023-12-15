library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity StateMachine3bits04 is 
    port(
    clk, reset : in std_logic;
	 State : out std_logic_vector ( 4 downto 0);
	 CLKout : out std_logic
    );
end entity StateMachine3bits04;

architecture StateMachine3bits04_arch of StateMachine3bits04 is 

	component tff is 
	port    (
		T, PRN , CLRN  , CLK: in std_logic;
		Q : out std_logic
	);
	end component;
 
	signal Ti_Qiis  : std_logic_vector (3 downto 0);
	signal Q_s : std_logic_vector (2 downto 0);
	signal clk_s  : std_logic ;
	signal state4 : std_logic;
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
		
		state4 <=  Q_s(0) and  Q_s(1) and Q_s(2);
		resetState <= reset xor state4;
		Ti_Qiis(0)<= not clk_s;
		clk_s<=clk;
		
		State(0) <= (Q_s(0) ) and (not Q_s(1)) and (not Q_s(2));
		State(1) <= (( not Q_s(0) ) and ( Q_s(1)) and (not Q_s(2)))   or ( (Q_s(0) ) and (not Q_s(1)) and (Q_s(2)) );
		State(2) <= ((Q_s(0) ) and (Q_s(1)) and (not Q_s(2)));
		State(3) <= (not Q_s(0) ) and (not  Q_s(1)) and (Q_s(2));
		State(4) <= ((Q_s(0) ) and (not Q_s(1)) and (Q_s(2))) or ((not Q_s(0) ) and (not  Q_s(1)) and (Q_s(2)));
		CLKout <= (not Q_s(0) ) and (Q_s(1)) and (Q_s(2));
	end StateMachine3bits04_arch;