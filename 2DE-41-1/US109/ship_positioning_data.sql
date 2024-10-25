------ship_positioning_data------

--SUCCESS--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,90, 12.5, 2.9, 355, 'ship_position', 'B', '210950000')


--NULL INSERTS--


--BASE DATE TIME NULL--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values(NULL,45,90, 12.5, 2.9, 355, 'ship_position', 'B', '210950000')

--LATITUDE NULL--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',NULL,90, 12.5, 2.9, 355, 'ship_position', 'B', '210950000')

--LONGITUDE NULL--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,NULL, 12.5, 2.9, 355, 'ship_position', 'B', '210950000')

--SOG NULL--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,90, NULL, 2.9, 355, 'ship_position', 'B', '210950000')

--COG NULL--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,90, 12.5, NULL, 355, 'ship_position', 'B', '210950000')

--HEADING NULL--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,90, 12.5, 2.9, NULL, 'ship_position', 'B', '210950000')

--ship_position NULL--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,90, 12.5, 2.9, 355, NULL, 'B', '210950000')

--TRANSCEIVER CLASS NULL--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,90, 12.5, 2.9, 355, 'ship_position', NULL, '210950000')

--SHIP MMSI NULL--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,90, 12.5, 2.9, 355, 'ship_position', 'B', NULL)




--NON COMPATIBLE INSERTS--


--BASE DATE TIME VARCHAR--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('aaaaa',45,90, 12.5, 2.9, 355, 'ship_position', 'B', '210950000')

--LATITUDE VARCHAR--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11','onetwothreefourfive',90, 12.5, 2.9, 355, 'ship_position', 'B', '210950000')

--LONGITUDE VARCHAR--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,'onetwothreefourfive', 12.5, 2.9, 355, 'ship_position', 'B', '210950000')

--SOG VARCHAR--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,90, 'onetwothreefourfive', 2.9, 355, 'ship_position', 'B', '210950000')

--COG VARCHAR--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,90, 12.5, 'onetwothreefourfive', 355, 'ship_position', 'B', '210950000')

--HEADING VARCHAR--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,90, 12.5, 2.9, 'onetwothreefourfive', 'ship_position', 'B', '210950000')



--OTHER INSERTS--


--LATITUDE >= -90--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',-180,90, 12.5, 2.9, 355, 'ship_position', 'B', '210950000')

--LATITUDE <= 90--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',180,90, 12.5, 2.9, 355, 'ship_position', 'B', '210950000')

--LONGITUDE >= -180--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,-360, 12.5, 2.9, 355, 'ship_position', 'B', '210950000')

--LONGITUDE <= 180--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,360, 12.5, 2.9, 355, 'ship_position', 'B', '210950000')

--COG >= 0--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,90, 2.9, -1, 355, 'ship_position', 'B', '210950000')

--COG <= 360--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,90, 2.9, 361, 355, 'ship_position', 'B', '210950000')

--HEADING >= 0--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,90, 2.9, 60, -1, 'ship_position', 'B', '210950000')

--HEADING <= 360--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',45,90, 2.9, 60, 361, 'ship_position', 'B', '210950000')



--WRONG FOREIGN KEY--


--SHIP MMSI WRONG FOREIGN KEY--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-12-12 12:12:12',10,20, 14, 14, 255, 'ship_position2', 'A', '210950033')



--DOUBLE PRIMARY KEY--


--BASE DATE TIME PRIMARY KEY--

insert into ship_positioning_data(base_date_time, latitude, longitude, sog, cog, ship_heading, ship_position, transceiver_class, ship_mmsi)
values('2021-11-11 11:11:11',10,20, 14, 14, 255, 'ship_position2', 'A', '210950000')