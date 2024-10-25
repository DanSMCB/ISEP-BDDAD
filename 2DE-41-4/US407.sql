create or replace NONEDITIONABLE PROCEDURE US407 (inport in Integer, output out Varchar)

IS
    stages stage.id%type;      -- Declaração de variáveis
    cargo_loads stage.cargo_load_id%type;
    cargoantigo stage.cargo_load_id%type;
    refrigerated Varchar(255);
    oldportcml cargo_manifest_load.port_id%type;
    oldportstage stage.port_id%type;
    somadias integer := 1;
    counttotal integer;
    contcontainer integer;
    portname port.name%type;
    nextMonday date;
    warehousename warehouse.name%type;
    nextport stage.port_id%type;
    nextwarehouse stage.warehouse_id%type;
    truckid cargo_manifest_load.truck_id%type;
    shipmmsi cargo_manifest_load.ship_mmsi%type;
    cargoport cargo_manifest_load.port_id%type;
    flag integer := 0;

    cursor c is 
    SELECT DISTINCT s.id, cml.id FROM ship ship, container_cargoManifest ccm, cargo_manifest_load cml, stage s     -- Cursor que percorre todas as stages por ordem de cargo manifest
    WHERE ccm.cargo_manifest_id=cml.id AND cml.id=s.cargo_load_id order by cml.id asc, s.id;
    
BEGIN
    
    SELECT to_timestamp(NEXT_DAY(sysdate,'SEGUNDA')) INTO nextMonday FROM dual;     -- Obtendo a segunda feira da próxima semana
    nextMonday := TO_TIMESTAMP('31.01.22 00:00:00', 'dd/mm/yy hh24:mi:ss');

    output:=output || '---   Movement next week of the Port: ' || inport || '   ---' || chr(10) || chr(10);    -- Output de início

    loop
        
        counttotal := 0;   -- counttotal é a variavel usada para verificar se houve trabalho nesse dia da semana
        
        CASE somadias    -- No final de analisar cada dia, é adicionado +1 à soma dias, podemos assim saber em que dia da semana estamos a analisar
                    
            WHEN 1 THEN output:=output || chr(10)  || '---    Monday   ---' || chr(10);
            WHEN 2 THEN output:=output || chr(10)  || '---    Tuesday   ---' || chr(10);
            WHEN 3 THEN output:=output || chr(10)  || '---    Wednesday   ---' || chr(10);
            WHEN 4 THEN output:=output || chr(10)  || '---   Thursday   ---' || chr(10);
            WHEN 5 THEN output:=output || chr(10)  || '---   Friday   ---' || chr(10);
            WHEN 6 THEN output:=output || chr(10)  || '---   Saturday   ---' || chr(10);
            WHEN 7 THEN output:=output || chr(10)  || '---   Sunday   ---' || chr(10);
            WHEN 8 THEN EXIT;

        END CASE;
        
        open c;  

        loop
            
            fetch c into stages, cargo_loads;
            exit when c%notfound;

            for cont in (select id, departure_date, arrival_date, cargo_load_id, warehouse_id, port_id from stage where id = stages and cargo_load_id = cargo_loads) loop
            
                IF cont.id = 1 THEN    -- Se a stage for a primeira, o departure port vai se localizar na manifest que engloba as stages
                    
                    SELECT DISTINCT cml.port_id INTO oldportcml FROM cargo_manifest_load cml
                    WHERE cont.cargo_load_id = cargo_loads and cml.id = cargo_loads;
                
                ELSE     -- Caso não seja a primeira stage, o departure port vai estar na stage antiga (stage.id - 1)
                
                    SELECT DISTINCT s.port_id INTO oldportstage FROM stage s
                    WHERE s.id = (cont.id - 1) AND s.cargo_load_id = cargo_loads;
                
                END IF;

                IF CAST(cont.arrival_date as DATE) = nextMonday and cont.port_id = inport THEN    -- Se a arrival date for igual ao dia analisado e o port ser o port analisado (Unload)
                
                    counttotal := 1;  -- É detetado um dia com trabalho
                 
                    SELECT COUNT(*) into contcontainer from container_cargoManifest ccm    -- Obtendo a contagem de contaienrs da stage e colocando na variável contcontainer
                    WHERE ccm.stage_id = stages AND ccm.cargo_manifest_id = cargo_loads;
                    
                    output:=output || chr(10) || 'Manifest: ' || cont.cargo_load_id || chr(10) || chr(10);     -- Output indicando o id da manifest
                    output:=output || 'Containers to be unloaded:' || contcontainer || chr(10) || chr(10);     -- Output quantidade de containers

                    for cont in (select id, weight, max_weight, refrigerated from container co, container_cargomanifest ccm where stage_id = stages and cargo_manifest_id = cargo_loads and ccm.container_id = co.id) loop
                        
                            IF cont.refrigerated = 0 THEN    -- Devido ao atributo refrigerated ser 0 ou 1
                            
                                refrigerated := 'No';
                            
                            ELSE
                            
                                refrigerated := 'Yes';
                                
                            END IF;
                            
                            output:=output || 'Container id: ' || cont.id || chr(10) || 'Container weight: ' || cont.weight || chr(10) || 'Container max weight: ' || cont.max_weight || chr(10) || 'Container refrigerated: ' || refrigerated || chr(10) || chr(10);   -- Output com todos os dados dos containers
                        
                    end loop;
                    
                    SELECT cml.ship_mmsi into cargoport FROM cargo_manifest_load cml   -- Obtendo o navio da manifest 
                    WHERE cml.id = cargo_loads;
                        
                    IF cargoport IS NULL THEN   -- Se o navio for null, significa que a viagem foi feita de truck
                            
                        SELECT cml.truck_id into truckid FROM cargo_manifest_load cml  -- Obtendo o truck id do truck que fará o unload
                        WHERE cml.id = cargo_loads;
                            
                        output:=output || 'This containers will be unloaded by the Truck: ' || truckid || '.' || chr(10) || chr(10);  -- Output do truck
                        
                    ELSE   -- Se o navio não for null, significa que a viagem foi feita de navio
                        
                        SELECT cml.ship_mmsi into shipmmsi FROM cargo_manifest_load cml  -- Obtendo o id do navio que fará o unload
                        WHERE cml.id = cargo_loads;
                            
                        output:=output || 'This containers will be unloaded by the Ship: ' || shipmmsi || '.' || chr(10)|| chr(10);  -- Output do navio
                        
                        for cont in (select ccm.container_id, ccm.container_x, ccm.container_y, ccm.container_z from container_cargomanifest ccm where stage_id = stages and cargo_manifest_id = cargo_loads) loop
                        
                            output:=output || 'The container ' || cont.container_id || ' is located on x: ' || cont.container_x || '   y: ' || cont.container_y || '   z: ' || cont.container_z || chr(10);   -- Output de todas as posições dos containers a ser unload
                        
                        end loop;
                        
                        output:=output ||  chr(10);   -- Output de linhas de modo ao output ser mais apresentável
                        
                    END IF;
                
                ELSIF CAST(cont.departure_date as DATE) = nextMonday and (oldportstage = inport or oldportcml = inport)  THEN   -- Se a departure date for igual ao dia analisado e o port ser o port analisado na stage anterior (Load)
                
                    counttotal := 1;   -- É detetado um dia com trabalho
                    
                    SELECT COUNT(*) into contcontainer from container_cargoManifest ccm    -- Obtendo a contagem de contaienrs da stage e colocando na variável contcontainer
                    WHERE ccm.stage_id = stages AND ccm.cargo_manifest_id = cargo_loads;
                    
                    output:=output || chr(10) || 'Manifest: ' || cont.cargo_load_id || chr(10);    -- Output indicando o id da manifest
                    output:=output || chr(10) || 'Containers to be loaded:' || contcontainer || chr(10) || chr(10);     -- Output quantidade de containers
                    
                    for cont in (select id, weight, max_weight, refrigerated from container co, container_cargomanifest ccm where stage_id = stages and cargo_manifest_id = cargo_loads and ccm.container_id = co.id) loop
                            
                            IF cont.refrigerated = 0 THEN   -- Devido ao atributo refrigerated ser 0 ou 1
                            
                                refrigerated := 'No';
                            
                            ELSE
                            
                                refrigerated := 'Yes';
                                
                            END IF;
                            
                            output:=output || 'Container id: ' || cont.id || chr(10) || 'Container weight: ' || cont.weight || chr(10) || 'Container max weight: ' || cont.max_weight || chr(10) || 'Container refrigerated: ' || refrigerated || chr(10) || chr(10);    -- Output com todos os dados dos containers
                        
                    end loop;
                    
                    SELECT cml.ship_mmsi into cargoport FROM cargo_manifest_load cml    -- Obtendo o navio da manifest
                    WHERE cml.id = cargo_loads;
                    
                    IF cargoport IS NULL THEN    -- Se o navio for null, significa que a viagem foi feita de truck
                            
                        SELECT cml.truck_id into truckid FROM cargo_manifest_load cml    -- Obtendo o truck id do truck que fará o load
                        WHERE cml.id = cargo_loads;
                            
                        output:=output || 'This containers will be loaded on the Truck: ' || truckid || '.' || chr(10) || chr(10);    -- Output do truck
                        
                    ELSE    -- Se o navio não for null, significa que a viagem foi feita de navio
                        
                        SELECT cml.ship_mmsi into shipmmsi FROM cargo_manifest_load cml   -- Obtendo o id do navio que fará o load
                        WHERE cml.id = cargo_loads; 
                            
                        output:=output || chr(10) || 'This containers will be loaded on the Ship: ' || shipmmsi || '.' || chr(10) || chr(10);    -- Output do navio
                    
                        for cont in (select ccm.container_id, ccm.container_x, ccm.container_y, ccm.container_z from container_cargomanifest ccm where stage_id = stages and cargo_manifest_id = cargo_loads) loop
                        
                            output:=output || 'The container ' || cont.container_id || ' is requested to be deployed on x: ' || cont.container_x || '   y: ' || cont.container_y || '   z: ' || cont.container_z || chr(10);   -- Output de todas as posições dos containers a ser unload
                        
                        end loop;
                        
                        output:=output || chr(10);   -- Output de linhas de modo ao output ser mais apresentável
                        
                    END IF;
                
                    SELECT distinct s.port_id into nextport from stage s, cargo_manifest_load cml    -- Obtendo o porto da próxima etapa do barco
                    WHERE s.id = (cont.id) and s.cargo_load_id = cargo_loads;
                         
                    SELECT distinct s.warehouse_id into nextwarehouse from stage s, cargo_manifest_load cml    -- Obtendo a warehouse da próxima etapa do truck
                    WHERE s.id = (cont.id) and s.cargo_load_id = cargo_loads;
                        
                    IF nextport IS NULL THEN    -- Caso o porto seja nulo, quer dizer que este dirige-se a uma warehouse
                            
                        SELECT w.name INTO warehousename FROM warehouse w   -- Obtendo o nome da warehouse
                        WHERE w.id = nextwarehouse;
                            
                        output:=output || 'Next destination: ' || warehousename || '.' || chr(10) || chr(10);    -- Output da próxima etapa (warehouse)
                        
                    ELSE    -- Caso o porto não seja nulo, quer dizer que este dirige-se a um porto
                            
                        SELECT p.name INTO portname FROM port p     -- Obtendo o nome do port
                        WHERE p.id = nextport;
                            
                        output:=output || 'Next destination: ' || portname || '.' || chr(10) || chr(10);    -- Output da próxima etapa (port)
                        
                    END IF;
            
                END IF;
                
            end loop;
    
        end loop;
        
        close c;
        
        IF counttotal = 0 THEN    -- Se não houve dias de trabalho
        
            counttotal := 1;
            output:=output || chr(10) || 'No work registered this day.' || chr(10) || chr(10);   -- Output para caso não tenha sido registado trabalho nesse dia
        
        END IF;
        
        somadias := somadias + 1;   -- Somando os dias
        
        SELECT nextMonday + 1 INTO nextMonday FROM dual;    -- Aumentando um dia ao nextMonday (data a ser analisada)

    end loop;
    
END US407;