library ieee;
use ieee.std_logic_1164.all;

entity TOP is
port(clk: in std_logic;

	  ssd1:out std_logic_vector(6 downto 0);
	  ssu1:out std_logic_vector(6 downto 0);
	  ssu2:out std_logic_vector(6 downto 0);
	  
	  ssd2:out std_logic_vector(6 downto 0);
	  ssu3:out std_logic_vector(6 downto 0);
	  ssu4:out std_logic_vector(6 downto 0);
	 
	  pausa: in std_logic;
	  rst: in std_logic;
	  sel: in std_logic;
	  turno: in std_logic);
	 
	  
end entity;



architecture arqTOP of TOP is




				




signal clkl: std_logic;

signal f,  vuelta, f1: std_logic := '0';
signal g, g1: std_logic ;

signal T2:integer range 0 to 60;
signal T3:integer range 0 to 60;
signal salida:integer range 0 to 60;
signal segundos,segundos1 :integer range 0 to 60;
signal minutos,minutos1:integer range 0 to 60;
signal conteo1:integer range 0 to 60;

begin
   
	
   
	
	u1: entity work.divf(arqdivf) port map(clk, clkl);
	
	u2: entity work.cont2(arqcont2) port map(f, minutos, g, rst,sel);
	u3: entity work.cont1(arqcont1) port map(clkl, segundos, f, pausa, rst, g, turno);
	
	u4: entity work.cont2(arqcont2) port map(f1, minutos1, g1, rst,sel);
	u5: entity work.cont1b(arqcont1b) port map(clkl, segundos1, f1, pausa, rst, g1,turno);
	
	u6: entity work.ssd(arqssd) port map(segundos, ssd1);
	u7: entity work.ssu(arqssu) port map(segundos, ssu1);
	u8: entity work.ssu(arqssu) port map(minutos, ssu2);
	
	u9: entity work.ssd(arqssd) port map(segundos1, ssd2);
	u10: entity work.ssu(arqssu) port map(segundos1, ssu3);
	u11: entity work.ssu(arqssu) port map(minutos1, ssu4);
	
	--u9: entity work.pruebaS(arqpruebaS) port map(g, pruebaS1);
	
	
	
	
	


end architecture;