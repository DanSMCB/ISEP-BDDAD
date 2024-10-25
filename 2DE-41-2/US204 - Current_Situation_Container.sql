create or replace PROCEDURE US204 (contId in integer, output out Varchar)
IS
    counter integer := 1;
    c integer;
    shipName ship.name%type;
    stageCounter integer :=0;
    unloadCounter integer :=0;
    portId port.id%type;
    port_name port.name%type;
begin

select count(*) into c from cargo_manifest_load
where id = contId;

for cont in (select * from cargo_manifest_load inner join container_cargoManifest on container_cargoManifest.cargo_manifest_id = cargo_manifest_load.id AND container_cargoManifest.container_id = contId) loop
        IF counter = 1 THEN
select port_id into portId from cargo_manifest_load
where cargo_manifest_load.id = cont.id;
END IF;
select count(*) into stageCounter from stage
where stage.cargo_load_id = cont.id;

select count(*) into unloadCounter from cargo_manifest_unload
where cargo_manifest_unload.cargo_unload_id = cont.id;

IF (stageCounter > unloadCounter AND unloadCounter > 0) THEN
select name into shipName from ship
where mmsi = cont.ship_mmsi;
output := 'Ship: ' || shipName;

ELSE IF (counter = (c + 1)) THEN
            IF (unloadCounter > 0) THEN
select port_id into portId from stage
where stage.cargo_load_id = cont.id
  AND stage.id = stageCounter;

END IF;

select name into port_name from port
where id = portId;
output := 'Port: ' || port_name;
END IF;
        
         counter := counter + 1;

END IF;
end loop;

end;