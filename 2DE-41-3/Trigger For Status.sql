create or replace NONEDITIONABLE TRIGGER STATUS_TRIGGER 
BEFORE INSERT ON cargo_manifest_unload
for each row

DECLARE

    unloadCounter integer;
    stageCounter integer;

BEGIN


select count(cargo_manifest_unload.cargo_unload_id) into unloadCounter from cargo_manifest_unload
inner join cargo_manifest_load on cargo_manifest_load.id = cargo_manifest_unload.cargo_unload_id where :new.cargo_unload_id = cargo_manifest_load.id;


select count(stage.id) into stageCounter from stage inner join cargo_manifest_load on stage.cargo_load_id = cargo_manifest_load.id where cargo_manifest_load.id = :new.cargo_unload_id;

unloadCounter := unloadCounter+1;


dbms_output.put_line('number of unloads: ' || unloadCounter);
dbms_output.put_line('number of stages: ' || stageCounter);


if (unloadCounter = stageCounter) then
    update cargo_manifest_load
        set status = 0
    where cargo_manifest_load.id = :new.cargo_unload_id;
end if;





END STATUS_TRIGGER;