insert into userrole (id, designation) 
values (1, 'Client');

insert into userrole (id, designation) 
values (2, 'Ship Captain');

insert into userrole (id, designation) 
values (3, 'Traffic Manager');

insert into userrole (id, designation) 
values (4, 'Port Manager');

insert into userrole (id, designation) 
values (5, 'Port Staff');

insert into userrole (id, designation) 
values (6, 'Ship Chief Electrical Engineer');

insert into userrole (id, designation) 
values (7, 'Truck driver');

insert into usertable (username, password, userroleid) 
values ('client1', 'client123', 1);

insert into usertable (username, password, userroleid) 
values ('client2', 'client123', 1);

insert into usertable (username, password, userroleid) 
values ('shipcaptain1', 'shipcaptain123', 2);

insert into usertable (username, password, userroleid) 
values ('shipcaptain2', 'shipcaptain123', 2);

insert into usertable (username, password, userroleid) 
values ('shipcaptain3', 'shipcaptain123', 2);

insert into usertable (username, password, userroleid) 
values ('trafficmanager1', 'trafficmanager123', 3);

insert into usertable (username, password, userroleid) 
values ('trafficmanager2', 'trafficmanager123', 3);

insert into usertable (username, password, userroleid) 
values ('portmanager1', 'portmanager123', 4);

insert into usertable (username, password, userroleid) 
values ('portmanager2', 'portmanager123', 4);

insert into usertable (username, password, userroleid) 
values ('portstaff1', 'portstaff123', 5);

insert into usertable (username, password, userroleid) 
values ('portstaff2', 'portstaff123', 5);

insert into usertable (username, password, userroleid) 
values ('scee1', 'scee123', 6);

insert into usertable (username, password, userroleid) 
values ('scee2', 'scee123', 6);

insert into usertable (username, password, userroleid) 
values ('truckdriver1', 'truckdriver123', 7);

insert into usertable (username, password, userroleid) 
values ('truckdriver2', 'truckdriver123', 7);

insert into location(latitude, longitude, country_name) 
values (41.164076, -8.615431, 'Portugal');

insert into location(latitude, longitude, country_name) 
values (50.487916, -4.563011, 'United Kingdom');

insert into location(latitude, longitude, country_name) 
values (-5.825980, -37.094731, 'Brazil');

insert into location(latitude, longitude, country_name) 
values (40.012010, -75.053632, 'United States');

insert into location(latitude, longitude, country_name) 
values (43.290239, 6.198647, 'France');

insert into warehouse(id, name, location_latitude, location_longitude)
values ('84622','warehouse 1', 41.164076, -8.615431);

insert into warehouse(id, name, location_latitude, location_longitude)
values ('63215','warehouse 2', 50.487916, -4.563011);

insert into warehouse(id, name, location_latitude, location_longitude)
values ('91223','warehouse 3', -5.825980, -37.094731);

insert into warehouse(id, name, location_latitude, location_longitude)
values ('84932','warehouse 4', 40.012010, -75.053632);

insert into warehouse(id, name, location_latitude, location_longitude)
values ('67214','warehouse 5', 43.290239, 6.198647);

insert into truck (id, userid_truckdriver)
values (1, 'truckdriver1');

insert into truck (id, userid_truckdriver)
values (2, 'truckdriver2');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('87T13058855', 5, '87T1', 9127, 9966, 20000, 69, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('73P15984631', 1, '73P1', 9018, 8929, 20000, 54, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('45R16155496', 6, '45R1', 5434, 8069, 20000, 81, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('91R12635344', 4, '91R1', 8950, 5886, 20000, 57, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('82T15845946', 6, '82T1', 9292, 5175, 20000, 65, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('40R11713552', 2, '40R1', 9495, 7773, 20000, 94, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('55P13623003', 3, '55P1', 8631, 9797, 20000, 62, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('66P17334328', 8, '66P1', 6645, 7022, 20000, 74, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('36T11561991', 1, '36T1', 9290, 8823, 20000, 69, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('41U19029035', 5, '41U1', 6926, 5732, 20000, 63, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('65R19690694', 4, '65R1', 6579, 8461, 20000, 50, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('66R14818422', 2, '66R1', 6278, 8935, 20000, 99, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('86R13635954', 4, '86R1', 5868, 7563, 20000, 88, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('40U14303830', 0, '40U1', 6812, 9607, 20000, 87, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('92R11543489', 9, '92R1', 5302, 7123, 20000, 81, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('42R19979481', 1, '42R1', 5579, 8211, 20000, 88, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('89G17649632', 2, '89G1', 8542, 8447, 20000, 84, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('95G13200930', 0, '95G1', 8494, 8287, 20000, 77, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('56R12173466', 6, '56R1', 6013, 8674, 20000, 85, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('72P12189002', 2, '72P1', 7576, 6879, 20000, 51, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('86U15872353', 3, '86U1', 7419, 6081, 20000, 75, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('89G13618039', 9, '89G1', 6392, 5782, 20000, 82, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('54U13228323', 3, '54U1', 7893, 8206, 20000, 57, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('44R12605920', 0, '44R1', 5290, 7826, 20000, 98, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('65P18815372', 2, '65P1', 7954, 9478, 20000, 81, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('37T11342854', 4, '37T1', 5032, 9623, 20000, 61, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('75P14756953', 3, '75P1', 7752, 5411, 20000, 72, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('76U13022528', 8, '76U1', 8696, 8697, 20000, 92, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('75G16934990', 0, '75G1', 8186, 6876, 20000, 55, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('68R19338922', 2, '68R1', 7554, 6041, 20000, 65, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('30R16065180', 0, '30R1', 7224, 8338, 20000, 82, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('40U13560906', 6, '40U1', 5682, 5637, 20000, 87, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('24R12655085', 5, '24R1', 5560, 7987, 20000, 54, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('58T17069479', 9, '58T1', 5447, 9417, 20000, 61, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('12G16582421', 1, '12G1', 5222, 5035, 20000, 59, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('29R14269230', 0, '29R1', 5547, 5656, 20000, 78, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('17R17717864', 4, '17R1', 7414, 7817, 20000, 53, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('86U19724193', 3, '86U1', 5772, 8355, 20000, 63, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('97G14915783', 3, '97G1', 7701, 8875, 20000, 72, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('76R18678699', 9, '76R1', 6029, 9060, 20000, 82, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('30U15784688', 8, '30U1', 7361, 9454, 20000, 71, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('41G11156672', 2, '41G1', 9999, 7379, 20000, 92, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('44G18498482', 2, '44G1', 6006, 6917, 20000, 52, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('63U12968086', 6, '63U1', 8394, 7272, 20000, 93, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('52R19321961', 1, '52R1', 5113, 5564, 20000, 55, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('96U11677078', 8, '96U1', 9514, 5671, 20000, 99, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('23T17976295', 5, '23T1', 7478, 5352, 20000, 88, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('93T15352181', 1, '93T1', 8747, 5418, 20000, 54, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('66U15331401', 1, '66U1', 5798, 7080, 20000, 86, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('36R16366662', 2, '36R1', 5290, 6752, 20000, 51, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('33P12169891', 1, '33P1', 9571, 8876, 20000, 51, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('59R11299302', 2, '59R1', 5827, 6969, 20000, 78, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('28U17927447', 7, '28U1', 5762, 5251, 20000, 64, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('49P13209125', 5, '49P1', 9285, 8818, 20000, 97, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('37U17682678', 8, '37U1', 9429, 6101, 20000, 66, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('78T13200085', 5, '78T1', 7875, 9359, 20000, 77, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('64T16007593', 3, '64T1', 9573, 7802, 20000, 63, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('12G13098901', 1, '12G1', 6094, 6092, 20000, 54, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('51T13199271', 1, '51T1', 6095, 6230, 20000, 96, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('29U15843212', 2, '29U1', 5438, 5541, 20000, 66, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('54T19229885', 5, '54T1', 7770, 6387, 20000, 81, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('59T18372469', 9, '59T1', 9797, 9391, 20000, 85, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('19P19701900', 0, '19P1', 5465, 8671, 20000, 54, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('65R18306364', 4, '65R1', 6121, 5713, 20000, 95, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('83P14631874', 4, '83P1', 5930, 7324, 20000, 92, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('78T17200382', 2, '78T1', 8797, 9316, 20000, 94, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('47R16917430', 0, '47R1', 7511, 6479, 20000, 60, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('19U15798951', 1, '19U1', 9745, 6807, 20000, 78, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('43R11180336', 6, '43R1', 5361, 7412, 20000, 59, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('68T19716577', 7, '68T1', 6913, 7925, 20000, 98, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('31U18833149', 9, '31U1', 8785, 8280, 20000, 64, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('31R18919115', 5, '31R1', 7388, 5899, 20000, 89, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('77T11025637', 7, '77T1', 8987, 5066, 20000, 74, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('19P18580682', 2, '19P1', 7762, 7181, 20000, 58, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('10T16680399', 9, '10T1', 9291, 9634, 20000, 87, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('32T16194686', 6, '32T1', 7659, 9633, 20000, 76, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('38P11258962', 2, '38P1', 7144, 6990, 20000, 92, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('17P15448092', 2, '17P1', 7054, 7658, 20000, 81, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('48T19365428', 8, '48T1', 5509, 6388, 20000, 95, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('74G15228887', 7, '74G1', 6314, 7421, 20000, 63, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('13T17222282', 2, '13T1', 6139, 9003, 20000, 52, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('53R13964689', 9, '53R1', 5909, 9149, 20000, 50, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('23T16248403', 3, '23T1', 5088, 9254, 20000, 93, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('41T19777515', 5, '41T1', 9486, 6297, 20000, 59, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('94P17800525', 5, '94P1', 9640, 8412, 20000, 97, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('81G15034941', 1, '81G1', 5422, 5037, 20000, 79, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('96T11756331', 1, '96T1', 5358, 5910, 20000, 98, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('62U14428520', 0, '62U1', 5965, 6059, 20000, 75, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('59R11693128', 8, '59R1', 7719, 7956, 20000, 71, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('83T13415319', 9, '83T1', 5630, 8943, 20000, 60, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('36P18352028', 8, '36P1', 6111, 9862, 20000, 57, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('82R15323205', 5, '82R1', 7326, 6173, 20000, 50, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('84P14020721', 1, '84P1', 6860, 8642, 20000, 89, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('88P13594141', 1, '88P1', 9144, 9332, 20000, 75, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('25T17495259', 9, '25T1', 5620, 9330, 20000, 85, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('60R14735783', 3, '60R1', 6512, 5292, 20000, 96, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('73G14297686', 6, '73G1', 8344, 6209, 20000, 99, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('39U1732975', 5, '39U1', 9334, 8930, 20000, 63, 1, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('21R12431922', 2, '21R1', 7383, 9930, 20000, 85, 0, 'certificate', 'repair recomendation');

insert into container (id, check_digit, iso, weight, max_weight, max_weight_incl, max_volume, refrigerated, certificate, repairRecommendation) 
values ('85T14706480', 0, '85T1', 5264, 5823, 20000, 52, 1, 'certificate', 'repair recomendation');

update ship
set cap = 16
where mmsi = '636092932';

insert into cargo_manifest_load (id, ship_mmsi, port_id, status) 
values (40, '636092932', '25350', 1);

insert into cargo_manifest_load (id, ship_mmsi, port_id, status) 
values (41, '636092932', '29876', 1);

insert into cargo_manifest_load (id, ship_mmsi, port_id, status) 
values (42, '636092932', '30045', 1);

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(1, 40, '2022/02/10', '2022/02/20', '14113');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(2, 40, '2022/03/10', '2022/03/20', '26670');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(3, 40, '2022/04/10', '2022/04/20', '28082');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(1, 41, '2022/05/10', '2022/05/20', '14113');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(2, 41, '2022/06/10', '2022/06/20', '26670');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(3, 41, '2022/07/10', '2022/07/20', '28082');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(1, 42, '2022/08/10', '2022/08/20', '14113');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(2, 42, '2022/09/10', '2022/09/20', '26670');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '91R12635344', 1, 40, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '40R11713552', 1, 40, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '55P13623003', 1, 40, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '66P17334328', 1, 40, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '41U19029035', 1, 40, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '65R19690694', 1, 40, 'client1');


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '91R12635344', 2, 40, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '40R11713552', 2, 40, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '55P13623003', 2, 40, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '66P17334328', 2, 40, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '41U19029035', 2, 40, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '65R19690694', 2, 40, 'client1');


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '91R12635344', 3, 40, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '40R11713552', 3, 40, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '55P13623003', 3, 40, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '66P17334328', 3, 40, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '41U19029035', 3, 40, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '65R19690694', 3, 40, 'client1');



insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '91R12635344', 1, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '40R11713552', 1, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '55P13623003', 1, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '66P17334328', 1, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '41U19029035', 1, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '65R19690694', 1, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '37U17682678', 1, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '78T13200085', 1, 41, 'client1'); 


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '91R12635344', 2, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '40R11713552', 2, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '55P13623003', 2, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '66P17334328', 2, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '41U19029035', 2, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '65R19690694', 2, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '37U17682678', 2, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '78T13200085', 2, 41, 'client1'); 


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '91R12635344', 3, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '40R11713552', 3, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '55P13623003', 3, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '66P17334328', 3, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '41U19029035', 3, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '65R19690694', 3, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '37U17682678', 3, 41, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '78T13200085', 3, 41, 'client1'); 



insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '91R12635344', 1, 42, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '40R11713552', 1, 42, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '55P13623003', 1, 42, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '66P17334328', 1, 42, 'client1');


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '91R12635344', 2, 42, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '40R11713552', 2, 42, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '55P13623003', 2, 42, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '66P17334328', 2, 42, 'client1');

update ship
set cap = 10
where mmsi = '636091400';

update cargo_manifest_load
set ship_mmsi = '636091400'
where ship_mmsi = '636092932' and id = 50;

update cargo_manifest_load
set ship_mmsi = '636091400'
where ship_mmsi = '636092932' and id = 51;

update cargo_manifest_load
set ship_mmsi = '636091400'
where ship_mmsi = '636092932' and id = 52;



insert into cargo_manifest_load (id, ship_mmsi, port_id, status) 
values (50, '636091400', '25350', 1);

insert into cargo_manifest_load (id, ship_mmsi, port_id, status) 
values (51, '636091400', '29876', 1);

insert into cargo_manifest_load (id, ship_mmsi, port_id, status) 
values (52, '636091400', '30045', 1);

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(1, 50, '2021/07/10', '2021/07/20', '14113');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(2, 50, '2021/08/10', '2021/08/20', '26670');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(3, 50, '2021/09/10', '2021/09/20', '28082');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(1, 51, '2021/10/10', '2021/10/20', '14113');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(2, 51, '2021/11/10', '2021/11/20', '26670');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(3, 51, '2021/12/10', '2021/12/20', '28082');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(1, 52, '2022/01/10', '2022/01/20', '14113');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(2, 52, '2022/02/10', '2022/02/20', '26670');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '91R12635344', 1, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '40R11713552', 1, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '55P13623003', 1, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '66P17334328', 1, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '41U19029035', 1, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '65R19690694', 1, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '78T13200085', 1, 50, 'client1');


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '91R12635344', 2, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '40R11713552', 2, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '55P13623003', 2, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '66P17334328', 2, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '41U19029035', 2, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '78T13200085', 2, 50, 'client1');


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '91R12635344', 3, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '40R11713552', 3, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '55P13623003', 3, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '66P17334328', 3, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '41U19029035', 3, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '65R19690694', 3, 50, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '78T13200085', 3, 50, 'client1');



insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '91R12635344', 1, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '40R11713552', 1, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '55P13623003', 1, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '66P17334328', 1, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '41U19029035', 1, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '65R19690694', 1, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '37U17682678', 1, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '78T13200085', 1, 51, 'client1'); 


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '91R12635344', 2, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '40R11713552', 2, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '55P13623003', 2, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '66P17334328', 2, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '41U19029035', 2, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '65R19690694', 2, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '37U17682678', 2, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '78T13200085', 2, 51, 'client1'); 


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '91R12635344', 3, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '40R11713552', 3, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '55P13623003', 3, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '66P17334328', 3, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '41U19029035', 3, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '65R19690694', 3, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '37U17682678', 3, 51, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '78T13200085', 3, 51, 'client1'); 



insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '91R12635344', 1, 52, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '40R11713552', 1, 52, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '55P13623003', 1, 52, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '66P17334328', 1, 52, 'client1');


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '91R12635344', 2, 52, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '40R11713552', 2, 52, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '55P13623003', 2, 52, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(1, 1, 1, 11000, '66P17334328', 2, 52, 'client1');





insert into cargo_manifest_load (id, ship_mmsi, port_id, status) 
values (60, '210950000', '25350', 1);

insert into cargo_manifest_load (id, ship_mmsi, port_id, status) 
values (61, '212180000', '29876', 1);

insert into cargo_manifest_load (id, ship_mmsi, port_id, status) 
values (62, '212351000', '30045', 1);

insert into cargo_manifest_load (id, truck_id, port_id, status) 
values (63, '1', '25350', 1);

insert into cargo_manifest_load (id, truck_id, port_id, status) 
values (64, '1', '29876', 1);

insert into cargo_manifest_load (id, truck_id, port_id, status) 
values (65, '2', '30045', 1);

insert into cargo_manifest_load (id, ship_mmsi, warehouse_id, status) 
values (66, '249047000', '84622', 1);

insert into cargo_manifest_load (id, ship_mmsi, warehouse_id, status) 
values (67, '256304000', '63215', 1);

insert into cargo_manifest_load (id, ship_mmsi, port_id, status) 
values (68, '256888000', '30045', 1);


insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(1, 60, '2022/01/31', '2022/02/05', '14113');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(2, 60, '2022/02/10', '2022/02/20', '26670');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(1, 61, '2022/01/10', '2022/01/20', '14113');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(2, 61, '2022/01/22', '2022/01/31', '25350');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(1, 62, '2022/01/10', '2022/01/20', '25350');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(2, 62, '2022/02/01', '2022/02/20', '26670');

insert into stage(id, cargo_load_id, departure_date, arrival_date, warehouse_id)
values(1, 63, '2022/02/03', '2022/02/13', '63215');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(2, 63, '2022/02/15', '2022/02/20', '14113');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(1, 64, '2022/02/01', '2022/02/04', '25350');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(2, 64, '2022/02/10', '2022/02/20', '26670');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(1, 65, '2022/01/10', '2022/01/20', '14113');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(2, 65, '2022/02/01', '2022/02/04', '25350');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(1, 66, '2022/01/10', '2022/02/05', '25350');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(2, 66, '2022/02/10', '2022/02/20', '26670');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(1, 68, '2022/01/10', '2022/01/15', '14113');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(2, 68, '2022/01/17', '2022/01/22', '25350');

insert into stage(id, cargo_load_id, departure_date, arrival_date, port_id)
values(3, 68, '2022/02/05', '2022/02/20', '26670');



insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(50, 31, 21, 11000, '91R12635344', 1, 60, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(21, 45, 18, 12000, '40R11713552', 1, 60, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(15, 1, 63, 13000, '55P13623003', 1, 60, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(36, 71, 43, 9000, '66P17334328', 1, 60, 'client1');


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(50, 31, 21, 11000, '91R12635344', 2, 61, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(21, 45, 18, 12000, '40R11713552', 2, 61, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(15, 1, 63, 13000, '55P13623003', 2, 61, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(36, 71, 43, 9000, '66P17334328', 2, 61, 'client1');


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(50, 31, 21, 11000, '91R12635344', 1, 62, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(21, 45, 18, 12000, '40R11713552', 1, 62, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(15, 1, 63, 13000, '55P13623003', 1, 62, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(36, 71, 43, 9000, '66P17334328', 1, 62, 'client1');


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(50, 31, 21, 11000, '91R12635344', 1, 63, 'client1');


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(50, 31, 21, 11000, '91R12635344', 1, 64, 'client1');


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(50, 31, 21, 11000, '91R12635344', 2, 65, 'client1');


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(50, 31, 21, 11000, '91R12635344', 1, 66, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(21, 45, 18, 12000, '40R11713552', 1, 66, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(15, 1, 63, 13000, '55P13623003', 1, 66, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(36, 71, 43, 9000, '66P17334328', 1, 66, 'client1');


insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(50, 31, 21, 11000, '91R12635344', 3, 68, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(21, 45, 18, 12000, '40R11713552', 3, 68, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(15, 1, 63, 13000, '55P13623003', 3, 68, 'client1');

insert into container_cargomanifest(container_x, container_y, container_z, container_weight, container_id, stage_id, cargo_manifest_id, userid_client)
values(36, 71, 43, 9000, '66P17334328', 3, 68, 'client1');
