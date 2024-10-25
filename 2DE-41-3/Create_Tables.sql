create table userrole(
id integer constraint nn_userrole_id not null,
designation varchar(255) constraint nn_designation not null,

constraint pk_userrole primary key (id)

);

create table usertable(
username varchar(255) constraint nn_username not null,
password varchar(255) constraint nn_password not null,
userroleid integer constraint nn_user_role_id not null,

constraint pk_user primary key (username),
constraint fk_user foreign key (userroleid) references userrole(id)
);

create table truck(
id integer constraint nn_truck_id not null,
userid_truckdriver varchar(255) constraint nn_truck_driver_username not null,

constraint pk_truck primary key (id),
constraint fk_truck foreign key (userid_truckdriver) references usertable(username)
);

create table ship(
mmsi varchar(9),
name varchar(255) constraint nn_ship_name not null,
imo varchar(255) constraint nn_ship_imo not null,
constraint un_ship_imo unique (imo),
num_energy_gen integer constraint nn_ship_num_energy_gen not null,
gen_pow_out integer constraint nn_ship_gen_pow_out not null,
callsign varchar(255) constraint un_ship_callsign unique
constraint nn_ship_callsign not null,
vessel varchar(255) constraint nn_ship_vessel not null,
length float constraint nn_ship_lenght not null,
width float constraint nn_ship_width not null,
cap int constraint nn_ship_cap not null,
cap_x int constraint nn_ship_cap_x not null,
cap_y int constraint nn_ship_cap_y not null,
cap_z int constraint nn_ship_cap_z not null,
draft float constraint nn_ship_draft not null,
userid_shipcaptain varchar(255) constraint nn_userid_shipcaptain not null,

constraint pk_ship primary key (mmsi),
constraint fk_userid_shipcaptain foreign key (userid_shipcaptain) references usertable(username)
);


create table ship_positioning_data(
base_date_time timestamp constraint nn_ship_date_time not null,
latitude float constraint nn_ship_latitude not null,
longitude float constraint nn_ship_longitude not null,
sog float constraint nn_ship_sog not null,
cog float constraint nn_ship_cog not null,
ship_heading varchar(255) constraint nn_ship_heading not null,
ship_position varchar(255) constraint nn_ship_position not null,
transceiver_class varchar(255) constraint nn_ship_transceiver_class not null,
cargo varchar(255) not null,
ship_mmsi varchar(9) constraint nn_ship_mmsi not null,

constraint pf_ship_positioning_data primary key (base_date_time,ship_mmsi),
constraint fk_ship_positioning foreign key (ship_mmsi) references ship(mmsi),
constraint ck_ship_latitude_lower check (latitude>=-90),
constraint ck_ship_latitude_higher check (latitude<=90),
constraint ck_ship_longitude_lower check (longitude>=-180),
constraint ck_ship_longitude_higher check (longitude<=180),
constraint ck_ship_cog_lower check (cog>=0),
constraint ck_ship_cog_higher check (cog<=359)
--constraint ck_ship_heading_lower check (ship_heading>=0),--
--constraint ck_ship_heading_higher check (ship_heading<=359)--
);


create table container(
id integer constraint nn_cont_id not null,
check_digit integer constraint nn_check_digit not null,
iso varchar(255) constraint nn_cont_iso not null,
weight float constraint nn_cont_weight not null,
max_weight float constraint nn_cont_max_weight not null,
max_weight_incl float constraint nn_cont_weight_incl not null,
max_volume float constraint nn_cont_max_volume not null,
refrigerated integer constraint nn_cont_refrigerated not null,
certificate varchar(255) constraint nn_cont_certificate not null,
repairRecommendation varchar(255) constraint nn_cont_repair not null,

constraint pk_container primary key (id),
constraint ck_weight check (weight>0),
constraint ck_max_weight check (max_weight>0),
constraint ck_max_weight_incl_sup_package_and_container check (max_weight_incl>= weight + max_weight),
constraint ck_max_weight_incl check (max_weight_incl>0),
constraint ck_max_volume check (max_volume>0)
);


create table country(
name varchar(255) constraint nn_country_name not null,
continent varchar(255) constraint nn_country_continent not null,
alpha2_code varchar(2) constraint nn_country_alpha2 not null,
alpha3_code varchar(3) constraint nn_country_alpha3 not null,
population float constraint nn_country_population not null,
capital varchar(255) constraint nn_country_capital not null,
latitude float constraint nn_country_latitude not null,
longitude float constraint nn_country_longitude not null,

constraint pk_country primary key (name)
);

create table border(
countryName1 varchar(255) constraint nn_country_countryName1 not null,
countryName2 varchar(255) constraint nn_country_countryName2 not null,

constraint pk_border primary key (countryName1, countryName2),
constraint fk_border_1 foreign key(countryName1) references country(name),
constraint fk_border_2 foreign key(countryName2) references country(name)
);


create table location(
latitude float constraint nn_location_latitude not null,
longitude float constraint nn_location_longitude not null,
country_name references country(name) constraint nn_location_country_name not null,

constraint pk_location primary key (latitude,longitude)
);


create table port(
id varchar(6) constraint nn_port_id not null,
name varchar(255) constraint nn_port_name not null,
location_latitude float constraint nn_port_latitude not null,
location_longitude float constraint nn_port_longitude not null,

constraint pk_port primary key (id),
constraint fk_port foreign key(location_latitude, location_longitude) references location(latitude,longitude)
);

create table seadist(
from_Portid varchar(6) constraint nn_from_port_id not null,
to_Portid varchar(6) constraint nn_to_port_id not null,
from_Countryname varchar(255) constraint nn_from_country_name not null,
to_Countryname varchar(255) constraint nn_to_country_name not null,
from_Port varchar(255) constraint nn_from_port not null,
to_Port varchar(255) constraint nn_to_port not null,
sea_distance integer constraint nn_sea_distance not null,

constraint pk_seadist primary key (from_Portid,to_Portid),
constraint fk_seadist1 foreign key (from_Countryname) references country(name),
constraint fk_seadist2 foreign key (to_Countryname) references country(name),
constraint fk_seadist3 foreign key (from_Portid) references port(id),
constraint fk_seadist4 foreign key (to_Portid) references port(id),
constraint ck_sea_distance check (sea_distance>0)
);


create table warehouse(
id varchar(255) constraint nn_warehouse_id not null,
name varchar(255) constraint nn_warehouse_name not null,
location_latitude float constraint nn_warehouse_latitude not null,
location_longitude float constraint nn_warehouse_longitude not null,
capacity integer constraint nn_warehouse_capacity not null,

constraint pk_warehouse primary key (id),
constraint fk_warehouse foreign key(location_latitude, location_longitude) references location(latitude,longitude)
);


create table cargo_manifest_load(
id integer constraint nn_cargo_load_id not null,
ship_mmsi varchar(9) constraint nn_cargo_manifest_load_ship_mmsi null,
port_id varchar(255) constraint nn_cargo_manifest_load_port_id null,
status integer constraint nn_cargo_load_status not null,
warehouse_id varchar(255) constraint nn_cargo_manifest_load_warehouse_id null,
truck_id integer constraint nn_cargo_manifest_load_truck_id null,

constraint pk_cargo_manifest_load primary key (id),
constraint fk_cargo_manifest_load foreign key (ship_mmsi) references ship(mmsi),
constraint fk_cargo_manifest_load2 foreign key (port_id) references port(id),
constraint fk_cargo_manifest_load3 foreign key (warehouse_id) references warehouse(id),
constraint fk_cargo_manifest_load4 foreign key (truck_id) references truck(id),
constraint ck_cml_port_id check (warehouse_id = null and port_id != null),
constraint ck_cml_warehouse_id check (port_id = null and warehouse_id != null),
constraint ck_cml_ship_id check (ship_mmsi = null and truck_id != null),
constraint ck_cml_truck_id check (truck_id = null and ship_mmsi != null)
);


create table stage(
id integer constraint nn_stage_id not null,
cargo_load_id integer constraint nn_stage_cargo_load_id not null,
departure_date timestamp constraint nn_stage_departure_date not null,
arrival_date timestamp constraint nn_stage_arrival_date not null,
port_id varchar(5) constraint nn_stage_port_id null,
warehouse_id varchar(255) constraint nn_stage_warehouse_id null,

constraint pk_stage primary key (id, cargo_load_id),
constraint fk_stage foreign key (cargo_load_id) references cargo_manifest_load(id),
constraint fk_stage2 foreign key (port_id) references port(id),
constraint ck_stage_port_id check (warehouse_id = null and port_id != null),
constraint ck_stage_warehouse_id check (port_id = null and warehouse_id != null)
);


create table cargo_manifest_unload(

cargo_unload_id integer constraint nn_cargo_manifest_unload_stage_cargo_load_id not null,
stage_id integer constraint nn_cargo_manifest_unload_stage_id not null,
port_id varchar(5) constraint nn_cargo_manifest_unload_port_id null,
warehouse_id varchar(255) constraint nn_cargo_warehouse_id null,

constraint pk_cargo_unload primary key (cargo_unload_id, stage_id),
constraint fk_cargo_manifest_unload foreign key (cargo_unload_id, stage_id) references stage(cargo_load_id,id),
constraint fk_cargo_manifest_unload2 foreign key (port_id) references port(id),
constraint fk_cargo_manifest_unload3 foreign key (warehouse_id) references warehouse(id),
constraint ck_cmu_port_id check (warehouse_id = null and port_id != null),
constraint ck_cmu_warehouse_id check (port_id = null and warehouse_id != null)
);


create table container_cargoManifest(
container_x integer constraint nn_cont_cargo_x not null,
container_y integer constraint nn_cont_cargo_y not null,
container_z integer constraint nn_cont_cargo_z not null,
container_weight float constraint nn_cont_cargo_weight not null,
container_id integer not null,
stage_id integer not null,
cargo_manifest_id integer constraint nn_cont_cargo_id not null,
userid_client varchar(255) constraint nn_userid_client not null,

constraint pk_cont_cargo primary key (container_id, cargo_manifest_id, stage_id),
constraint fk_cont_cargo foreign key (cargo_manifest_id) references cargo_manifest_load(id),
constraint fk_cont_cargo2 foreign key (cargo_manifest_id,stage_id) references stage(cargo_load_id,id),
constraint fk_cont_cargo3 foreign key (container_id) references container(id),
constraint fk_cont_cargo4 foreign key (userid_client) references usertable(username),
constraint ck_cont_cargo_x check (container_x>=0),
constraint ck_cont_cargo_y check (container_y>=0)
);

create table audittrail(

containerid integer constraint nn_audittrail_container_id not null,
cargomanifestloadid integer constraint nn_audittrail_cargo_manifest_load_id not null,
typeofoperation varchar(255) constraint nn_audittrail_type_of_operation not null,
audit_date timestamp constraint nn_audittrail_date not null,
userid varchar(255) constraint nn_audittrail_userid not null,

constraint pk_audit_trail primary key (containerid, cargomanifestloadid, userid),
constraint fk_audit_trail foreign key (containerid) references container(id),
constraint fk_audit_trail2 foreign key (cargomanifestloadid) references cargo_manifest_load(id),
constraint fk_audit_trail3 foreign key (userid) references usertable(username)
);