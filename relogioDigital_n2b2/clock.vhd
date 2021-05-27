library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CLK_DIV is
port ( CLK_IN : in STD_LOGIC;
			RELOGIO_OUT1, RELOGIO_OUT2 : out STD_LOGIC
			);
end CLK_DIV;


architecture Behavioral of CLK_DIV is

   signal DIV_LENT: std_logic_vector(31 downto 0):= x"00000000";

begin

-- processo divisor de clock
	divisorclock: process(CLK_IN)
	begin
		if CLK_IN'event and CLK_IN='1' then
			DIV_LENT <= DIV_LENT + '1';
		end if;
	end process;
	
	-- RODEI A SIMULAÇÃO COM DIV_LENT(1)
	-- IMAGINO QUE PARA A EXECUÇÃO PRECISE POR VOLTA DE DIV_LENT(25)
	RELOGIO_OUT1 <= DIV_LENT(24);
	RELOGIO_OUT2 <= DIV_LENT(24);

end Behavioral;
