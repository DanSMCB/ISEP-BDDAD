------CONTAINER------

--SUCCESS--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',2000,5000,10000,20000,10,'certificate','repair recommendation', '210950000')



--NULL INSERTS--


--ID NULL--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(NULL,123456789,'22G1',2000,5000,10000,20000,10,'certificate','repair recommendation', '210950000')

--CHECK DIGIT NULL--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,NULL,'22G1',2000,5000,10000,20000,10,'certificate','repair recommendation', '210950000')

--ISO NULL--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,NULL,2000,5000,10000,20000,10,'certificate','repair recommendation', '210950000')

--WEIGHT NULL--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',NULL,5000,10000,20000,10,'certificate','repair recommendation', '210950000')

--MAX WEIGHT NULL--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',2000,NULL,10000,20000,10,'certificate','repair recommendation', '210950000')

--MAX WEIGHT INCL NULL--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',2000,5000,NULL,20000,10,'certificate','repair recommendation', '210950000')

--MAX VOLUME NULL--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',2000,5000,10000,NULL,10,'certificate','repair recommendation','210950000')

--REFRIGERATED NULL--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',2000,5000,10000,20000,NULL,'certificate','repair recommendation', '210950000')

--CERTIFICATE NULL--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',2000,5000,10000,20000,10,NULL,'repair recommendation', '210950000')

--REPAIR RECOMMENDATION NULL--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',2000,5000,10000,20000,10,'certificate',NULL, '210950000')

--SHIP MMSI NULL--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',2000,5000,10000,20000,10,'certificate','repair recommendation', NULL)



--NON COMPATIBLE INSERTS--


--ID VARCHAR--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values('onetwothreefourfive',1234567890,'22G1',2000,5000,10000,20000,10,'certificate','repair recommendation', '210950000')

--CHECK DIGIT VARCHAR--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,'onetwothreefourfive','22G1',2000,5000,10000,20000,10,'certificate','repair recommendation', '210950000')

--WEIGHT VARCHAR--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1','twothousand',5000,10000,20000,10,'certificate','repair recommendation', '210950000')

--MAX WEIGHT VARCHAR--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',2000,'fivethousand',10000,20000,10,'certificate','repair recommendation', '210950000')

--MAX WEIGHT INCL VARCHAR--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',2000,5000,'tenthousand',20000,10,'certificate','repair recommendation', '210950000')

--MAX VOLUME VARCHAR--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',2000,5000,10000,'twentythousand',10,'certificate','repair recommendation', '210950000')

--REFRIGERATED VARCHAR--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',2000,5000,10000,20000,'ten','certificate','repair recommendation', '210950000')



--CHECK NEGATIVE INSERTS--


--WEIGHT NEGATIVE--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',-1,5000,10000,20000,10,'certificate','repair recommendation', '210950000')

--MAX WEIGHT NEGATIVE VARCHAR--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',2000,-1,10000,20000,10,'certificate','repair recommendation', '210950000')

--MAX WEIGHT INCL NEGATIVE VARCHAR--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',2000,5000,-1,20000,10,'certificate','repair recommendation', '210950000')

--MAX VOLUME NEGATIVE VARCHAR--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',2000,5000,10000,-1,10,'certificate','repair recommendation', '210950000')



--WRONG FOREIGN KEY--


--SHIP MMSI FOREIGN KEY WRONG--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(12345678,1234567890,'22G1',2000,5000,10000,20000,10,'certificate','repair recommendation', 2345613)



--DOUBLE PRIMARY KEY--


--ID DOUBLE PRIMARY KEY--

insert into container(id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation, ship_mmsi)
values(123456789,1234567890,'22G1',2000,5000,10000,20000,10,'certificate','repair recommendation', '210950000')