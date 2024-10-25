create or replace NONEDITIONABLE TRIGGER US307 
BEFORE INSERT OR DELETE ON container_cargoManifest 
for each row

DECLARE

    OVERLOADED EXCEPTION;
    cm container_cargoManifest.cargo_manifest_id%type;
    wh stage.warehouse_id%type;
    newOcc warehouse.occupancy%type;
    cap warehouse.capacity%type;
    counter integer;

BEGIN

IF INSERTING THEN

select distinct stage.warehouse_id into wh from stage 
where stage.id = :new.stage_id and stage.cargo_load_id = :new.cargo_manifest_id;

update warehouse
    set occupancy = occupancy + 1
where warehouse.id = wh;

select occupancy into newOcc from warehouse where warehouse.id = wh;
select capacity into cap from warehouse where warehouse.id = wh;

dbms_output.put_line('occupancy: '   newOcc);
dbms_output.put_line('capacity: '  cap);

if (newOcc > cap) then
    RAISE OVERLOADED;
end if;

ELSE 

select distinct stage.warehouse_id into wh from stage 
where stage.id = :old.stage_id and stage.cargo_load_id = :old.cargo_manifest_id;

update warehouse
    set occupancy = occupancy - 1
where warehouse.id = wh;

END IF;


EXCEPTION 
    When OVERLOADED then 
        RAISE_APPLICATION_ERROR(-20001, 'The warehouse cannot store more containers!');
END US307;