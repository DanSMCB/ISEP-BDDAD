create or replace NONEDITIONABLE PROCEDURE US310(in_port_id in Varchar, month_date in INTEGER, year_date in INTEGER, output out Varchar)
IS
    port_capacity port.docking_capacity%type;
    cml_var cargo_manifest_load%rowtype;
    departure stage.departure_date%type;
    departure2 stage.departure_date%type;
    month_var integer;
    year_var integer;
    port_occupancy port.docking_occupancy%type;
    warehouse_occupancy warehouse.occupancy%type;
    warehouse_capacity warehouse.capacity%type;
    port_occupancy_rate number(5,3);
    warehouse_occupancy_rate number(5,3);
    num_cont integer;

cursor c1 is
select * from cargo_manifest_load where cargo_manifest_load.port_id = in_port_id;


BEGIN
select docking_capacity, docking_occupancy into port_capacity, port_occupancy
from port
where id = in_port_id;

output := output || 'Port: ' || in_port_id || chr(10);

open c1;
loop

fetch c1 into cml_var;
        exit when c1%notfound;

select departure_date into departure
from stage
         inner join cargo_manifest_load on cargo_manifest_load.id = stage.cargo_load_id where cargo_manifest_load.id = cml_var.id AND stage.id = 1;

select extract(MONTH from departure), extract(YEAR from departure) into month_var, year_var from dual;

IF (month_var = month_date AND year_var = year_date) then
            port_occupancy := port_occupancy - 1;
            port_occupancy_rate := (port_occupancy)/port_capacity;
output := output || 'Date: ' || departure || chr(10) || 'Occupancy rate: ' || port_occupancy_rate || chr(10);
END IF;
end loop;
close c1;
for cont in (select departure_date, arrival_date from stage where stage.port_id = in_port_id order by arrival_date asc)
    loop
select extract(MONTH from cont.arrival_date), extract(YEAR from cont.arrival_date) into month_var, year_var from dual;
IF (month_var = month_date AND year_var = year_date) then
            port_occupancy := port_occupancy + 1;
            port_occupancy_rate := (port_occupancy)/port_capacity;
output := output || 'Date: ' || cont.arrival_date || chr(10) || 'Occupancy rate: ' || port_occupancy_rate || chr(10);
END IF;
end loop;

for i in (select * from warehouse where warehouse.port_id = in_port_id)
    loop
        warehouse_occupancy := i.occupancy;
        warehouse_capacity := i.capacity;
output := output || chr(10);
output := output || 'Warehouse: ' || i.id || chr(10);

for cml in (select * from cargo_manifest_load where cargo_manifest_load.warehouse_id = i.id)
        loop

select departure_date into departure
from stage
         inner join cargo_manifest_load on cargo_manifest_load.id = stage.cargo_load_id where cargo_manifest_load.id = cml.id AND stage.id = 1;

select extract(MONTH from departure), extract(YEAR from departure) into month_var, year_var from dual;

IF (month_var = month_date AND year_var = year_date) then
select count(*) into num_cont from container_cargoManifest where container_cargoManifest.cargo_manifest_id = cml.id AND container_cargoManifest.stage_id = 1;
warehouse_occupancy := warehouse_occupancy - num_cont;
                warehouse_occupancy_rate := warehouse_occupancy/warehouse_capacity;
output := output || 'Date: ' || departure || chr(10) || 'Occupancy rate: ' || warehouse_occupancy_rate || chr(10);
END IF;

end loop;

for cont in (select departure_date, arrival_date from stage where stage.warehouse_id = i.id order by arrival_date asc)
        loop
select extract(MONTH from cont.arrival_date), extract(YEAR from cont.arrival_date) into month_var, year_var from dual;
IF (month_var = month_date AND year_var = year_date) then
                warehouse_occupancy := warehouse_occupancy + num_cont;
                warehouse_occupancy_rate := warehouse_occupancy/warehouse_capacity;
output := output || 'Date: ' || departure || chr(10) || 'Occupancy rate: ' || warehouse_occupancy_rate || chr(10);
END IF;
end loop;

end loop;


END US310;