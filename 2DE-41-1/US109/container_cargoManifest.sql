------CONTAINER CARGO MANIFEST------

--SUCCESS--

insert into container_cargoManifest(container_x, container_y, container_z, container_weight, container_id, cargo_manifest_destination_id)
values(20,20,20,2000,123456789,'aaa123')



--NULL INSERTS--


--CONTAINER X NULL--

insert into container_cargoManifest(container_x, container_y, container_z, container_weight, container_id, cargo_manifest_destination_id)
values(NULL,20,20,2000,123456789,'aaa123')

--CONTAINER Y NULL--

insert into container_cargoManifest(container_x, container_y, container_z, container_weight, container_id, cargo_manifest_destination_id)
values(20,NULL,20,2000,123456789,'aaa123')

--CONTAINER Z NULL--

insert into container_cargoManifest(container_x, container_y, container_z, container_weight, container_id, cargo_manifest_destination_id)
values(20,20,NULL,2000,123456789,'aaa123')

--CONTAINER WEIGHT NULL--

insert into container_cargoManifest(container_x, container_y, container_z, container_weight, container_id, cargo_manifest_destination_id)
values(20,20,20,NULL,123456789,'aaa123')

--CONTAINER ID NULL--

insert into container_cargoManifest(container_x, container_y, container_z, container_weight, container_id, cargo_manifest_destination_id)
values(20,20,20,2000,NULL,'aaa123')

--CARGO MANIFEST DESTINATION ID NULL--

insert into container_cargoManifest(container_x, container_y, container_z, container_weight, container_id, cargo_manifest_destination_id)
values(20,20,20,2000,123456789,NULL)



--NON COMPATIBLE INSERTS--


--CONTAINER X VARCHAR--

insert into container_cargoManifest(container_x, container_y, container_z, container_weight, container_id, cargo_manifest_destination_id)
values('onetwothreefourfive',20,20,2000,123456789,'aaa123')

--CONTAINER Y VARCHAR--

insert into container_cargoManifest(container_x, container_y, container_z, container_weight, container_id, cargo_manifest_destination_id)
values(20,'onetwothreefourfive',20,2000,123456789,'aaa123')

--CONTAINER Z VARCHAR--

insert into container_cargoManifest(container_x, container_y, container_z, container_weight, container_id, cargo_manifest_destination_id)
values(20,20,'onetwothreefourfive',2000,123456789,'aaa123')

--CONTAINER WEIGHT VARCHAR--

insert into container_cargoManifest(container_x, container_y, container_z, container_weight, container_id, cargo_manifest_destination_id)
values(20,20,20,'onetwothreefourfive',123456789,'aaa123')

--CONTAINER ID VARCHAR--

insert into container_cargoManifest(container_x, container_y, container_z, container_weight, container_id, cargo_manifest_destination_id)
values(20,20,20,2000,'onetwothreefourfive','aaa123')



--WRONG FOREIGN KEY--


--CONTAINER ID WRONG FOREIGN KEY--

insert into container_cargoManifest(container_x, container_y, container_z, container_weight, container_id, cargo_manifest_destination_id)
values(20,20,20,2000,12345,'aaa123')

--CARGO MANIFEST DESTINATION ID WRONG FOREIGN KEY--

insert into container_cargoManifest(container_x, container_y, container_z, container_weight, container_id, cargo_manifest_destination_id)
values(20,20,20,2000,123456789,'aaa')