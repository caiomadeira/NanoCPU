library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity NanoCPU_TB is
end NanoCPU_TB;

architecture TB of NanoCPU_TB is

	signal ck, rst: std_logic := '0';
	signal dataR, dataW: std_logic_vector(15 downto 0);
	signal address: std_logic_vector(7 downto 0);
	signal we, ce: std_logic;

	-- Memory array signal for 256 x 16-bit positions
	type memoryArray is array (0 to 255) of std_logic_vector(15 downto 0);

	
	signal memory: memoryArray :=
	(	
		0 => X"4000", -- R0 <= 0
		1 => X"4100", 
		2 => X"4200", 
		3 => X"8220", 
		4 => X"1151", 
		5 => X"6312", 
		6 => X"6120", 
		7 => X"6230", 
		8 => X"0143", 
		9 => X"9330", 
		10 => X"1143", 
		11 => X"7303", 
		12 => X"3043", -- FAZ UM BRANCH PARA A LINHA 4 SE R3 FOR 1
		13 => X"F000", -- END
		-- DADOS
		20 => X"000E", -- N (14)
		--20 => X"000F", -- Para teste
		21 => X"0000", -- recebe os valores da série
		others => (others => '0')
	);

begin

	rst <= '1', '0' after 2 ns;        -- generates the reset signal
	ck  <= not ck after 1 ns;          -- generates the clock signal 

	CPU: entity work.nanoCPU port map
	(
		ck      => ck,
		rst     => rst,
		address => address,
		dataR   => dataR,
		dataW   => dataW,
		ce      => ce,
		we      => we
	); 

	-- write to memory
	process(ck)
	begin
		if ck'event and ck = '1' then
			if we = '1' then
				memory(CONV_INTEGER(address)) <= dataW; 
			end if;
		end if;
	end process;

	dataR <= memory(CONV_INTEGER(address));   -- read from memory
-- simulação acaba apos 300 ns
-- Crio um novo processo p/ encrrar a simulação usando ASSERT.
-- process begin
-- 	wait for 300ns;
-- 	assert false report "Fim da simulação." severity failure; 
-- end process;


end TB;