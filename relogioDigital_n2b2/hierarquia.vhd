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

ENTITY hierarquia IS
    PORT (
        entrada_bits_ent1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        enable_registrador1, enable_registrador2, enable_registrador3, enable_registrador4, reset, clock: IN STD_LOGIC;
        saida_bits_ent1, saida_bits_ent2, saida_bits_ent3, saida_bits_ent4 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)		  
    );
END hierarquia;

ARCHITECTURE Structural OF hierarquia IS
    COMPONENT porta_registradora
        PORT (
            entrada_porta_registradora : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            enable_registradora, clear_registradora, clock_registradora : IN STD_LOGIC;
            saida_porta_registradora : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT display_7segmentos
        PORT (
            entrada_display_primeira_hora : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
				entrada_display_segunda_hora : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
				entrada_display_primeiro_minuto : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
				entrada_display_segundo_minuto : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
				saida_display_primeira_hora : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
				saida_display_segunda_hora : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
				saida_display_primeiro_minuto : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
				saida_display_segundo_minuto : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
        );
    END COMPONENT;	 
	 
	 COMPONENT contador
        PORT (
				entrada_contador_h1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				entrada_contador_h2 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				entrada_contador_m1 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				entrada_contador_m2 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            primeira_hora : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
				segunda_hora : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
				primeiro_minuto : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
				segundo_minuto : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
				clock_contador : IN STD_LOGIC;
				reset_contador : IN STD_LOGIC
        );
    END COMPONENT;
	 	 
	 SIGNAL registrador1_contador, registrador2_contador, registrador3_contador, registrador4_contador : STD_LOGIC_VECTOR (3 DOWNTO 0);	 
	 SIGNAL contador_display1, contador_display2, contador_display3, contador_display4 : STD_LOGIC_VECTOR (6 DOWNTO 0);
	 	 
BEGIN
	 
	 registrador1 : porta_registradora PORT MAP(
        entrada_porta_registradora => entrada_bits_ent1,
        enable_registradora => enable_registrador1,
        clear_registradora => reset,
        clock_registradora => clock,
        saida_porta_registradora => registrador1_contador
    );
	 
	 registrador2 : porta_registradora PORT MAP(
        entrada_porta_registradora => entrada_bits_ent1,
        enable_registradora => enable_registrador2,
        clear_registradora => reset,
        clock_registradora => clock,
        saida_porta_registradora => registrador2_contador
    );
	 
	 registrador3 : porta_registradora PORT MAP(
        entrada_porta_registradora => entrada_bits_ent1,
        enable_registradora => enable_registrador3,
        clear_registradora => reset,
        clock_registradora => clock,
        saida_porta_registradora => registrador3_contador
    );
	 
	 registrador4 : porta_registradora PORT MAP(
        entrada_porta_registradora => entrada_bits_ent1,
        enable_registradora => enable_registrador4,
        clear_registradora => reset,
        clock_registradora => clock,
        saida_porta_registradora => registrador4_contador
    );
	 	 
	 contador1 : contador PORT MAP(
		  entrada_contador_h1 => registrador1_contador,
		  entrada_contador_h2 => registrador2_contador,
		  entrada_contador_m1 => registrador3_contador,
		  entrada_contador_m2 => registrador4_contador,
		  primeira_hora => contador_display1,
		  segunda_hora => contador_display2,
		  primeiro_minuto => contador_display3,
		  segundo_minuto => contador_display4,
		  clock_contador => clock,
		  reset_contador => reset
    );
	 	 
    display1_7segmentos : display_7segmentos PORT MAP(
        entrada_display_primeira_hora => contador_display1,
		  entrada_display_segunda_hora => contador_display2,
		  entrada_display_primeiro_minuto => contador_display3,
		  entrada_display_segundo_minuto => contador_display4,
		  saida_display_primeira_hora => saida_bits_ent1,
		  saida_display_segunda_hora => saida_bits_ent2,
		  saida_display_primeiro_minuto => saida_bits_ent3,
		  saida_display_segundo_minuto => saida_bits_ent4		  
    );
	 
END Structural;
