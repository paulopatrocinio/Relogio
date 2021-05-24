----------------------------------------------------------------------------------
-- Faculdade: FTT 
-- Desenvolvedores: Thiago Lemes Fernandes            RA: 082170029
--                  Jhonatan Candido Matos            RA: 082170016
--                  Luiz Gustavo de Freitas           RA: 082170039
--                  Paulo de Tarso Raner Patrocinio   RA: 082170024
-- 
-- Data de Entrega: 28/05/2021
-- Nome do Projeto: relogioDigital_n2b2
-- Description: Comportamento do componente DEMUX
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DEMUX4X1 is
    Port ( 
			  IN_DEMUX : in  STD_LOGIC_VECTOR (3 downto 0);
			  R1_OUT : in  STD_LOGIC_VECTOR (3 downto 0);
           R2_OUT : in  STD_LOGIC_VECTOR (3 downto 0);
			  R3_OUT : in  STD_LOGIC_VECTOR (3 downto 0);
			  R4_OUT : in  STD_LOGIC_VECTOR (3 downto 0);
           SEL_DEMUX : in  STD_LOGIC_VECTOR (1 downto 0);
			  
			  )
           
end DEMUX4X1;

architecture DEMUX4X1_ARQ of DEMUX4X1 is

begin

WITH SEL_DEMUX SELECT

DEMUX_OUT <= IN_R1 WHEN "00",
			  IN_R2 WHEN "01",
			  IN_R3 WHEN "10",
			  IN_R4 WHEN OTHERS;

end DEMUX4X1_ARQ;

