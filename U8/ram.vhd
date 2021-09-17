----------------------------------Package Definition-----------------------------------
---------------------------------------------------------------------------------------
-- 1. Please create the package "ram_pack" by completing the following codes.

-- 2. Please check the "VHDL script" in Moodle to learn how to define a subtype, 
-- and then complete the subtype "BYTE_4", that consists of 4 BYTE (32 bits).

-- 3. Please check the "VHDL script" in Moodle to learn how to define a type, 
-- and then complete the type "SPEICHER_MATRIX", which is the storage units of RAM.
-----------------------------------------------------------------------------------------

package ram_pack is
	subtype BYTE_4 is BIT_VECTOR (31 downto 0);
	type SPEICHER_MATRIX  is array(INTEGER range <>) of BYTE_4;
end ram_pack;

----------------------------------Entity Definition------------------------------------
---------------------------------------------------------------------------------------
-- 1. The way you use the package you defined is similar to how you use other packages.

-- 2. "adr_breite" is an adjustable integer, that describes the length of the address,
-- "adr" is the address, "din" is the input, "do" is the output, "read" controls whether 
-- signals need to be read or written.

-- 3. This block is already complete, you can directly use it.
-----------------------------------------------------------------------------------------

use work.ram_pack.ALL; 
entity ram is
	generic (adr_breite : INTEGER);
	port (adr : in BIT_VECTOR (0 to adr_breite-1);
			din : in BYTE_4;
			do : out BYTE_4; 
			read : in BIT);
end ram;

-----------------------------BitsToInteger Function------------------------------------
---------------------------------------------------------------------------------------
-- 1. You can directly use the Function "to_integer", that can convert the data fed 
-- as bits into an integer.

-- 2. With this converted integer, you can specify the position in the SPEICHER_MATRIX 
-- of the data you need to read (write).
-----------------------------------------------------------------------------------------

architecture ram_behave of ram is
function to_integer (constant i : in BIT_VECTOR) return INTEGER is
	-- Funktion: Umwandeln eines Bit-Vektor-Wertes in eine Integer-Zahl
	variable i_tmp : BIT_VECTOR (0 to i'length-1);
	variable int_tmp : INTEGER := 0;	
begin
	i_tmp := i;
	for m in 0 to i'length-1 loop
		if i_tmp(m) = '1' then
			int_tmp := int_tmp + 2**(i'length-1 - m); 
		end if;
	end loop;
	return int_tmp;
end to_integer;

-----------------------------Lesezugriff Process-----------------------------------------
-----------------------------------------------------------------------------------------
-- 1. The signal "ram_m" is the storage unit of RAM and belongs to SPEICHER_MATRIX you defined.

-- 2. In the "Lesezugriff process", data can be extracted from RAM (SPEICHER_MATRIX).

-- 3. In the "Lesezugriff process", we need to check whether the signals satisfy the 
-- requirements (time constraint) in the assignments.

-- 4. If the above requirements are not satisfied, please report "Fehler beim Lesen".

-- 5. The following codes demonstrates how the "Lesezugriff process" works, please read them
-- carefully and try to complete the rest of the processes.
-----------------------------------------------------------------------------------------

	signal ram_m : SPEICHER_MATRIX (0 to (2**adr_breite)-1);
begin
	Lesezugriff: process 
	variable t_read, t_akt : TIME;
	begin
		wait on adr;  --warten, bis adr ändern sich(verfügbar ist)
		
		wait for 6 ns; --für 6ns warten damit Read Signal geht auf 1
		--überprüft, ob das Lesen Signal auf 1 gesetzt wurde.
		if read = '1' then  
		-- In diesem Fall wird der Inhalt des Rams an der Position der gelesenen 
		-- Adresse in den Daten-Out gespeichert
			do <= ram_m(to_integer(adr)); 
		end if;
		
		wait for 44 ns; --für 44ns warten, damit t_read=44ns+6ns 
		t_read := read'last_event; 
		--Falls beim Lesen ein Fehler aufgetreten ist
		if t_read < 44 ns then
			report "Fehler beim Lesen"
			severity WARNING;
		end if;
	end process;

-----------------------------Schreibzugriff Process--------------------------------------
-----------------------------------------------------------------------------------------
-- 1. According to the assignment requirements, please complete the "Schreibzugriff" process
-- where the data can be fed into RAM (SPEICHER_MATRIX). 

-- 2. In the "Schreibzugriff process", you also need to check whether the signals satisfy the 
-- requirement (time constraint) in the assignments, e.g., the data signal should be longer 
-- than 20ns before R/W changes to "low", and shorter than 25ns after R/W to changed.

-- 3. If the data signal "din" is shorter than 20ns, please report 
-- "Daten liegen noch nicht lang genug an".

-- 4. If the data signal "din" is longer than 25ns, please report 
-- "Daten lagen nicht schnell genug an".
-----------------------------------------------------------------------------------------

	Schreibzugriff: process
	-- missing
	
	variable t_read,t0,t1,t2,t : TIME;
	begin
	-- missing
		wait on adr;
		t0:=now;
		--wait for 20 ns;
		wait until read='0';
		t1:=now;
		t:=t1-t0;
		if t < 20 ns then
			report "Daten liegen noch nicht lang genug an"
			severity WARNING;
		end if;
		
		if read='0' then
			ram_m(to_integer(adr))<=din;
		end if;
	
		if t > 25 ns then
			report "Daten lagen nicht schnell genug an"
			severity WARNING;
		end if;
		
		
	end process;

------------------------Zyklus_Pruefen und Schreibimpulse_Pruefen------------------------
-----------------------------------------------------------------------------------------
-- 1. According to the assignment requirements, please complete the "Zyklus_Pruefen" process
-- und the "Schreibimpulse_Pruefen". 

-- 2. In both processes, you need to check whether the signal satisfy the requirement (time 
-- constraint) in the assignments.

-- 3. If the address signal "adr" is not held for 100 after the address change, please report 
-- "Zykluszeit wurde nicht eingehalten".

-- 4. If the Schreibimpulse is shorter than 15 ns, please report "Schreib-Impuls zu kurz".

-- 5. If the data is stable for the duration of the Schreibpulse, please report 
-- "Daten waren beim Schreiben nicht stabil!".		
-----------------------------------------------------------------------------------------
	Zyklus_Pruefen: process 
	-- missing
	
	variable adr_temp : BIT_VECTOR (0 to adr_breite-1);
	variable t_0,t_1,t : TIME;
	begin
	-- missing
	--&time'image(t)
		adr_temp:=adr;
		t_0:=now;
		wait on adr;
		t_1:=now;
		t:=t_1-t_0;
		if t < 100 ns then
			report "Zykluszeit wurde nicht eingehalten"
			severity WARNING;
		end if;
				
	end process;


	Schreibimpulse_Pruefen: process
	-- missing
	variable din_temp : BYTE_4;
	variable t_10,t_01,t : TIME;
	begin
	-- missing
		--if read = '0' then
		wait until read ='0';
		t_10 := now;
		din_temp:=din;
		wait until read='1';
		t_01 := now;
		if din_temp /= din then
			report "Daten waren beim Schreiben nicht stabil!"
			severity WARNING;
		end if;  
		t:=t_01-t_10;
		if t < 15 ns then
			report "Schreib-Impuls zu kurz"
			severity WARNING;
		end if;
	end process;
	
end ram_behave;

