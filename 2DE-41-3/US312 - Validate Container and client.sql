create or replace NONEDITIONABLE PROCEDURE US312 (contId in integer, c_username Varchar, output out Varchar)
IS
    counter integer := 1;
    c integer;
    co integer;
    shipName ship.name%type;
    stageCounter integer :=0;
    unloadCounter integer :=0;
    portId port.id%type;
    port_name port.name%type;
    u varchar(255);
    id_invalid EXCEPTION;
    cont_not_rented EXCEPTION;
begin

select count(*) into c from container_cargoManifest
where container_id = contId;

select count(*) into co from cargo_manifest_load
where id = contId;

IF(c <= 0) THEN
  RAISE id_invalid;
END IF;

select count(*) into u from container_cargoManifest
where container_id = contId AND userid_client = c_username; 

IF (u <= 0) THEN
  RAISE cont_not_rented; 
END IF;

for cont in (select * from cargo_manifest_load inner join container_cargoManifest on container_cargoManifest.cargo_manifest_id = cargo_manifest_load.id AND container_cargoManifest.container_id = contId) loop
        IF counter = 1 THEN
select port_id into portId from cargo_manifest_load
where cargo_manifest_load.id = cont.id;
select name into port_name from port
where id = portId;
output := 'Port: ' || port_name;
END IF;
select count(*) into stageCounter from stage
where stage.cargo_load_id = cont.id;

select count(*) into unloadCounter from cargo_manifest_unload
where cargo_manifest_unload.cargo_unload_id = cont.id;

IF (stageCounter > unloadCounter AND unloadCounter > 0) THEN
select name into shipName from ship
where mmsi = cont.ship_mmsi;
output := 'Ship: ' || shipName;

ELSE IF (counter = co) THEN
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

EXCEPTION
        WHEN id_invalid THEN
            output := output || '10 - The id is invalid';
        WHEN cont_not_rented THEN
            output := output || '11 - The container is not rented by the client';

end US312;