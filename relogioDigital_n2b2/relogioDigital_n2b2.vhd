----------------------------------------------------------------------------------
-- Faculdade: FTT 
-- Desenvolvedores: Thiago Lemes Fernandes            RA: 082170029
--                  Jhonatan Candido Matos            RA: 082170016
--                  Luiz Gustavo de Freitas           RA: 082170039
--                  Paulo de Tarso Raner Patrocinio   RA: 082170024
-- 
-- Data de Entrega: 28/05/2021
-- Nome do Projeto: relogioDigital_n2b2
-- Description: Projetar um relógio digital. A base de tempo pode ser aproximada e deve haver uma maneira de acertar a hora.
-- 				 Saída:	Os displays 7-seg devem exibir a hora no formato "hhmm" (p.ex. 1425 para 14h25min).
-- 				 Entradas:	Deve possuir uma maneira de acertar o horário.
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY relogioDigital_n2b2 IS
    PORT (
        entrada_registrador1, entrada_registrador2, entrada_registrador3, entrada_registrador4 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        enable_registrador1, enable_registrador2, enable_registrador3, enable_registrador4, reset, clock: IN STD_LOGIC;
        saida_bits_ent1 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
--		  led_soma : out STD_LOGIC;
--		  led_carry : out STD_LOGIC
		  
    );
END relogioDigital_n2b2;

ARCHITECTURE Structural OF relogioDigital_n2b2 IS
    COMPONENT porta_registradora
        PORT (
            entrada_porta_registradora : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            enable_registradora, clear_registradora : IN STD_LOGIC;
            saida_porta_registradora : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT display_7segmentos
        PORT (
            entrada_display_7segmentos : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				saida_display_7segmentos : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
        );
    END COMPONENT;
	 
--	 COMPONENT mux
--        PORT (
--            entrada_registrador1 : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
--				entrada_registrador2 : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
--				entrada_registrador3 : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
--				entrada_registrador4 : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
--				saida_mux : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
--        );
--    END COMPONENT;
	 
	 COMPONENT contador
        PORT (
            primeira_hora : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				segunda_hora : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				primeiro_minuto : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				segundo_minuto : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				clock_contador : IN STD_LOGIC;
				saida_contador : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
        );
    END COMPONENT;
	 
--	 COMPONENT demux
--        PORT (
--            entrada_demux : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
--				saida_demux : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)				
--        );
--    END COMPONENT;

--    SIGNAL registrador1_porta_somadora1: STD_LOGIC_VECTOR (3 DOWNTO 0);
--	 SIGNAL registrador2_porta_somadora1: STD_LOGIC_VECTOR (3 DOWNTO 0);
--	 SIGNAL registrador3_display1_7segmentos: STD_LOGIC_VECTOR (3 DOWNTO 0);
	 
	 
	 
	 SIGNAL registrador1_out: STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL registrador2_out: STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL registrador3_out: STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL registrador4_out: STD_LOGIC_VECTOR (3 DOWNTO 0);
	 --SIGNAL mux_contador: STD_LOGIC_VECTOR (7 DOWNTO 0);
	 --SIGNAL contador_demux: STD_LOGIC_VECTOR (7 DOWNTO 0);
	 --SIGNAL demux_display: STD_LOGIC_VECTOR (7 DOWNTO 0);
	 
BEGIN

    registrador1 : porta_registradora PORT MAP(
        entrada_porta_registradora => entrada_registrador1,
        enable_registradora => enable_registrador1,
        clear_registradora => reset,
        --clock_registradora => clock,
        saida_porta_registradora => registrador1_out
    );

    registrador2 : porta_registradora PORT MAP(
        entrada_porta_registradora => entrada_registrador2,
        enable_registradora => enable_registrador2,
        clear_registradora => reset,
        --clock_registradora => clock,
        saida_porta_registradora => registrador2_out
    );
	 
	 registrador3 : porta_registradora PORT MAP(
        entrada_porta_registradora => entrada_registrador3,
        enable_registradora => enable_registrador3,
        clear_registradora => reset,
        --clock_registradora => clock,
        saida_porta_registradora => registrador3_out
    );
	 
	 registrador4 : porta_registradora PORT MAP(
        entrada_porta_registradora => entrada_registrador4,
        enable_registradora => enable_registrador4,
        clear_registradora => reset,
        --clock_registradora => clock,
        saida_porta_registradora => registrador4_out
    );
	 
--	 mux1 : mux PORT MAP(
--        entrada_registrador1 => registrador1_mux,
--		  entrada_registrador2 => registrador2_mux,
--		  entrada_registrador3 => registrador3_mux,
--		  entrada_registrador4 => registrador4_mux,
--		  saida_mux => mux_contador		  
--    );
	 
	 contador1 : contador PORT MAP(
        primeira_hora => registrador1_out,
		  segunda_hora => registrador2_out,
		  primeiro_minuto => registrador3_out,
		  segundo_minuto => registrador4_out,		  
		  clock_contador => clock,
		  saida_contador => entrada_display_7segmentos		  		  
    );
--	 
--	 demux1 : demux PORT MAP(
--        entrada_demux => contador_demux,
--		  saida_demux => demux_display
--    );

    display1_7segmentos : display_7segmentos PORT MAP(
        entrada_display_7segmentos => demux_display,
		  saida_display_7segmentos => saida_bits_ent1
    );	
	 
END Structural;
