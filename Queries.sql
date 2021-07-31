select * from reservations order by customer_id;
update reservations set customer_id = 9 where customer_id =4;

-- QUERY 1 - Rooms & Status --------------------------------------------------------------
select room_id as 'Room Number', room_status 'Status' from rooms order by room_id;

-- QUERY 2 - Top 10 Reserved Rooms -------------------------------------------------------
select room_id as 'Room Number', count(res_id) as 'Times Ordered' from reservations group by room_id order by count(res_id) desc limit 10;

-- QUERY 3 - All Reservations From The Past 2 Weeks --------------------------------------
select * from reservations where datediff(now(),time_executed) <= 14 order by time_executed;

-- QUERY 4 - Show Top Cleaner ------------------------------------------------------------
select f_name as 'Employee First Name', l_name as 'Employee Last Name', count(room_id) as 'Rooms Cleaned'
from clean_log cl 
inner join employees e 
on cl.emp_id=e.emp_id 
inner join persons p 
on e.person_id=p.person_id
group by p.person_id
order by room_id
limit 1;

-- QUERY 5 - Show Active Reservations With Customers Details -----------------------------
select 	res_id as "Reservation ID", f_name as "Customer's First Name", l_name as "Customer's Last Name",
		room_id as "Room Number", check_in as 'Check In', check_out as 'Check Out', total_price as 'Price To Pay (in USD)' 
from reservations r
inner join customers c on r.check_in >= now() and r.customer_id=c.customer_id
inner join persons p on c.person_id=p.person_id
group by room_id order by r.check_in asc;

-- QUERY 6 - List Of Returning Customers (More Than One Reservation Commited) ------------
select f_name as "Customer's First Name", l_name as "Customer's Last Name",
		count(res_id) as 'Times Committed a Reservation'
from reservations r
inner join customers c on r.customer_id=c.customer_id
inner join persons p on c.person_id=p.person_id 
group by p.f_name having count(res_id)>1 order by count(res_id) desc ;



-- QUERY 7 - Total incomes per month -----------------------------------------------------
SELECT Month(check_in) as 'Month', sum(total_price) as 'Income'
FROM reservations
group by month(check_in);