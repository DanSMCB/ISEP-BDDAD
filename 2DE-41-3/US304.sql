create or replace NONEDITIONABLE PROCEDURE US304 (cont in integer, cargomanifest in integer, output out Varchar)
IS

BEGIN
    
    output := output || 'Audit trail for container ' || cont || ' from cargo manifest ' || cargomanifest || ':' || chr(10) || chr(10);
    
    for i in (select * from audittrail where audittrail.containerid =  cont and audittrail.cargomanifestloadid = cargomanifest order by audittrail.audit_date ASC) loop
    
    output := output || 'Container: ' || cont || chr(10) || 'Cargo manifest: ' || cargomanifest || chr(10) || 'Type of operation: ' || i.typeofoperation || chr(10)
    || 'Date of operation: ' || i.audit_date || chr(10) || 'User: ' || i.userid || chr(10) || chr(10);
    
    end loop;
  
END US304;