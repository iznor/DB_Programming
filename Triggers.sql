-- Check if floor is valid (on table update)
DELIMITER $$
create trigger check_floor_updt
before update on rooms
for each row
begin
	if new.room_floor > Max_Floors(new.room_building)
	then set new.room_floor= 0;
    end if;
end$$
DELIMITER //;
-- Check if floor is valid (on insertion)
DELIMITER $$
create trigger check_floor
before insert on rooms
for each row
begin
	if new.room_floor > Max_Floors(new.room_building)
	then set new.room_floor= 0;
    end if;
end$$
DELIMITER //;

-- Trigger To Calculate Reservation's Total Price on insertion 
DELIMITER $$
create trigger calc_total_price
before insert on reservations
for each row
begin
	set new.total_price = Total_Price(new.room_id, (datediff(new.check_out,new.check_in)));
 end$$
 DELIMITER //;

-- Trigger To Calculate Reservation's Total Price on update 
DELIMITER $$
create trigger calc_total_price_updt
before update on reservations
for each row
begin
	set new.total_price =
Total_Price(new.room_id,(datediff(new.check_out,new.check_in)));
end$$
DELIMITER //;

-- Save The Timestamp Of The Last Time Room Status Was Updated 
DELIMITER $$
create trigger status_updt
before update on rooms
for each row
 begin
	if new.room_status is not null
 	then set new.status_last_update= now();
    end if;
 end$$
 DELIMITER //;

-- Update a room's status when reserved (using the procedure) 
DELIMITER $$
create trigger update_status_after_new_reservation
after insert on reservations
for each row
begin
	call update_room_status(new.res_id);
 end$$
 DELIMITER //;

use hotel_test;
