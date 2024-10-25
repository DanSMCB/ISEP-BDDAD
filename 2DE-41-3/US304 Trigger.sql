create or replace NONEDITIONABLE TRIGGER US304
BEFORE INSERT OR UPDATE OR DELETE ON container_cargoManifest
FOR EACH ROW

DECLARE

currentTime timestamp;
currentUser usertable.username%type;
cargoLoad cargo_manifest_load.id%type;
contain container.id%type;


BEGIN

select CURRENT_TIMESTAMP into currentTime from dual;


IF INSERTING THEN

select usertable.username into currentUser from usertable where usertable.username = :new.userid_client;
select cargo_manifest_load.id into cargoLoad from cargo_manifest_load where cargo_manifest_load.id = :new.cargo_manifest_id;
select container.id into contain from container where container.id = :new.container_id;

insert into audittrail (containerid,  cargomanifestloadid, typeofoperation, audit_date, userid) values (contain, cargoLoad, 'INSERT', currentTime, currentUser);

ELSE

select usertable.username into currentUser from usertable where usertable.username = :old.userid_client;
select cargo_manifest_load.id into cargoLoad from cargo_manifest_load where cargo_manifest_load.id = :old.cargo_manifest_id;
select container.id into contain from container where container.id = :old.container_id;


IF DELETING THEN

insert into audittrail (containerid,  cargomanifestloadid, typeofoperation, audit_date, userid) values (contain, cargoLoad, 'DELETE', currentTime, currentUser);

ELSE

insert into audittrail (containerid,  cargomanifestloadid, typeofoperation, audit_date, userid) values (contain, cargoLoad, 'UPDATE', currentTime, currentUser);

END IF;
END IF;

END US304;