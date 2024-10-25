-- O navio de destino está devidamente identificado.
-- A capacidade disponível do navio foi calculada 
-- corretamente. O aviso é acionado quando necessário 


SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER trg_prevent_excess_load
	BEFORE INSERT OR UPDATE ON container_cargoManifest
	FOR EACH ROW
DECLARE
	available_capacity INTEGER;
    sh ship.mmsi%TYPE; -- passar como parametro
	ava_cap_ship INTEGER;
	overloaded EXCEPTION;
	
CURSOR cur_capacity_available IS
	    SELECT s.cap - COUNT(ccm.cargo_manifest_id) INTO available_capacity
		FROM container_cargoManifest ccm
		INNER JOIN cargo_manifest_load cml ON ccm.cargo_manifest_id = cml.id
		INNER JOIN ship s ON cml.ship_mmsi = s.mmsi
		WHERE s.mmsi = sh;
        
BEGIN
	OPEN cur_capacity_available;
        LOOP    
        FETCH cur_capacity_available
        INTO ava_cap_ship;
        EXIT WHEN cur_capacity_available%notfound;
        END LOOP;
        -- CLOSE cur_capacity_available;
    
        dbms_output.put_line('capacity ship:' || ava_cap_ship); -- ship capacity at the moment
		            				
			        		
			        IF(ava_cap_ship < 0) THEN -- The number of cargo manifests is greater than the ship's capacity
				      RAISE overloaded;
				    END IF;   
        			ava_cap_ship := ava_cap_ship - 1;
         CLOSE cur_capacity_available;

EXCEPTION
    WHEN overloaded THEN
      raise_application_error(-20501, 'The ships capacity has been exceeded.');
END;