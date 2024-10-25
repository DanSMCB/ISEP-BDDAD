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
cap float constraint nn_ship_cap not null,
draft float constraint nn_ship_draft not null,

constraint pk_ship primary key (mmsi)
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

constraint pk_country primary key (name)
);


create table location(
latitude float constraint nn_location_latitude not null,
longitude float constraint nn_location_longitude not null,
country_name references country(name) constraint nn_location_country_name not null,

constraint pk_location primary key (latitude,longitude)
);


create table port(
id varchar(5) constraint nn_port_id not null,
name varchar(255) constraint nn_port_name not null,
location_latitude float constraint nn_port_latitude not null,
location_longitude float constraint nn_port_longitude not null,

constraint pk_port primary key (id),
constraint fk_port foreign key(location_latitude, location_longitude) references location(latitude,longitude)
);


create table warehouse(
id varchar(255) constraint nn_warehouse_id not null,
name varchar(255) constraint nn_warehouse_name not null,
location_latitude float constraint nn_warehouse_latitude not null,
location_longitude float constraint nn_warehouse_longitude not null,

constraint pk_warehouse primary key (id),
constraint fk_warehouse foreign key(location_latitude, location_longitude) references location(latitude,longitude)
);


create table cargo_manifest_load(
id integer constraint nn_cargo_load_id not null,
ship_mmsi varchar(9) constraint nn_cargo_manifest_load_ship_mmsi not null,
port_id varchar(255) constraint nn_cargo_manifest_load_port_id not null,
status integer constraint nn_cargo_load_status not null,

constraint pk_cargo_manifest_load primary key (id),
constraint fk_cargo_manifest_load foreign key (ship_mmsi) references ship(mmsi),
constraint fk_cargo_manifest_load2 foreign key (port_id) references port(id)
);


create table stage(
id integer constraint nn_stage_id not null,
cargo_load_id integer constraint nn_stage_cargo_load_id not null,
departure_date timestamp constraint nn_stage_departure_date not null,
arrival_date timestamp constraint nn_stage_arrival_date not null,
port_id varchar(5) constraint nn_stage_port_id not null,

constraint pk_stage primary key (id, cargo_load_id),
constraint fk_stage foreign key (cargo_load_id) references cargo_manifest_load(id),
constraint fk_stage2 foreign key (port_id) references port(id)
);


create table cargo_manifest_unload(

cargo_unload_id integer constraint nn_cargo_manifest_unload_stage_cargo_load_id not null,
stage_id integer constraint nn_cargo_manifest_unload_stage_id not null,
port_id varchar(5) constraint nn_cargo_manifest_unload_port_id not null,

constraint pk_cargo_unload primary key (cargo_unload_id, stage_id),
constraint fk_cargo_manifest_unload foreign key (cargo_unload_id, stage_id) references stage(cargo_load_id,id),
constraint fk_cargo_manifest_unload2 foreign key (port_id) references port(id)
);

create table container_cargoManifest(
container_x integer constraint nn_cont_cargo_x not null,
container_y integer constraint nn_cont_cargo_y not null,
container_z integer constraint nn_cont_cargo_z not null,
container_weight float constraint nn_cont_cargo_weight not null,
container_id integer not null,
stage_id integer not null,
cargo_manifest_id integer constraint nn_cont_cargo_id not null,

constraint pk_cont_cargo primary key (container_id, cargo_manifest_id, stage_id),
constraint fk_cont_cargo foreign key (cargo_manifest_id) references cargo_manifest_load(id),
constraint fk_cont_cargo2 foreign key (cargo_manifest_id,stage_id) references stage(cargo_load_id,id),
constraint fk_cont_cargo3 foreign key (container_id) references container(id),
constraint ck_cont_cargo_x check (container_x>=0),
constraint ck_cont_cargo_y check (container_y>=0)
);