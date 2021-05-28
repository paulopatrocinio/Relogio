----------------------------------------------------------------------------------
-- Faculdade: FTT 
-- Desenvolvedores: Thiago Lemes Fernandes            RA: 082170029
--                  Jhonatan Candido Matos            RA: 082170016
--                  Luiz Gustavo de Freitas           RA: 082170039
--                  Paulo de Tarso Raner Patrocinio   RA: 082170024
-- 
-- Data de Entrega: 28/05/2021
-- Nome do Projeto: SD_relogioDigital_n2b2
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

ENTITY SD_relogioDigital_n2b2 IS
    PORT (
        numero : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		  L1, L2, L3, L4 : IN STD_LOGIC;
        sd_reset, sd_clock: IN STD_LOGIC;
		  saida : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		  s1, s2, s3, s4: OUT STD_LOGIC
    );
END SD_relogioDigital_n2b2;

ARCHITECTURE Behavioral OF SD_relogioDigital_n2b2 IS
	 
	 COMPONENT ASM_UC 
    PORT ( CLK_UC : in  STD_LOGIC;
           RST_UC : in  STD_LOGIC;
           L1 : in  STD_LOGIC;
           L2 : in  STD_LOGIC;
			  L3 : in  STD_LOGIC;
           L4 : in  STD_LOGIC;			  
           EN1 : out STD_LOGIC;
           EN2 : out STD_LOGIC;
           EN3 : out STD_LOGIC;
			  EN4 : out STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT hierarquia
    PORT (entrada_bits_ent1: in STD_LOGIC_VECTOR(3 downto 0);           
          enable_registrador1: in STD_LOGIC; 
          enable_registrador2: in STD_LOGIC;
          enable_registrador3: in STD_LOGIC; 
			 enable_registrador4: in STD_LOGIC; 
			 fd_reset: in STD_LOGIC;
			 fd_clock: in STD_LOGIC;
          saida_bits_ent1: out STD_LOGIC_VECTOR (6 downto 0);
			 d1, d2, d3, d4 : OUT STD_LOGIC
			 );
	END COMPONENT;	  
	 
	 SIGNAL enable01, enable02, enable03, enable04 : STD_LOGIC;
--	 SIGNAL clock_uc, clock_fd: std_logic;	
	 	 
BEGIN		
	 
	 UC: ASM_UC port map ( 
			  CLK_UC => sd_clock,
           RST_UC => sd_reset,
           L1 		=> L1,
           L2 		=> L2,
			  L3 		=> L3,
			  L4 		=> L4,			  
           EN1 	=> enable01,
           EN2 	=> enable02,
           EN3 	=> enable03,
			  EN4 	=> enable04
	);
	
		FD: hierarquia port map (
			  entrada_bits_ent1 => numero,
           saida_bits_ent1 => saida,
           enable_registrador1 => enable01,
           enable_registrador2 => enable02,
           enable_registrador3 => enable03,
			  enable_registrador4 => enable04,
           fd_clock => sd_clock,
			  fd_reset => sd_reset,
			  d1 => s1,
			  d2 => s2,
			  d3 => s3,
			  d4 => s4
		);
END Behavioral;
