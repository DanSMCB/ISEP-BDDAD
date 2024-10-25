create or replace NONEDITIONABLE PROCEDURE US404 (output out Varchar)

IS
    stages stage.id%type;         -- Declaração de variáveis
    cargo_loads stage.cargo_load_id%type;
    ship_mmsi ship.mmsi%type;
    departure_year integer;
    arrival_year integer;
    inyear integer;
    dataAtual timestamp;
    days integer;
    finaldays integer := 0;
    cargoloadantigo cargo_manifest_load.id%type;
    shipantigo ship.mmsi%type;
    
    cursor c is 
    SELECT DISTINCT s.id, cml.id, ship.mmsi FROM Ship ship, cargo_manifest_load cml, stage s      -- Cursor que percorre todas as stages por ordem de barco da manifest
    WHERE ship.mmsi = cml.ship_mmsi AND cml.id = s.cargo_load_id order by ship.mmsi asc, cml.id, s.id;             

BEGIN
    
    SELECT CAST(SYSDATE AS DATE) into dataAtual FROM DUAL;
    select extract (YEAR FROM dataAtual) into inyear FROM dual;   -- Obter o ano atual e colocar na variável inyear
    
    output:=output || '--  Idling of ships in ' || inyear || '  --' || chr(10) || chr(10);     -- Output de início
    
    open c;     
            
    loop
        fetch c into stages, cargo_loads, ship_mmsi;
        exit when c%notfound;

        for cont in (select id, departure_date, arrival_date from stage where id = stages and cargo_load_id = cargo_loads) loop
            
            IF shipantigo != ship_mmsi THEN     -- Devido ao cursor ordenar por ship_mmsi, ao mudar o barco significa que este já somou todos os dias ocupados
                
                finaldays := 365 - finaldays;     -- Obtendo os dias livres do barco
                output := output || 'Idle days of ship ' || shipantigo || ' : ' || finaldays || chr(10) || chr(10);    -- Output dias livres de cada barco
            
                finaldays := 0;     -- Reiniciar os dias ativos
                shipantigo := ship_mmsi;
                
            END IF;   
                
            select extract(YEAR from cont.departure_date) into departure_year from dual;     -- Obter o ano da departure date da stage e colocar na variavel departure_year
            select extract(YEAR from cont.arrival_date) into arrival_year from dual;     -- Obter o ano da arrival date da stage e colocar na variavel arrival_year

            IF departure_year = inyear AND arrival_year = inyear THEN      -- Se o ano da arrival year e do departure year coincidir com o inyear
                        
                SELECT CAST(cont.arrival_date AS DATE) - CAST(cont.departure_date AS DATE) into days FROM dual;
                    
            ELSIF departure_year = inyear-1 AND arrival_year = inyear THEN    -- Se o ano da arrival year coincidir com o inyear mas o departure year não
                        
                SELECT CAST(cont.arrival_date AS DATE) - CAST(inyear || '/01/01' AS DATE) into days FROM dual;
            
            ELSIF arrival_year = inyear+1 AND departure_year = inyear THEN    -- Se o ano da departure year coincidir com o inyear mas o arrival year não
                        
                SELECT CAST(inyear || '/12/31' AS DATE) - CAST(cont.departure_date AS DATE) into days FROM dual;
                
            ELSE
                
                days := 0;     -- Se o ano da departure year e o ano da arrival year não coincidirem com o inyear
            
            END IF;
            
            finaldays := finaldays + days;     -- Soma dos dias à variável finaldays, que indica todos os dias em que o barco esteve ocupado
             
            shipantigo := ship_mmsi;       -- Ship antigo fica igual ao ship atual (localizada no fim do ciclo)
            
        end loop;

    end loop;
    
    finaldays := 365 - finaldays;        -- Calculando os dias livres do barco
    output:=output || 'Idle days of ship ' || shipantigo || ' : ' || finaldays;        -- Último output, de modo a que o último barco do ciclo não escape
             
    close c;
    
END US404;