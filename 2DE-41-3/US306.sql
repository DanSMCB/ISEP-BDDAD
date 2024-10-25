CREATE OR REPLACE PROCEDURE US306 (port in Varchar, output out Varchar)
IS    
    cap warehouse.capacity%type;
    occ warehouse.occupancy%type;
    occupancyRate number(5,3);
    containersCount integer;
    containersUnloaded integer;
    cont integer;
    contUnl integer; 
    containersToBeOffloaded integer;
    departure timestamp;
    d date;
    wh warehouse.id%type;   
   
    cursor c is 
    select warehouse.id from warehouse
    inner join port on warehouse.port_id = port.id where port.id = port;
    

BEGIN
    output := output || 'PORT: ' || port || chr(10) || chr(10);
    open c;     
     loop
            
            fetch c into wh;
            exit when c%notfound;
            
              output := output || 'Warehouse: ' || wh || chr(10);
                
                cont := 0;
                contUnl := 0;
                
        select capacity into cap from warehouse where warehouse.id = wh;
        select occupancy into occ from warehouse where warehouse.id = wh;
    
        occupancyRate := occ/cap; 
        
        output := output || 'Occupancy rate: ' || occupancyRate || '%' || chr(10);
    
    
    
        for j in (select * from cargo_manifest_load where cargo_manifest_load.status = 1 and cargo_manifest_load.warehouse_id = wh) loop
        
        
        
        select stage.departure_date into departure from stage inner join cargo_manifest_load on cargo_manifest_load.id = stage.cargo_load_id where stage.id = 1 and cargo_manifest_load.id = j.id;
        
        
        
        SELECT TO_TIMESTAMP(sysdate,'YY.MM.DD') + 30 into d FROM dual;
        
        if  (departure < d) then
         select count(container_cargoManifest.cargo_manifest_id) into containersCount from container_cargoManifest where container_cargoManifest.cargo_manifest_id = j.id;
         select count(*) into containersUnloaded from container_cargoManifest inner join stage on stage.cargo_load_id = container_cargoManifest.cargo_manifest_id inner join cargo_manifest_unload on cargo_manifest_unload.cargo_unload_id = stage.cargo_load_id where cargo_manifest_unload.cargo_unload_id = j.id and stage.id = container_cargoManifest.stage_id and stage.warehouse_id = cargo_manifest_unload.warehouse_id; 
         
    
    
         cont := cont + containersCount;
         contUnl := contUnl + containersUnloaded;
         
        
         
            dbms_output.put_line('departure: ' || departure);
            dbms_output.put_line('cargo load id: ' || j.id);
            
        end if;
    
        
        end loop;
        
        containersToBeOffloaded := cont - contUnl;
        output := output || 'Containers leaving the warehouse ' || wh || ' in the next 30 days: '  || containersToBeOffloaded || chr(10) || chr(10); 
    end loop;
    
    close c;
    
     

END;