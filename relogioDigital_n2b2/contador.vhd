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
USE IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
--USE IEEE.STD_LOGIC_ARITH;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY contador IS
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
        -- saida_contador : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)		  
		  );
END contador;

ARCHITECTURE Behavioral OF contador IS

	COMPONENT binario_hex
        PORT (
				Bin: in std_logic_vector(3 downto 0);
				Hout: out std_logic_vector(6 downto 0)
        );
    END COMPONENT;

	COMPONENT clk_div
        PORT (
				clk_50: in std_logic;
				clk_1s: out std_logic
        );
    END COMPONENT;
  
SIGNAL hora, minuto : integer;
SIGNAL HH1, HH2, MM1, MM2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
-- SIGNAL count : integer :=1;
SIGNAL clk : STD_LOGIC;

BEGIN	 
-- create_1s_clock: clk_div port map (clk_50 => clk, clk_1s => clk_1s); 

	process(clk,reset_contador) 
	 begin 
-- fpga4student.com FPGA projects, VHDL projects, Verilog projects
		if(reset_contador = '0') then
			hora <= to_integer(unsigned(entrada_contador_h1))*10 + to_integer(unsigned(entrada_contador_h2));			
			minuto <= to_integer(unsigned(entrada_contador_m1))*10 + to_integer(unsigned(entrada_contador_m2));			
		elsif(rising_edge(clk)) then
			minuto <= minuto + 1;
			if(minuto >=59) then -- minute > 59 then hour increases
				minuto <= 0;
				hora <= hora + 1;
				if(hora >= 24) then -- hour > 24 then set hour to 0
					hora <= 0;
				end if;
			 end if;
		 end if;
	end process;
	
----------------------|
-- Conversion time ---|
----------------------|
-- primeira_hora binary value
 HH1 <= x"2" when hora >=20 else
 x"1" when hora >=10 else
 x"0";
-- 7-Segment LED display of primeira_hora
convert_hex_primeira_hora: binario_hex port map (Bin => HH1, Hout => primeira_hora);

-- segunda_hora binary value
 HH2 <= std_logic_vector(to_unsigned((hora - to_integer(unsigned(HH1))*10),4));
-- 7-Segment LED display of segunda_hora
convert_hex_segunda_hora: binario_hex port map (Bin => HH2, Hout => segunda_hora);

-- primeiro_minuto binary value
 MM1 <= x"5" when minuto >= 50 else
 x"4" when minuto >= 40 else
 x"3" when minuto >= 30 else
 x"2" when minuto >= 20 else
 x"1" when minuto >= 10 else
 x"0";
-- 7-Segment LED display of primeiro_minuto
convert_hex_primeiro_minuto: binario_hex port map(
	Bin => MM1,
	Hout => primeiro_minuto
	);
-- segundo_minuto binary value
 MM2 <= std_logic_vector(to_unsigned((minuto - to_integer(unsigned(MM1))*10),4));
-- 7-Segment LED display of segundo_minuto
convert_hex_segundo_minuto: binario_hex port map (Bin => MM2, Hout => segundo_minuto);

end Behavioral;