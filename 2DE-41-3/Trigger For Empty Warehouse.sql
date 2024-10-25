create or replace NONEDITIONABLE TRIGGER US306 
BEFORE INSERT OR DELETE ON container_cargoManifest 
for each row

DECLARE
    INEXISTENT EXCEPTION; 
    counter integer := 0;
    newOcc warehouse.occupancy%type;
    cap warehouse.capacity%type;
    cmlw cargo_manifest_load.warehouse_id%type;


BEGIN

 IF INSERTING THEN

select cargo_manifest_load.warehouse_id into cmlw from cargo_manifest_load where cargo_manifest_load.id = :new.cargo_manifest_id;

update warehouse
    set occupancy = occupancy - 1
where warehouse.id = cmlw;

select occupancy into newOcc from warehouse where warehouse.id = cmlw;

if (newOcc < 0) then
    RAISE INEXISTENT;
end if;

ELSE

select cargo_manifest_load.warehouse_id into cmlw from cargo_manifest_load where cargo_manifest_load.id = :old.cargo_manifest_id;

update warehouse
    set occupancy = occupancy + 1
where warehouse.id = cmlw;

end if;

EXCEPTION
    When INEXISTENT then 
        RAISE_APPLICATION_ERROR(-20000, 'There are no containers stored in the warehouse!');


END US306;

