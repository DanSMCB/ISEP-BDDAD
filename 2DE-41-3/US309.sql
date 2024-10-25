create or replace NONEDITIONABLE TRIGGER US309
BEFORE INSERT ON cargo_manifest_load 
for each row


DECLARE

    currentDate TIMESTAMP;
    manifest INTEGER;
    flag BOOLEAN:=false;
    ship VARCHAR(9);

Cursor cml IS
    select cargo_manifest_load.id
    from cargo_manifest_load
    inner join ship on ship.mmsi = cargo_manifest_load.ship_mmsi
    Where status=1
    and ship.mmsi=:new.ship_mmsi;

BEGIN


select CURRENT_TIMESTAMP into currentDate from dual;

    open cml;
    Loop
        FETCH cml INTO manifest;
        EXIT WHEN cml%notfound;

        For i
        IN(SELECT departure_date, arrival_date
        FROM Stage
        Where cargo_load_id=manifest)
        LOOP
            IF currentDate > i.departure_date AND currentDate < i.arrival_date THEN

                flag:= true;


            END IF;
        END LOOP;
    END LOOP;
    close cml;

    IF flag = true THEN
        raise_application_error(-20000,'The ship assiciated to the cargo manifest is not available');
    END IF;

END US309;



insert into cargo_manifest_load (id, ship_mmsi, warehouse_id, status) 
values (5, '210950000', '63215', 1);

insert into stage(id, cargo_load_id, departure_date, arrival_date, warehouse_id) 
values (1, 5, '2022/01/02', '2022/01/10', '84932');

insert into cargo_manifest_load (id, ship_mmsi, warehouse_id, status) 
values (8, '210950000', '63215', 1);

insert into cargo_manifest_load (id, ship_mmsi, warehouse_id, status) 
values (9, '210950001', '63215', 1);
