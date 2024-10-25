create or replace PROCEDURE US208 (smmsi in Varchar, cargoId in Integer, output out Varchar)
IS   
    containerCount integer;
    totalcap ship.cap%type;
    ocprate float;
begin 
    
    select cap into totalcap from ship where ship.mmsi = smmsi;

    select count(container_id) into containerCount from container_cargoManifest
    where container_cargoManifest.cargo_manifest_id = cargoId; 

    IF totalcap = 0 then
        ocprate := 0;
    ELSE
        ocprate := containerCount/totalcap;
    END IF;

    output:='Occupancy rate: ' || ocprate || '%' || chr(10);
    
end;