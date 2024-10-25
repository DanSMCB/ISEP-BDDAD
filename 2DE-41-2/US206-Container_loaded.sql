create or replace PROCEDURE US206 (mmsi in Varchar, output out Varchar)
IS
    unloadCounter integer :=0;
    a container_cargoManifest.cargo_manifest_id%type;
    containerType varchar(255);
    currentStage stage.id%type;
    stageCounter integer :=0;
    nextPort stage.port_id%type;
    cargogeral cargo_manifest_load.id%type;
    cargos cargo_manifest_load.id%type;
    samePort stage.id%type;
    refr container.refrigerated%type;
    name_port port.name%type;
    
    
    cursor c is 
    select cargo_manifest_load.id from cargo_manifest_load
    where cargo_manifest_load.port_id = nextPort AND cargo_manifest_load.status = 0 AND cargo_manifest_load.ship_mmsi = mmsi AND cargo_manifest_load.id > cargogeral
    order by id;

begin 
            
            select min(id) into cargogeral from cargo_manifest_load
            where cargo_manifest_load.ship_mmsi = mmsi and cargo_manifest_load.status = 1;
            
               select count(*) into stageCounter from stage 
               where stage.cargo_load_id = cargogeral;
            
             select count(*) into unloadCounter from cargo_manifest_unload 
               where cargo_manifest_unload.cargo_unload_id = cargogeral;
                
            select port_id into nextPort from stage 
            where stage.id = unloadCounter+1 AND stage.cargo_load_id = cargogeral;
            
               select name into name_port from port
            where id=nextPort;
                
                output:=output || 'Next port: id=' || nextPort || '; name= ' || name_port || chr(10);
                
            open c;     
            loop
                fetch c into cargos;
                exit when c%notfound;

                for cont in (select container_id, container_x, container_y, container_z, container_weight from container_cargoManifest inner join container on container.id = container_cargoManifest.container_id where container_cargoManifest.cargo_manifest_id = cargos) loop
                   output:=output || 'Container id: ' || cont.container_id || chr(10);
                    output:=output || 'Position of the container: x: ' || cont.container_x ||  '; ' || 'y: ' || cont.container_y || '; ' || 'z: ' || cont.container_z || chr(10);
                    output:=output || 'Load: ' || cont.container_weight || 'kg' || chr(10);
                    
                    
                    select refrigerated into refr from container 
                    where id = cont.container_id ;
                    
                    IF refr = 1 THEN
                        output:=output || 'Type: Refrigerated' || chr(10);
                    ELSE 
                        output:=output || 'Type: Not refrigerated' || chr(10);
            
                    END IF;
    
                end loop;
            
            end loop;
            close c;
 
end;