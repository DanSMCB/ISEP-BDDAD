------DESTINATION------

--SUCCESS--

insert into destination(id, name, location_latitude, location_longitude)
values('aaa123','destination',12345,12345)


--NULL INSERTS--


--ID NULL--

insert into destination(id, name, location_latitude, location_longitude)
values(NULL,'destination',12345,12345)

--NAME NULL--

insert into destination(id, name, location_latitude, location_longitude)
values('aaa123',NULL,12345,12345)

--LATITUDE NULL--

insert into destination(id, name, location_latitude, location_longitude)
values('aaa123','destination',NULL,12345)

--LONGITUDE NULL--

insert into destination(id, name, location_latitude, location_longitude)
values('aaa123','destination',12345,NULL)



--NON COMPATIBLE INSERTS--


--LATITUDE VARCHAR--

insert into destination(id, name, location_latitude, location_longitude)
values('aaa123','destination','onetwothreefourfive',12345)

--LONGITUDE VARCHAR--

insert into destination(id, name, location_latitude, location_longitude)
values('aaa123','destination',12345,'onetwothreefourfive')



--WRONG FOREIGN KEY--


--LATITUDE FOREIGN KEY WRONG--

insert into destination(id, name, location_latitude, location_longitude)
values('aaa12','destination',987654321,12345)

--LONGITUDE FOREIGN KEY WRONG--

insert into destination(id, name, location_latitude, location_longitude)
values('aaa12','destination',12345,987654321)



--DOUBLE PRIMARY KEY--


--ID DOUBLE PRIMARY KEY--

insert into destination(id, name, location_latitude, location_longitude)
values('aaa123','destination2',1234,1234)