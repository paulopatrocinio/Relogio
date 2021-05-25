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
        entrada_registrador1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
--		  entrada_registrador2, entrada_registrador3, entrada_registrador4 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
--		  display_primeira_hora, display_segunda_hora, display_primeiro_minuto, display_segundo_minuto : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        enable_registrador1, enable_registrador2, enable_registrador3, enable_registrador4, reset, clock: IN STD_LOGIC;
        saida_bits_ent1 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)		  
    );
END relogioDigital_n2b2;

ARCHITECTURE Structural OF relogioDigital_n2b2 IS
    COMPONENT porta_registradora
        PORT (
            entrada_porta_registradora : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            enable_registradora, clear_registradora, clock_registradora : IN STD_LOGIC;
            saida_porta_registradora : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT display_7segmentos
        PORT (
            entrada_display_primeira_hora : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				entrada_display_segunda_hora : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				entrada_display_primeiro_minuto : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				entrada_display_segundo_minuto : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				saida_display_7segmentos : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
        );
    END COMPONENT;
	 
--	 COMPONENT bin_hex
--        PORT (
--            bin : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
--				hex : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
--        );
--    END COMPONENT;
	 
	 COMPONENT contador
        PORT (
				ph : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				sh : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				pm : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				sm : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            primeira_hora : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
				segunda_hora : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
				primeiro_minuto : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
				segundo_minuto : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
				clock_contador : IN STD_LOGIC
--				saida_contador : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
        );
    END COMPONENT;
	 	 
	 SIGNAL registrador1_contador : STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL registrador2_contador : STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL registrador3_contador : STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL registrador4_contador : STD_LOGIC_VECTOR (3 DOWNTO 0);
	 
	 
	 SIGNAL contador_display1 : STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL contador_display2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL contador_display3 : STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL contador_display4 : STD_LOGIC_VECTOR (3 DOWNTO 0);
	 

	 
BEGIN

    registrador1 : porta_registradora PORT MAP(
        entrada_porta_registradora => entrada_registrador1,
        enable_registradora => enable_registrador1,
        clear_registradora => reset,
        clock_registradora => clock,
        saida_porta_registradora => registrador1_contador
    );

    registrador2 : porta_registradora PORT MAP(
        entrada_porta_registradora => entrada_registrador1,
        enable_registradora => enable_registrador2,
        clear_registradora => reset,
        clock_registradora => clock,
        saida_porta_registradora => registrador2_contador
    );
	 
	 registrador3 : porta_registradora PORT MAP(
        entrada_porta_registradora => entrada_registrador1,
        enable_registradora => enable_registrador3,
        clear_registradora => reset,
        clock_registradora => clock,
        saida_porta_registradora => registrador3_contador
    );
	 
	 registrador4 : porta_registradora PORT MAP(
        entrada_porta_registradora => entrada_registrador1,
        enable_registradora => enable_registrador4,
        clear_registradora => reset,
        clock_registradora => clock,
        saida_porta_registradora => registrador4_contador
    );
	 	 
	 contador1 : contador PORT MAP(
		  ph => registrador1_contador,
		  sh => registrador2_contador,
		  pm => registrador3_contador,
		  sm => registrador4_contador,
        primeira_hora => contador_display1,
		  segunda_hora => contador_display2,
		  primeiro_minuto => contador_display3,
		  segundo_minuto => contador_display4,
		  clock_contador => clock	  		  
    );

    display1_7segmentos : display_7segmentos PORT MAP(
        entrada_display_primeira_hora => contador_display1,
		  entrada_display_segunda_hora => contador_display2,
		  entrada_display_primeiro_minuto => contador_display3,
		  entrada_display_segundo_minuto => contador_display4,
		  saida_display_7segmentos => saida_bits_ent1		  
    );
	 
END Structural;
