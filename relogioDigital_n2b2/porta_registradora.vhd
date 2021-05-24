----------------------------------------------------------------------------------
-- Faculdade: FTT 
-- Desenvolvedores: Thiago Lemes Fernandes            RA: 082170029
--                  Jhonatan Candido Matos            RA: 082170016
--                  Luiz Gustavo de Freitas           RA: 082170039
--                  Paulo de Tarso Raner Patrocinio   RA: 082170024
-- 
-- Data de Entrega: 28/05/2021
-- Nome do Projeto: relogioDigital_n2b2
-- Description: Comportamento do componente registrador
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

ENTITY porta_registradora IS
    PORT (
        entrada_porta_registradora : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        enable_registradora, clear_registradora: IN STD_LOGIC;
		  -- clock_registradora: IN STD_LOGIC;
        saida_porta_registradora : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
		  );
END porta_registradora;

ARCHITECTURE Behavioral OF porta_registradora IS
BEGIN
    PROCESS (enable_registradora, clear_registradora)
    BEGIN        
            IF clear_registradora = '1' THEN
                saida_porta_registradora <= "0000";
            ELSIF enable_registradora = '1' THEN
                saida_porta_registradora <= entrada_porta_registradora;
            END IF;        
				
--        IF (clock_registradora'event AND clock_registradora = '1') THEN
--            IF clear_registradora = '1' THEN
--                saida_porta_registradora <= "00";
--            ELSIF enable_registradora = '1' THEN
--                saida_porta_registradora <= entrada_porta_registradora;
--            END IF;
--        END IF;
    END PROCESS;
END Behavioral;