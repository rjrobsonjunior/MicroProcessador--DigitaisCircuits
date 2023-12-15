library IEEE;
use IEEE.std_logic_1164.all;

entity AccumulatorFFD is
  port(
    clk, reset: in std_logic;
    d: in std_logic_vector(7 downto 0);
    q: out std_logic_vector(7 downto 0)
  );
end AccumulatorFFD;

architecture arch_AccumulatorFFD of AccumulatorFFD is

component dff is 
port    (
	D, PRN , CLRN  , CLK: in std_logic;
	Q : out std_logic
);
end component;

begin
  FFD0: dff port map( d(0), '1',reset,clk, q(0));
  FFD1: dff port map( d(1), '1',reset,clk, q(1));
  FFD2: dff port map( d(2), '1',reset,clk, q(2));
  FFD3: dff port map( d(3), '1',reset,clk, q(3));
  FFD4: dff port map( d(4), '1',reset,clk, q(4));
  FFD5: dff port map( d(5), '1',reset,clk, q(5));
  FFD6: dff port map( d(6), '1',reset,clk, q(6));
  FFD7: dff port map( d(7), '1',reset,clk, q(7));
end arch_AccumulatorFFD;