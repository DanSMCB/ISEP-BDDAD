create or replace PROCEDURE US210 (output out Varchar)
IS   
   unloadCounter integer :=0;
    varCount integer :=0;
    flag integer :=0;
    flag2 integer :=0;
    stageCounter integer :=0;
    totalcap ship.cap%type;
    ocprate float;
    ships ship.mmsi%type;
    cargoId integer;
    cargoCount integer;
    nextMonday date;
    stageCounterNextMonday integer;
    lat float;
    longi float;
    arrival timestamp;
    maxDate timestamp;
    pportId integer;
    finalPort integer;
    nnname varchar(255);
    
    cursor c1 is 
    select mmsi from ship;
    
    Cursor c2 is
    select id from cargo_manifest_load
    where ship_mmsi = ships; 
begin 
    
    SELECT NEXT_DAY(sysdate,'SEGUNDA') INTO nextMonday FROM dual;
        nextMonday := TO_TIMESTAMP('22.02.22 18:44:33', 'dd/mm/yy hh24:mi:ss');
        open c1;     
                loop
                    fetch c1 into ships;
                    exit when c1%notfound;
                    flag := 0;
                    flag2 := 0;
                    varCount := 0;
                    open c2;
                        loop
                            fetch c2 into cargoId;
                            exit when c2%notfound;
                                flag := 1;
                                select count(*) into stageCounter from stage 
                                where stage.cargo_load_id = cargoId;
                                
                                select count(*) into stageCounterNextMonday from stage 
                                where stage.cargo_load_id = cargoId
                                AND stage.arrival_date < nextMonday;
                                
                                dbms_output.put_line(stageCounter || ' in Port: ' || stageCounterNextMonday);
                                
                                IF (stageCounter = stageCounterNextMonday) THEN
                                    select arrival_date, port_id into arrival, pportId
                                    from stage where stage.cargo_load_id = cargoId
                                    AND stage.id = stageCounterNextMonday;
                                    dbms_output.put_line(pportId || 'AAAAAAA');
                                    IF varCount = 0 THEN
                                        finalPort := pportId;
                                        maxDate := arrival;
                                    ELSE IF (arrival > maxDate AND varCount > 0) THEN
                                        dbms_output.put_line(cargoId || 'ola');
                                        finalPort := pportId;
                                        maxDate := arrival;
                                    END IF;
                                    END IF;
                                    flag2 := flag2 + 1;
                                END IF;
                                varCount := varCount + 1;
                        end loop;
                        close c2;
                        select count(id) into cargoCount from cargo_manifest_load where ship_mmsi = ships;
                        IF flag = 0 THEN
                            select latitude, longitude into lat, longi
                            from ship_positioning_data
                            where base_date_time = (select max(base_date_time) from ship_positioning_data where ship_mmsi = ships);
                            output := output || 'Ship: ' || ships || 'in Position: ' || lat || ';' || longi || chr(10);
                        ELSE IF flag2 = cargoCount THEN
                            dbms_output.put_line(finalPort || 'OALOLOLKO');
                            select name into nnname from port
                            where id = finalPort;
                            dbms_output.put_line('Ship: ' || ships || 'in Port: ' || nnname);
                            output := output || 'Ship: ' || ships || 'in Port: ' || nnname || chr(10);
                        END IF;
                        END IF;
        end loop;
        close c1;
    
end;