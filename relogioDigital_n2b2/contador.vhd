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
		  primeira_hora : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		  segunda_hora : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		  primeiro_minuto : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		  segundo_minuto : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		  clock_contador : IN STD_LOGIC;
		  reset_contador : IN STD_LOGIC
        -- saida_contador : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)		  
		  );
END contador;

ARCHITECTURE Behavioral OF contador IS	

  
SIGNAL hora1, hora2, minuto1, minuto2 : integer;
--SIGNAL HH1, HH2, MM1, MM2 : STD_LOGIC_VECTOR (3 DOWNTO 0);
-- SIGNAL count : integer :=1;
--SIGNAL clk : STD_LOGIC;
	
BEGIN	 
-- create_1s_clock: clk_div port map (clk_50 => clk, clk_1s => clk_1s); 

	process(clock_contador,reset_contador, entrada_contador_h1, entrada_contador_h2, entrada_contador_m1, entrada_contador_m2) 
	 begin 
-- fpga4student.com FPGA projects, VHDL projects, Verilog projects
		if(reset_contador = '0') then
			hora1 <= to_integer(unsigned(entrada_contador_h1));
			hora2 <= to_integer(unsigned(entrada_contador_h2));
			minuto1 <= to_integer(unsigned(entrada_contador_m1));
			minuto2 <= to_integer(unsigned(entrada_contador_m2));
		elsif(clock_contador = '1' and clock_contador'event) then
			minuto2 <= minuto2 + 1;
			if(minuto2 >=9) then -- minuto2 > 9 then minuto1 increases
				minuto1 <= minuto1 + 1;
				minuto2 <= 0;				
				if(minuto1 >= 5) then -- minuto1 > 5 then set to 0 and increases hora2
					hora2 <= hora2 + 1;
					minuto1 <= 0;
					if(hora2 >=9) then -- hora2 > 9 then set to 0 and increases hora1
						hora1 <= hora1 + 1;
						hora2 <= 0;					
						if(hora1 >=1) then -- hora1 > 1 then set to 0
							hora1 <= 0;
						end if;
					end if;
				end if;
			 end if;
		 end if;
	end process;
	
	process(reset_contador, hora1, hora2, minuto1, minuto2) 
	 begin 
		if(reset_contador = '0') then
--			primeira_hora <= hora1;
			primeira_hora <= std_logic_vector(to_unsigned(hora1, 4));
--			segunda_hora <= hora2;
			segunda_hora <= std_logic_vector(to_unsigned(hora2, 4));
--			primeiro_minuto <=  minuto1;
			primeiro_minuto <= std_logic_vector(to_unsigned(minuto1, 4));
--			segundo_minuto <= minuto2;
			segundo_minuto <= std_logic_vector(to_unsigned(minuto2, 4));
		else
			primeira_hora <= "0000";
			segunda_hora <= "0000";
			primeiro_minuto <=  "0000";
			segundo_minuto <= "0000";			
		end if;
	end process;
	
			

   
-- This line demonstrates how to convert positive integers

 
-- This line demonstrates how to convert positive or negative integers
--output_1b <= std_logic_vector(to_signed(input_1, output_1b'length));
						  
						  
	
	


end Behavioral;