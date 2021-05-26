----------------------------------------------------------------------------------
-- Faculdade: FTT 
-- Desenvolvedores: Thiago Lemes Fernandes            RA: 082170029
--                  Jhonatan Candido Matos            RA: 082170016
--                  Luiz Gustavo de Freitas           RA: 082170039
--                  Paulo de Tarso Raner Patrocinio   RA: 082170024
-- 
-- Data de Entrega: 28/05/2021
-- Nome do Projeto: relogioDigital_n2b2
-- Description: Comportamento do display de 7 segmentos
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY display_7segmentos IS
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
END display_7segmentos;

ARCHITECTURE Behavioral OF display_7segmentos IS
BEGIN
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
    WITH entrada_display_primeira_hora SELECT
        saida_display_primeira_hora <= "0000001" WHEN "1000000", -- '0'
        "1001111" WHEN "1111001", -- '1'
        "0010010" WHEN "0100100", -- '2'
        "0000110" WHEN "0110000", -- '3'
        "1001100" WHEN "0011001", -- '4'
        "0100100" WHEN "0010010", -- '5'
        "0100000" WHEN "0000010", -- '6'
        "0001111" WHEN "1111000", -- '7'
        "0000000" WHEN "0000000", -- '8'
        "0000100" WHEN "0010000", -- '9'
--        "0001000" WHEN "1010", -- 'A'
--        "1100000" WHEN "1011", -- 'B'
--        "0110001" WHEN "1100", -- 'C'
--        "1000010" WHEN "1101", -- 'D'
--        "0110000" WHEN "1110", -- 'E'
--        "0111000" WHEN "1111", -- 'F'
        "1111111" WHEN OTHERS;
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
    WITH entrada_display_segunda_hora SELECT
        saida_display_segunda_hora <= "0000001" WHEN "1000000", -- '0'
        "1001111" WHEN "1111001", -- '1'
        "0010010" WHEN "0100100", -- '2'
        "0000110" WHEN "0110000", -- '3'
        "1001100" WHEN "0011001", -- '4'
        "0100100" WHEN "0010010", -- '5'
        "0100000" WHEN "0000010", -- '6'
        "0001111" WHEN "1111000", -- '7'
        "0000000" WHEN "0000000", -- '8'
        "0000100" WHEN "0010000", -- '9'
--        "0001000" WHEN "1010", -- 'A'
--        "1100000" WHEN "1011", -- 'B'
--        "0110001" WHEN "1100", -- 'C'
--        "1000010" WHEN "1101", -- 'D'
--        "0110000" WHEN "1110", -- 'E'
--        "0111000" WHEN "1111", -- 'F'
        "1111111" WHEN OTHERS;
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
    WITH entrada_display_primeiro_minuto SELECT
        saida_display_primeiro_minuto <= "0000001" WHEN "1000000", -- '0'
        "1001111" WHEN "1111001", -- '1'
        "0010010" WHEN "0100100", -- '2'
        "0000110" WHEN "0110000", -- '3'
        "1001100" WHEN "0011001", -- '4'
        "0100100" WHEN "0010010", -- '5'
        "0100000" WHEN "0000010", -- '6'
        "0001111" WHEN "1111000", -- '7'
        "0000000" WHEN "0000000", -- '8'
        "0000100" WHEN "0010000", -- '9'
--        "0001000" WHEN "1010", -- 'A'
--        "1100000" WHEN "1011", -- 'B'
--        "0110001" WHEN "1100", -- 'C'
--        "1000010" WHEN "1101", -- 'D'
--        "0110000" WHEN "1110", -- 'E'
--        "0111000" WHEN "1111", -- 'F'
        "1111111" WHEN OTHERS;
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
    WITH entrada_display_segundo_minuto SELECT
        saida_display_segundo_minuto <= "0000001" WHEN "1000000", -- '0'
        "1001111" WHEN "1111001", -- '1'
        "0010010" WHEN "0100100", -- '2'
        "0000110" WHEN "0110000", -- '3'
        "1001100" WHEN "0011001", -- '4'
        "0100100" WHEN "0010010", -- '5'
        "0100000" WHEN "0000010", -- '6'
        "0001111" WHEN "1111000", -- '7'
        "0000000" WHEN "0000000", -- '8'
        "0000100" WHEN "0010000", -- '9'
--        "0001000" WHEN "1010", -- 'A'
--        "1100000" WHEN "1011", -- 'B'
--        "0110001" WHEN "1100", -- 'C'
--        "1000010" WHEN "1101", -- 'D'
--        "0110000" WHEN "1110", -- 'E'
--        "0111000" WHEN "1111", -- 'F'
        "1111111" WHEN OTHERS;
	
END Behavioral;