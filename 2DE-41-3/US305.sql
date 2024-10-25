create or replace NONEDITIONABLE PROCEDURE US305 (client__id in Varchar, container__id in INTEGER, output out Varchar)
IS 
    stages stage.id%type;
    cargo_loads stage.cargo_load_id%type;
    port_cargo_first port.name%type;
    first_port_check cargo_manifest_load.port_id%type;
    first_warehouse_check cargo_manifest_load.warehouse_id%type;
    cargo_load_id_main cargo_manifest_load.id%type;
    warehouse_cargo_first warehouse.name%type;
    port_cargo_arrival port.name%type;
    ship_location_port port.name%type;
    ship_location_warehouse warehouse.name%type;
    portid stage.port_id%type;
    port_cargo_departure port.name%type;
    warehouseid stage.warehouse_id%type;
    dataAtual timestamp;
    warehouse_cargo_arrival warehouse.name%type;
    warehouse_cargo_departure warehouse.name%type;
    flag integer :=0;
    flag2 integer :=0;
    flag3 integer :=0;
    ship_identifier cargo_manifest_load.ship_mmsi%type;
    ship_mmsi ship.mmsi%type;
    ship_name ship.name%type;
    ship_mmsi_final ship.mmsi%type;
    ship_name_final ship.name%type;
    truck_identifier cargo_manifest_load.truck_id%type;
    truck_id truck.id%type;
    truck_id_final truck.id%type;
    final_port cargo_manifest_load.port_id%type;
    
    
    cursor c is 
    SELECT DISTINCT s.id, cml.id FROM container_cargoManifest ccm, cargo_manifest_load cml, stage s
    WHERE ccm.userid_client = client__id AND ccm.container_id = container__id AND ccm.cargo_manifest_id=cml.id AND cml.id=s.cargo_load_id order by cml.id asc, s.id;


begin 

        output:=output || '-- Path of Container ' || container__id || ' --' || chr(10);
        
	    SELECT TO_TIMESTAMP(SYSDATE, 'DD-MM-YYYY HH24:MI:SS') into dataAtual FROM DUAL;

            open c;     
            
            loop
                fetch c into stages, cargo_loads;
                exit when c%notfound;

                for cont in (select id, departure_date, arrival_date, cargo_load_id, port_id, warehouse_id from stage where id = stages and cargo_load_id = cargo_loads) loop
                    
                    output:=output || chr(10);
                    
                    SELECT DISTINCT cml.id, cml.port_id into cargo_load_id_main, final_port FROM container_cargoManifest ccm, cargo_manifest_load cml
                    WHERE ccm.userid_client = client__id AND cml.id = cont.cargo_load_id AND ccm.container_id = container__id AND ccm.cargo_manifest_id=cml.id;
                    
                    IF cont.warehouse_id is NULL THEN
                    
                        select p.name into port_cargo_arrival from port p
                        WHERE cont.port_id = p.id;
                    
                    ELSE
                    
                        select w.name into warehouse_cargo_arrival from warehouse w
                        WHERE cont.warehouse_id = w.id;
                    
                    END IF;
                    
                    select distinct cml.ship_mmsi, cml.truck_id into ship_identifier, truck_identifier from cargo_manifest_load cml where cml.id = cargo_load_id_main;
                    
                    IF ship_identifier is NULL THEN
                        
                        select distinct t.id into truck_id from truck t, cargo_manifest_load cml
                        where t.id = truck_identifier;
                    
                    ELSE
                    
                        select distinct s.mmsi, s.name into ship_mmsi, ship_name from ship s, cargo_manifest_load cml
                        where s.mmsi = ship_identifier;
                                   
                    END IF;               
                     
                    IF cont.id = 1 and flag3 = 0 THEN
                        
                        flag3 :=2;
                        
                        SELECT cml.warehouse_id into first_warehouse_check FROM cargo_manifest_load cml
                        WHERE cml.id = cargo_load_id_main;
            
            
                        IF first_warehouse_check is NULL then
            
                            SELECT DISTINCT p.name into port_cargo_first FROM container_cargoManifest ccm, cargo_manifest_load cml, stage s, port p
                            WHERE ccm.userid_client = client__id AND cml.id = cont.cargo_load_id AND ccm.container_id = container__id AND ccm.cargo_manifest_id=cml.id AND cml.id=s.cargo_load_id AND cml.port_id = p.id;
            
                        ELSE
            
                            SELECT DISTINCT w.name into warehouse_cargo_first FROM container_cargoManifest ccm, cargo_manifest_load cml, stage s, warehouse w
                            WHERE ccm.userid_client = client__id AND cml.id = cont.cargo_load_id AND ccm.container_id = container__id AND ccm.cargo_manifest_id=cml.id AND cml.id=s.cargo_load_id AND cml.warehouse_id = w.id;
                
                        END IF;
                        
                        IF port_cargo_first is NULL THEN
                        
                            output:=output || 'Departure: ' || warehouse_cargo_first || chr(10);
                            
                        ELSE
                            
                            output:=output || 'Departure: ' || port_cargo_first || chr(10);
                        
                        END IF;
                        
                        output:=output || 'Departure Date: ' ||  cont.departure_date || chr(10);
                        
                        IF port_cargo_arrival is NULL THEN
                        
                            output:=output || 'Arrival: ' || warehouse_cargo_arrival || chr(10);
                            
                        ELSE
                            
                            output:=output || 'Arrival: ' || port_cargo_arrival || chr(10);
                            
                        END IF;
                        
                        output:=output || 'Arrival Date: ' || cont.arrival_date || chr(10);
                        
                        IF (cont.departure_date > dataAtual AND flag = 0) THEN
                        
                            IF port_cargo_first is NULL THEN
                        
                                ship_location_warehouse := warehouse_cargo_first;
                                flag := 3;
                            
                            ELSE
                            
                                ship_location_port := port_cargo_first;
                                flag := 4;
                            
                            END IF;
                            
                        ELSIF (cont.arrival_date > dataAtual AND flag = 0) THEN
                            
                            IF port_cargo_arrival is NOT NULL and port_cargo_departure is NOT NULL THEN
                                
                                ship_mmsi_final := ship_mmsi;
                                ship_name_final := ship_name;
                                flag := 2;
                            
                            ELSE
                            
                                truck_id_final := truck_id;
                                flag := 5;
                            
                            END IF;
                            
                        END IF;
                    
                    
                    ELSE
                        
                        IF port_cargo_departure is NULL THEN
                        
                            output:=output || 'Departure: ' || warehouse_cargo_departure || chr(10);
                            
                        ELSE
                            
                            output:=output || 'Departure: ' || port_cargo_departure || chr(10);
                            
                        END IF;
                        
                        output:=output || 'Departure Date: ' ||  cont.departure_date || chr(10);
                        
                        IF port_cargo_arrival is NULL THEN
                        
                            output:=output || 'Arrival: ' || warehouse_cargo_arrival || chr(10);
                            
                        ELSE
                            
                            output:=output || 'Arrival: ' || port_cargo_arrival || chr(10);
                            
                        END IF;
                        
                        output:=output || 'Arrival Date: ' || cont.arrival_date || chr(10);
                        
                        IF (cont.departure_date > dataAtual AND flag = 0) THEN
                        
                            IF port_cargo_departure is NULL THEN
                        
                                ship_location_warehouse := warehouse_cargo_departure;
                                flag := 3;
                            
                            ELSE
                            
                                ship_location_port := port_cargo_departure;
                                flag := 4;
                            
                            END IF;
                            
                        ELSIF (cont.arrival_date > dataAtual AND flag = 0) THEN
                        
                            IF port_cargo_arrival is NOT NULL and port_cargo_departure is NOT NULL THEN
                                
                                ship_mmsi_final := ship_mmsi;
                                ship_name_final := ship_name;
                                flag := 2;
                            
                            ELSE
                            
                                truck_id_final := truck_id;
                                flag := 5;
                            
                        END IF;
                        
                    END IF;
                    
                    END IF;
                    
                    SELECT cml.port_id into first_port_check FROM cargo_manifest_load cml
                    WHERE cml.id = cargo_load_id_main;
                    
                    IF (port_cargo_arrival is NOT NULL AND port_cargo_departure is NOT NULL) OR (port_cargo_arrival is NOT NULL AND port_cargo_first is NOT NULL) THEN
                    
                        output:=output || 'Done by ship' || chr(10);
                    ELSE 
                    
                        output:=output || 'Done by truck' || chr(10);
                    
                    END IF;
                
                    IF flag = 0 THEN
                    
                        IF port_cargo_departure is NULL THEN
                        
                                ship_location_warehouse := warehouse_cargo_departure;
                                flag2 := 1;
                            
                        ELSE
                            
                            ship_location_port := port_cargo_departure;
                            flag2 := 2;
                            
                        END IF;
                            
                    END IF;
                
                    IF cont.port_id is NULL then
                    
                        select w.name into warehouse_cargo_departure from warehouse w
                        WHERE cont.warehouse_id = w.id;    
                    
                    ELSE
                    
                        select p.name into port_cargo_departure from port p
                        WHERE cont.port_id = p.id;
                        
                    END IF;
                    
                
                end loop;

            end loop;
            
            output:=output || chr(10);
            
            IF flag = 3 THEN
                
                output:=output || 'Container is currently located in: ' || ship_location_warehouse || chr(10);
                
            ELSIF flag = 4 THEN
                
               output:=output || 'Container is currently located in: ' || ship_location_port || chr(10);
            
            ELSIF flag = 2 THEN
                
                output:=output || 'Container is currently located on a Ship' || chr(10);
                output:=output || 'Ship mmsi:' || ship_mmsi_final || chr(10);
                output:=output || 'Ship name:' || ship_name_final || chr(10);
            
            ELSIF flag = 5 THEN
                
                output:=output || 'Container is currently located on a Truck' || chr(10);
                output:=output || 'Ship mmsi:' || truck_id_final || chr(10);
                
            ELSIF flag2 = 1 THEN
                
                output:=output || 'Container is currently located in: ' || ship_location_port || chr(10);
        
            ELSIF flag = 2 THEN
                
                output:=output || 'Container is currently located in: ' || ship_location_port || chr(10);
            
            END IF;
            
        
            close c;

end;