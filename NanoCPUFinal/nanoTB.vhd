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

	
	signal memory: memoryArray := (
		0 => X"4000", -- R0 = PMEM[30]
		--1 => X"4111", -- R1 = PMEM[31]
		1 => X"4120",
		2 => X"0093" , -- R2 = PMEM[32]
		3 => X"6110", -- R3 = PMEM[33]
		4 => X"8000",
		5 => X"7203",
		6 => X"3032",
		7 => X"10A1",
		8 => X"F000", -- instrucao (numero) | endereco (0F = 15) | registrador (0)
		9 => X"000A",
		20 => X"000E", -- 14 primeiros elementos da série
		21 => X"0000", -- Recebe os valores da sére
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