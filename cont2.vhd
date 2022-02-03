library ieee;
use ieee.std_logic_1164.all;

entity cont2 is
port(a: in std_logic;
	  conteo: buffer integer:=0;
	  b: buffer std_logic;
	  rst: in std_logic;
	  sel:in std_logic);
	  
end entity;

architecture arqcont2 of cont2 is
begin


	process(a)
		begin
		 if (rst = '1')  then
			if(rising_edge(a)) then
				
				    
				   		if (sel='1')then
								conteo <= 3;	
								b <='1';
								
							
							 else
								conteo <= 5;
								b <='1';
							end if;

						if(b = '1')  then
						if(conteo = 0)  then
						   --conteo <= conteo;
							b <='0';
						
						else
								conteo <= conteo -1;
								b <='1';
							
						end if;
					end if;
			end if;
		 else 
				  	
					 b <='1';
				    if (sel='1')then
					     b <='1';
						  conteo <= 3;			
					 else
						b <='1';
						conteo <= 5;
								
		         end if;
		 end if;
		end process;
end architecture;