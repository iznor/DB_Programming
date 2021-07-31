-- Updating a status of a room
DELIMITER $$
create procedure update_room_status(
	IN reservation_id integer 
)
BEGIN
update rooms
set room_status = 'booked'  
where get_room_number_from_reservation(reservation_id)=rooms.room_id;
END$$ 
DELIMITER  ; //

-- Updating clean log 
DELIMITER $$
create procedure update_clean_log (
IN action_desc Varchar(10),
IN room_num integer,
IN employee_id integer 
)
BEGIN 
	start transaction;
update clean_log set emp_id=employee_id where room_id=room_num;
if	
		action_desc like "start"
then 
		update clean_log
		set start_time = now(), end_time = '0000/00/00 00/00/00'
		where room_num = room_id;
else	if
			action_desc like "end"
		then 
			update clean_log
			set end_time = now()
			where room_num = room_id;
end if;
end if;
END$$ 
DELIMITER  ; //
