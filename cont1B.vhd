library ieee;
use ieee.std_logic_1164.all;

entity cont1B is
port(clk: in std_logic;
	  conteo: buffer integer;
	  f: out std_logic;
	  pausa: in std_logic;
	  rst: in std_logic;
	  b: in std_logic;
	  turno:in std_logic);
end entity;

architecture arqcont1B of cont1b is
begin
   	 

		process(clk)
			begin

				if(rising_edge(clk)) then
					if(b = '0')then
					    conteo <= 00;
					  
					  else 
						 
						 if (rst = '1') then
							  if (turno = '1')   then
										conteo <= conteo;
							  else
								  if (pausa = '1')   then
										conteo <= conteo;
								  else
										if(conteo = 00)   then
											f<='1';
											conteo <= 59;
											
										else
											conteo <= conteo -1;
											f<='0';	
										end if;
									end if;
								end if;
						  else 
							  conteo <= 0;
							  f<='1';
							  
						  end if;
					 
				  end if;	  
				end if;
		end process;
	 
end architecture;