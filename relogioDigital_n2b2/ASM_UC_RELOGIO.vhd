----------------------------------------------------------------------------------
-- Unidade de Controle em VHDL a partir do diagrama ASM
--	Sistema Digital Completo
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
--use UNISIM.VComponents.all;

entity ASM_UC is
    Port ( CLK_UC : in  STD_LOGIC;
           RST_UC : in  STD_LOGIC;
           L1 : in  STD_LOGIC;
           L2 : in  STD_LOGIC;
			  L3 : in  STD_LOGIC;
           L4 : in  STD_LOGIC;			  
           EN1 : out STD_LOGIC;
           EN2 : out STD_LOGIC;
           EN3 : out STD_LOGIC;
			  EN4 : out STD_LOGIC);
end ASM_UC;

architecture Behavioral of ASM_UC is

type TIPO_ESTADO is (EST00, EST01, EST02, EST03, EST04, EST05, EST06, EST07);
signal ESTADO_ATUAL, PROXIMO_ESTADO : TIPO_ESTADO;

begin

	SINC_ASM: process(CLK_UC, RST_UC)
	begin
	
		if(RST_UC='1') then
			ESTADO_ATUAL <= EST00;
		elsif(CLK_UC'event and CLK_UC='1' ) then
			ESTADO_ATUAL <= PROXIMO_ESTADO;
		end if;
 	
	end process;
	
	DECODIFICACAO_PROXIMO_ESTADO: process(ESTADO_ATUAL, L1, L2, L3, L4)
	begin		
		PROXIMO_ESTADO <= ESTADO_ATUAL;		
		case(ESTADO_ATUAL) is		
			when EST00 =>
								EN1 	 <= '0';
								EN2 	 <= '0';
								EN3  	 <= '0';
								EN4  	 <= '0';
								if L1 = '1' then
									PROXIMO_ESTADO <= EST01;
								else
									PROXIMO_ESTADO <= EST02;
								end if;
								
------------------------------------------------------------								
			when EST01 =>
								EN1 	 <= '1';
								EN2 	 <= '0';
								EN3  	 <= '0';
								EN4  	 <= '0';
								PROXIMO_ESTADO <= EST00;
------------------------------------------------------------
			when EST02 =>
								EN1 	 <= '0';
								EN2 	 <= '0';
								EN3  	 <= '0';
								EN4  	 <= '0';
								if L2 = '1' then
									PROXIMO_ESTADO <= EST03;
								else
									PROXIMO_ESTADO <= EST04;																
								end if;
------------------------------------------------------------								
			when EST03 =>
								EN1 	 <= '0';
								EN2 	 <= '1';
								EN3  	 <= '0';
								EN4  	 <= '0';								
								PROXIMO_ESTADO <= EST00;
------------------------------------------------------------			
			when EST04 =>
								EN1 	 <= '0';
								EN2 	 <= '0';
								EN3  	 <= '0';
								EN4  	 <= '0';								
								if L3 = '1' then								
									PROXIMO_ESTADO <= EST05;								
								else									
									PROXIMO_ESTADO <= EST06;																
								end if;
------------------------------------------------------------
			when EST05 =>								
								EN1 	 <= '0';
								EN2 	 <= '0';
								EN3  	 <= '1';
								EN4  	 <= '0';								
								PROXIMO_ESTADO <= EST00;
------------------------------------------------------------
			when EST06 =>
								EN1 	 <= '0';
								EN2 	 <= '0';
								EN3  	 <= '0';
								EN4  	 <= '0';								
								if L4 = '1' then								
									PROXIMO_ESTADO <= EST07;								
								else									
									PROXIMO_ESTADO <= EST00;
																
								end if;			
------------------------------------------------------------
			when EST07 =>								
								EN1 	 <= '0';
								EN2 	 <= '0';
								EN3  	 <= '0';
								EN4  	 <= '1';								
								PROXIMO_ESTADO <= EST00;
------------------------------------------------------------								
			when others =>
								PROXIMO_ESTADO <= EST00;								
		end case;		
	end process;
end Behavioral;

