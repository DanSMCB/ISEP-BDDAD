create or replace NONEDITIONABLE PROCEDURE US406 (inmmsi in Varchar, limite in FLOAT, output out Varchar)

IS
    stages stage.id%type;      -- Declaração de variáveis
    cargo_loads stage.cargo_load_id%type;
    avgcontainer FLOAT;
    contcontainer integer;
    shipcap ship.cap%type;
    first_port port.name%type;
    arrival_port port.name%type;
    old_port port.name%type;
    dataAtual timestamp;

    cursor c is 
    SELECT DISTINCT s.id, cml.id FROM ship ship, container_cargoManifest ccm, cargo_manifest_load cml, stage s     -- Cursor que percorre todas as stages por ordem de cargo manifest
    WHERE ccm.cargo_manifest_id=cml.id AND cml.ship_mmsi = inmmsi AND cml.id=s.cargo_load_id order by cml.id asc, s.id;

BEGIN
    
    output:=output || '-- Ship voyages with occupancy rate below: ' || limite * 100.00 || '%' || '  --' || chr(10) || chr(10);    -- Primeiro output
    output:=output || '-- Ship: ' || inmmsi || '  --' || chr(10);
    
    SELECT TO_TIMESTAMP(SYSDATE, 'YY-MM-DD HH24:MI:SS') into dataAtual FROM DUAL;    -- Obtendo a data atual
    
    open c;     
    
    loop
        fetch c into stages, cargo_loads;
        exit when c%notfound;

        for cont in (select id, departure_date, arrival_date, cargo_load_id, port_id from stage where id = stages and cargo_load_id = cargo_loads) loop
            
            IF cont.id = 1 THEN   -- Se a stage analisada for a primeira, significa que o porto que ela partiu está localizado na manifest que contém a stage
            
                SELECT DISTINCT p.name into first_port from cargo_manifest_load cml, port p   -- Colocando o primeiro porto de toda a manifest na variável first_port
                where cml.id = cargo_loads AND cml.port_id = p.id;
                
            END IF;
                
            SELECT COUNT(*) into contcontainer from container_cargoManifest ccm   -- Obtendo a contagem de contaienrs da stage e colocando na variável cont container
            WHERE ccm.stage_id = stages AND ccm.cargo_manifest_id = cargo_loads;
                
            SELECT DISTINCT s.cap into shipcap from ship s, container_cargoManifest ccm, cargo_manifest_load cml   -- Obtendo a capacidade do navio da stage
            WHERE s.mmsi = inmmsi AND ccm.stage_id = stages AND ccm.cargo_manifest_id = cargo_loads;

            SELECT CAST(contcontainer as decimal(10,2)) / CAST(shipcap as decimal(10,2)) into avgcontainer from dual;   -- Colocamos a divisão de containers pela capadidade do navio na variável avgcontainer
            
            SELECT port.name into arrival_port from port    -- Obter o porto de chegada e colocar na variável arrival_port
            where cont.port_id = port.id;
            
            IF avgcontainer <= limite AND cont.departure_date < dataAtual AND cont.arrival_date < dataAtual THEN    -- Verificar se a média de ocupação de containers da stage (viagem) está dentro do limite, e verificar se ambas as datas da stage são menores que a data atual
                
                IF cont.id = 1 THEN    -- Se for a primeira stage, o porto de departure encontra-se no first_port
                    
                    output:=output || chr(10);
                    output:=output || 'Departure: ' || first_port || chr(10);
                    output:=output || 'Departure date: ' || cont.departure_date || chr(10);
                    output:=output || 'Arrival: ' || arrival_port || chr(10);
                    output:=output || 'Arrival date: ' || cont.arrival_date || chr(10);
                    output:=output || 'Occupancy rate of the trip: ' || avgcontainer * 100.00 || '%' || chr(10);
                    
                ELSE    -- Se não for a primeira stage, o porto de departure encontra-se na old_port (porto da stage antiga)
                
                    output:=output || chr(10);
                    output:=output || 'Departure: ' || old_port || chr(10);
                    output:=output || 'Departure date: ' || cont.departure_date || chr(10);
                    output:=output || 'Arrival: ' || arrival_port || chr(10);
                    output:=output || 'Arrival date: ' || cont.arrival_date || chr(10);
                    output:=output || 'Occupancy rate of the trip: ' || avgcontainer * 100.00 || '%' || chr(10);
                
                END IF;
                
            END IF;
            
            SELECT DISTINCT p.name into old_port from cargo_manifest_load cml, port p, stage s    -- No fim de cada loop, é inserido no old_port um porto, que fica como porto da stage antiga (considerado como departure port da atual stage)
            where s.cargo_load_id = cargo_loads AND s.id = stages AND s.port_id = p.id;
            
        end loop;
    
    end loop;
    
    close c;
    
END US406;