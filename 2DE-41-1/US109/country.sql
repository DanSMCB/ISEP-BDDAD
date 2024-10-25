------COUNTRY------

--SUCCESS--

insert into country(name, continent)
values('Portugal', 'Europe')


--NULL INSERTS--


--NAME NULL--

insert into country(name, continent)
values(NULL, 'Europe')

--CONTINENT NULL--

insert into country(name, continent)
values('Portugal', NULL)



--DOUBLE PRIMARY KEY--


--NAME DOUBLE PRIMARY KEY--

insert into country(name, continent)
values('Portugal', 'Asia')
