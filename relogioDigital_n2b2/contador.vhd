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
        ph : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		  sh : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		  pm : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		  sM : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		  primeira_hora : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		  segunda_hora : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		  primeiro_minuto : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		  segundo_minuto : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		  clock_contador : IN STD_LOGIC
        -- saida_contador : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)		  
		  );
END contador;

ARCHITECTURE Behavioral OF contador IS
  
SIGNAL HH1 : integer range 0 to 2 :=0;
SIGNAL HH2 : integer range 0 to 9 :=0;
SIGNAL MM1 : integer range 0 to 50 :=0;
SIGNAL MM2 : integer range 0 to 9 :=0;
SIGNAL count : integer :=1;
SIGNAL clk : std_logic :='0';

BEGIN
	
--	primeira_hora <= conv_std_logic_vector(HH1,4);
--	
--	segunda_hora <= conv_std_logic_vector(HH2,4);
--	primeiro_minuto <= conv_std_logic_vector(MM1,4);
--	segundo_minuto <= conv_std_logic_vector(MM2,4);

--signal sig1 : std_logic_vector(15 downto 0):=X"0123";--
--signal sig2 : integer range 0 to 65535:=0;--
--signal sig3 : integer range 0 to 65535:=456;--
--signal sig4 : std_logic_vector(15 downto 0):=X"0000";--
--    --To convert sig1-->sig2--
--sig2<=conv_integer(sig1);--
--    --To convert sig3-->sig4--
--sig4<=conv_std_logic_vector(sig3,16);
	
--	primeira_hora <= conv_std_logic_vector(HH1,2);
--	segunda_hora <= conv_std_logic_vector(HH2,4);
--	primeiro_minuto <= conv_std_logic_vector(MM1,3);
--	segundo_minuto <= conv_std_logic_vector(MM2,4);

	primeira_hora <= std_logic_vector(to_unsigned(HH1, 4));
	segunda_hora <= std_logic_vector(to_unsigned(HH2, 4));
	primeiro_minuto <= std_logic_vector(to_unsigned(MM1, 4));
	segundo_minuto <= std_logic_vector(to_unsigned(MM2, 4));
	 
	
    process(clock_contador)
  begin
    if(clock_contador'event and clock_contador='1') then
      count <= count + 1;
      if(count = 50000000) then
        clk <= not clk;
        count <= 1;
      end if;
    end if;
  end process;
 
  process(clk)   --period of clk is 1 second.
  begin
    if(clk'event and clk='1') then
		MM2 <= MM2 + 1;
      if(MM2 = 9) then
			MM2 <= 0;
			MM2 <= MM1 + 1;
        if(MM1 = 5) then          
				MM1 <= 0;
				HH2 <= HH2 + 1;
          if(HH2 = 9) then
					HH2 <= 0;
					HH1 <= HH1 + 1;
				if(HH1 = 1) then
					HH1 <= 0;
				end if;
          end if;
        end if;
      end if;
    end if;
  end process;
end Behavioral;