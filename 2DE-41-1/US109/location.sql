------LOCATION------

--SUCCESS--

insert into location(latitude, longitude, country_name)
values(12345,12345,'Portugal')


--NULL INSERTS--


--LATITUDE NULL--

insert into location(latitude, longitude, country_name)
values(NULL,123456789,'Portugal')

--LONGITUDE NULL--

insert into location(latitude, longitude, country_name)
values(123456789,NULL,'Portugal')

--COUNTRY NULL--

insert into location(latitude, longitude, country_name)
values(123456789,123456789,NULL)



--NON COMPATIBLE INSERTS--


--LATITUDE VARCHAR--

insert into location(latitude, longitude, country_name)
values('onetwothreefourfive',123456789,'Portugal')

--LONGITUDE VARCHAR--

insert into location(latitude, longitude, country_name)
values(123456789,'onetwothreefourfive','Portugal')

--COUNTRY INT--




--WRONG FOREIGN KEY--


--COUNTRY WRONG FOREIGN KEY--

insert into location(latitude, longitude, country_name)
values(1234,12345,'China')



--DOUBLE PRIMARY KEY--


--LATITUDE LONGITUDE DOUBLE PRIMARY KEY--

insert into location(latitude, longitude, country_name)
values(12345,12345,'Portugal')