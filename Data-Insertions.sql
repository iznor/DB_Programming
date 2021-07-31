insert into room_type values
('baby',2,250),
('couples',1,400),
('extra large',5,500),
('kids',3,300),
('large',4,450),
('medium',3,320),
('penthouse',3,750),
('small',1,200),
('sweet',2,1000),
('view',2,650);

insert into building values
('A',10),
('B',11),
('C',14),
('D',13),
('E',12),
('F',15),
('G',17),
('H',18),
('I',19),
('J',16);

insert into room_status values
('available'),
('awaiting clean'),
('being cleaned'),
('booked'),
('broken bed'),
('broken door'),
('broken tv'),
('broken window'),
('occupied'),
('under repairs');

insert into persons values
(9542867,'Tim','Howard','Porto', 0503945320),
(3542864,'Caetano','Veloso','Cerdo do sol', 0503945321),
(2242867,'Amir','Mohammed','Gaza', 0503945310),
(4542867,'Kanye','West','Los Angeles', 0503975320),
(5542867,'Palomari','Escobar','Colombia', 0513945320),
(6542867,'Don','Corleone','Italy', 0573985320),
(7542867,'Marshall','Mathers','Detroit', 0593942520),
(8542867,'Bruce','Springsteen','USA', 0583265320),
(2542867,'Eric','Clapton','California', 0532225320),
(1542867,'Peter','Gabriel','Southeast Madisson', 0509000320),

(1145832,'Mercedes','Sossa','Greece', 2503945320),
(1045832,'Roberto','Carlos','Brazil', 3503945321),
(2045832,'Benny','Amdoursky','Israel', 4503945310),
(3045832,'James','Blake','England', 5503975320),
(4045832,'Elton','John','Somewhere', 6513945320),
(5045832,'Federico','Fellini','Italy', 7573985320),
(6045832,'Yirmi','Kaplan','Israel', 8593942520),
(7045832,'Kate','Bush','USA', 9583265320),
(8045832,'Bobby','Hebb','Palo Alto', 1632225320),
(9045832,'Quentin','Tarantino','Holywood Blvd.', 2429000320);

insert into employees(person_id) values
(9542867),
(3542864),
(2242867),
(4542867),
(5542867),
(6542867),
(7542867),
(8542867),
(0542867),
(1542867);

insert into reception values
(1, 9542867),
(2, 3542864),
(3, 2242867);

insert into cleaners values
(4,4542867),
(5, 5542867),
(6, 6542867),
(7, 7542867),
(8, 8542867),
(9, 0542867),
(10, 1542867);

insert into customers(person_id) values
(0045832),
(1045832),
(2045832),
(3045832),
(4045832),
(5045832),
(6045832),
(7045832),
(8045832),
(9045832);

insert into rooms(room_type,room_building,room_floor,room_status,status_last_update) values
('medium','A',2,'available','2021/07/12 10/00/38'),
('large','F',4,'available','2021/07/13 11/00/38'),
('couples','G',0,'available','2021/07/10 09/02/38'),
('baby','B',9,'available','2021/07/03 01/02/38'),
('medium','C',11,'available','2021/07/07 03/02/38'),
('medium','B',12,'available','2021/07/21 06/02/38'),
('sweet','D',10,'available','2021/07/22 07/02/38'),
('view','B',3,'available','2021/08/24 09/46/38'),
('couples','E',17,'available','2021/03/02 03/52/38'),
('medium','A',13,'available','2021/07/23 22/12/38');

insert into clean_log(emp_id,start_time,end_time,room_id) values
(5,'2021/07/25 20/07/25', '2021/07/25 21/07/25', 2),
(6,'2021/07/22 20/07/25', '2021/07/22 21/07/25', 1),
(6,'2021/07/21 20/07/25', '2021/07/21 20/17/25', 3),
(7,'2021/07/23 20/07/25', '2021/07/23 20/17/25', 5),
(8,'2021/07/30 20/07/25', '2021/07/30 20/47/25', 4),
(9,'2021/07/31 20/07/25', '2021/07/31 20/27/25', 6),
(10,'2021/07/02 20/07/25', '2021/07/02 22/07/25', 8),
(5,'2021/07/08 20/07/25', '2021/07/08 21/12/25', 7),
(6,'2021/07/09 20/07/25', '2021/07/09 21/03/25', 10),
(4,'2021/07/15 20/07/25', '2021/07/15 21/09/25', 9);

insert into reservations(emp_id,customer_id,room_id,check_in,check_out,time_executed) values 
('1', '1', '2', '2021/10/23 07/00/00', '2021/10/26 07/00/00', '2021/05/22 07/00/00'),
('1', '2', '4', '2021/07/07 07/00/00', '2021/07/09 07/00/00','2021/07/06 07/00/00'),
('2', '5', '6', '2021/07/25 07/00/00', '2021/07/29 07/00/00','2021/07/25 07/00/00'),
('3', '4', '6', '2021/08/10 07/00/00', '2021/08/12 07/00/00','2021/05/09 07/00/00'),
('3', '5', '6', '2021/09/06 07/00/00', '2021/09/07 07/00/00','2021/06/05 07/00/00'),
('3', '6', '9', '2021/09/21 07/00/00', '2021/09/25 07/00/00','2021/06/01 07/00/00'),
('2', '7', '1', '2021/06/02 07/00/00', '2021/06/07 07/00/00','2021/05/07 07/00/00'),
('3', '9', '1', '2021/06/07 07/10/00', '2021/06/09 07/00/00','2021/05/02 07/00/00'),
('2', '10', '10', '2021/08/01 07/10/00', '2021/08/03 07/00/00','2021/02/01 07/00/00'),
('3', '8', '5', '2021/07/29 07/10/00', '2021/07/31 07/00/00','2021/07/27 07/00/00');