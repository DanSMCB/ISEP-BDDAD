create or replace NONEDITIONABLE PROCEDURE US405 (inmmsi in Varchar, infirstdate in Varchar, inlastdate in Varchar, output out Varchar)

IS
    stages stage.id%type;     -- Declaração de variáveis
    cargo_loads stage.cargo_load_id%type;
    cargoantigo stage.cargo_load_id%type;
    stagecount integer := 0;
    media FLOAT;
    avgcontainer FLOAT;
    sumcontcontainer FLOAT := 0;
    contcontainer integer;
    shipcap ship.cap%type;
    flag integer := 0;

    cursor c is 
    SELECT DISTINCT s.id, cml.id FROM ship ship, container_cargoManifest ccm, cargo_manifest_load cml, stage s    -- Cursor que percorre todas as stages por ordem de cargo manifest
    WHERE ccm.cargo_manifest_id=cml.id AND cml.ship_mmsi = inmmsi AND cml.id=s.cargo_load_id order by cml.id asc, s.id;

BEGIN
    
    output:=output || '--  Average occupancy rate per manifest of ship ' || inmmsi || '  --' || chr(10) || chr(10);   -- Obter o ano atual e colocar na variável inyear

    open c;     
    
    loop
        fetch c into stages, cargo_loads;
        exit when c%notfound;

        for cont in (select id, departure_date, arrival_date, cargo_load_id from stage where id = stages and cargo_load_id = cargo_loads) loop
            
            IF cargoantigo != cargo_loads AND flag = 0 THEN    
                
                media := sumcontcontainer / stagecount;    -- A média é obtida pela divisão entre a soma de todas as médias de cada stage dividindo pela contagem de stages

                output:=output || 'Average occupancy rate of Manifest ' || cargoantigo || ' : ' || media * 100.00 || '%' || chr(10);   -- Output da média * 100 para dar a taxa
            
                cargoantigo := cargo_loads;    -- Stage count, sumcontcontainer reiniciadas e cargoantigo passa a ser igual ao cargo atual
                stagecount := 0;
                sumcontcontainer := 0;
                
            END IF;

            IF cont.departure_date >= infirstdate AND cont.arrival_date <= inlastdate THEN    -- Verificando se a departure date e a arrival date estão dentro dos limites
                
                SELECT COUNT(*) into contcontainer from container_cargoManifest ccm   -- Obtendo a contagem de contaienrs da stage e colocando na variável cont container
                WHERE ccm.stage_id = stages AND ccm.cargo_manifest_id = cargo_loads;
                
                SELECT DISTINCT s.cap into shipcap from ship s, container_cargoManifest ccm, cargo_manifest_load cml    -- Obtendo a capacidade do navio da stage
                WHERE s.mmsi = inmmsi AND ccm.stage_id = stages AND ccm.cargo_manifest_id = cargo_loads;
                
                IF contcontainer = 0 THEN     -- Se não existir nenhum container nessa stage, nada é adicionado á soma de containers final
                
                    sumcontcontainer := sumcontcontainer + contcontainer;
                    
                ELSE
                
                    SELECT CAST(contcontainer as decimal(10,2)) / CAST(shipcap as decimal(10,2)) into avgcontainer from dual;     -- Colocamos a divisão de containers pela capadidade do navio na variável avgcontainer
                    sumcontcontainer := sumcontcontainer + avgcontainer;    -- Adicionamos à soma de médias de stages (sumcontcontainer) o avgcontainer
                
                    flag := 0;    -- A flag torna-se 0 pois foram encontrados containers numa stage em que ambas as datas da stage estão dentro dos limites
                
                END IF;
                
                stagecount := stagecount + 1;    -- A stage count aumenta pois foi encontrada uma stage em que ambas as datas coincidem com os limites
                
            ELSE
                
                IF flag = 0 AND cont.id != 1 THEN    -- Se for detetada uma data fora dos limites entre as stages de um cargo manifest, significa que nesse cargo manifest mais nenhum conjunto de datas vai estar dentro dos limites
                
                    media := sumcontcontainer / stagecount;     -- A média é calculada dividindo a soma de todas as médias das stages pela contagem de stages, fazendo assim a média de toda a manifest

                    output:=output || 'Average occupancy rate of Manifest ' || cargoantigo || ' : ' || media * 100.00 || '%' || chr(10);  -- Output da media * 100 para dar a taxa
                
                END IF;
                
                flag := 1;    -- A flag a 1 significa que foi detetada uma data fora dos limites entre stages numa manifest. Como a flag vai estar a 1,
                              -- a flag só é possível voltar a 0 se for detetado duas datas entre os limites numa stage mas apenas em outra manifest
                
                
            END IF;
            
            cargoantigo := cargo_loads;  -- O cargo antigo é igual ao cargo_loads. Isto tem que ser feito no fim do ciclo para no início do mesmo podermos comparar se a manifest mudou
            
        end loop;
    
    end loop;
    
    IF flag = 0 THEN    -- Se a flag estivesse a 1, iria ser adicionado ao output duas vezes a mesma coisa. Este output encontra se no fim de modo a que a última taxa calculada não escape
                
        media := sumcontcontainer / stagecount;  -- Adicionamos à soma de médias de stages (sumcontcontainer) o avgcontainer

        output:=output || 'Average occupancy rate of Manifest ' || cargoantigo || ' : ' || media * 100.00 || '%' || chr(10);    -- Output da media * 100 para dar a taxa
                
    END IF;
    
    close c;
    
END US405;