create or replace PROCEDURE US207 (mmsi in Varchar, yearC in INTEGER, numCargo out INTEGER, avgCont out FLOAT)
IS
begin
    SELECT COUNT(cm_id) , AVG(count_cont) into numCargo, avgCont
    FROM
    (
        SELECT ccm.cargo_manifest_id as cm_id, COUNT(ccm.container_id) as count_cont
        FROM container_cargoManifest ccm, cargo_manifest_load cml, stage s
        WHERE ccm.cargo_manifest_id=cml.id
        AND cml.ship_mmsi = mmsi
        AND cml.id=s.cargo_load_id
        AND ccm.stage_id=s.id
        AND extract(YEAR FROM s.departure_date)=yearC
        GROUP BY ccm.cargo_manifest_id
        ORDER BY ccm.cargo_manifest_id
    ) avg_cont;
    
end;