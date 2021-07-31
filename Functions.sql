-- Get number of floors of a building
DELIMITER $$
create function Max_Floors (building_id_ varchar(1)) Returns integer
READS SQL DATA
DETERMINISTIC
BEGIN
        DECLARE result integer;
        select num_of_floors
		into result
        from building
        where building_id_ = building_id;
		return result ;
end$$
DELIMITER ; //

-- Get a room's status
DELIMITER $$
create function get_room_status (room_num integer) Returns varchar (20)
READS SQL DATA
DETERMINISTIC
BEGIN
        DECLARE result varchar (40) ;
        select room_status
		into result
        from rooms
        where room_id = room_num;
		return result ;
end$$
DELIMITER ;

-- Get a room's number out of a given reservation number
DELIMITER $$
create function 
get_room_number_from_reservation(reservation_number integer) Returns integer 
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE result integer;
Select room_id
into result
from reservations
where reservation_number = res_id;
	return result ;
end$$
DELIMITER ;

DELIMITER $$
create function 
Total_Price(room_id integer, nights integer) returns integer
READS SQL DATA
deterministic
begin
declare result integer default 0;
select
 price*nights
 into  result from 
 rooms r 
	inner join room_type rt 
    on r.room_type = rt.type_id
	where r.room_id=room_id;
 return result ;
 end$$
 DELIMITER ;

