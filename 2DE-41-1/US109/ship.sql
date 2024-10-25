------SHIP------

--SUCCESS--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000','Evergreen','IMO9395044',5000,5000,'C4SQ2','VARAMO',166,25,200,9)


--NULL INSERTS--


--MMSI NULL--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values(NULL,'Evergreen','IMO9395044',5000,5000,'C4SQ2','VARAMO',166,25,200,9)

--NAME NULL--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000',NULL,'IMO9395044',5000,5000,'C4SQ2','VARAMO',166,25,200,9)

--IMO NULL--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000','Evergreen',NULL,5000,5000,'C4SQ2','VARAMO',166,25,200,9)

--NUMBER ENERGY GENERATORS NULL--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000','Evergreen','IMO9395044',NULL,5000,'C4SQ2','VARAMO',166,25,200,9)

--GENERATOR POWER OUTPUT NULL--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000','Evergreen','IMO9395044',5000,NULL,'C4SQ2','VARAMO',166,25,200,9)

--CALL SIGN NULL--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000','Evergreen','IMO9395044',5000,5000,NULL,'VARAMO',166,25,200,9)

--VESSEL TYPE NULL--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000','Evergreen','IMO9395044',5000,5000,'C4SQ2',NULL,166,25,200,9)

--LENGHT NULL--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000','Evergreen','IMO9395044',5000,5000,'C4SQ2','VARAMO',NULL,25,200,9)

--WIDTH NULL--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000','Evergreen','IMO9395044',5000,5000,'C4SQ2','VARAMO',166,NULL,200,9)

--CAPACITY NULL--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000','Evergreen','IMO9395044',5000,5000,'C4SQ2','VARAMO',166,25,NULL,9)

--DRAFT NULL--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000','Evergreen','IMO9395044',5000,5000,'C4SQ2','VARAMO',166,25,200,NULL)



--NON COMPATIBLE INSERTS--


--NUMBER ENERGY GENERATORS VARCHAR--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000','Evergreen','IMO9395044','fivethousand',5000,'C4SQ2','VARAMO',166,25,200,9)

--GENERATOR POWER OUTPUT VARCHAR--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000','Evergreen','IMO9395044',5000,'fivethousand','C4SQ2','VARAMO',166,25,200,9)

--LENGHT VARCHAR--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000','Evergreen','IMO9395044',5000,5000,'C4SQ2','VARAMO','onehundredandsixtysix',25,200,9)

--WIDTH VARCHAR--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000','Evergreen','IMO9395044',5000,5000,'C4SQ2','VARAMO',166,'twentyfive',200,9)

--CAPACITY VARCHAR--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000','Evergreen','IMO9395044',5000,5000,'C4SQ2','VARAMO',166,25,'twohundred',9)

--DRAFT VARCHAR--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values('210950000','Evergreen','IMO9395044',5000,5000,'C4SQ2','VARAMO',166,25,200,'nine')



--OTHER INSERTS--


--SHIP MMSI MORE THAN 9 NUMBERS--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values(21095000012,'Evergreen','IMO9395044',5000,5000,'C4SQ2','VARAMO',166,25,200,9)



--DOUBLE PRIMARY KEY--


--SHIP MMSI DOUBLE PRIMARY KEY--

insert into ship(mmsi, name, imo, num_energy_gen, gen_pow_out, callsign, vessel, lenght, width, cap, draft)
values(210950000,'Titanic','IMO9395011',10000,10000,'CAR42','LUGANO',133,26,199,10)