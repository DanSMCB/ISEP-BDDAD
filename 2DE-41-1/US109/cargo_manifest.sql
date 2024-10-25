------CARGO_MANIFEST------

--SUCCESS--

insert into cargo_manifest(destination_id)
values('aaa123')



--NULL INSERTS--


--DESTINATION ID NULL--

insert into cargo_manifest(destination_id)
values(NULL)



--WRONG FOREIGN KEY--


--DESTINATION ID WRONG FOREIGN KEY--

insert into cargo_manifest(destination_id)
values('AAA')