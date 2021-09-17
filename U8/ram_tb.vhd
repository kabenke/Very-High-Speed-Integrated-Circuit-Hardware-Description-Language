--################################################################################   
--			Fehlermeldungen														  
--################################################################################  
--##EXECUTION:: Time: @1ns, report warning: Zykluszeit wurde nicht eingehalten,
--Process: Zykluszeit
--##EXECUTION:: Time: @20ns, report warning: Daten liegen noch nicht lang genug an, 
--Process: Schreiben
--##EXECUTION:: Time: @31ns, report warning: Schreib-Impuls zu kurz, Process: Schreibimpulse
--##EXECUTION:: Time: @51ns, report warning: Fehler beim Lesen, 
--Process: Lesen
--##EXECUTION:: Time: @160ns, report warning: Zykluszeit wurde nicht eingehalten, 
--Process: Zykluszeit
--##EXECUTION:: Time: @381ns, report warning: Daten waren beim Schreiben nicht stabil, 
--Process: Schreibimpulse
--##EXECUTION:: Time: @400ns, report warning: Fehler beim Lesen, Process: Lesen
--##EXECUTION:: Time: @446ns, report warning: Daten waren beim Schreiben nicht stabil, 
--Process: Schreibimpulse
--##EXECUTION:: Time: @570ns, report warning: Daten liegen noch nicht lang genug an, 
--Process: Schreiben
--##EXECUTION:: Time: @570ns, report warning: Daten lagen nicht schnell genug an, 
--Process: Schreiben
--##EXECUTION:: Time: @580ns, report warning: Schreib-Impuls zu kurz, 
--Process: Schreibimpulse
---------------------------------------------------------------------------------------
--After you completed the design of "ram.vhd", please test your implementation with this
--testbench. If your implementation outputs the above "Fehlermeldungen", that means 
--your implementation is correct.
---------------------------------------------------------------------------------------
use work.ram;
use work.ram_pack.all;
	
entity ram_tb is
end ram_tb;

architecture structure of ram_tb is 
component ram
	generic (adr_breite:	Integer:=4);
	port (	adr:			in BIT_VECTOR(0 to adr_breite-1); 
			din:			in BYTE_4;
			do: 			out BYTE_4;
			read: 			in BIT);
end component;
Signal adresse:		BIT_VECTOR(0 to 3);
signal din,do:		BYTE_4;				  
signal read:		BIT:='1';
begin
Testobject: ram
	port map(
		adr		=> Adresse,
		din		=> din,
		do		=> do,
		read	=> read
	);

Adresse <= "0000" after 0 ns, "1000" after 1 ns, "0001" after 150 ns,"1000" after 160 ns,"0101" after 350 ns, "1000" after 580 ns,"0000" after 700 ns;

din <=	"00000000000000000000000000000000" after 0 ns,
"00000000000000000000000000000001" after 5 ns,
"00000000000000000000000001010000" after 150 ns,
"00000000000000000000000001010101" after 300 ns,
"00000000000000000000000001010111" after 365 ns,
"00000000000000000000000010000001" after 430 ns,
"00000000000000000000000011110000" after 560 ns;

read	<=	'1' after 0 ns, '0' after 20 ns, '1'after 31 ns, '0' after 360 ns,'1' after 381 ns, '0' after 420 ns,'1' after 446 ns, '0' after 570 ns,'1' after 580 ns;

end structure;
