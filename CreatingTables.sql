use hotel_bamboosaka;

create table room_type(
		type_id varchar(20),
    	beds integer(1),
    	price integer,
		primary key(type_id)
);

create table building(
		building_id varchar(1),
    	num_of_floors integer,
		primary key(building_id)
);

create table room_status(
		status_id varchar(40),
		primary key(status_id)
);

create table persons(
		person_id integer primary key,
    	f_name varchar(50),
    	l_name varchar(50),
    	address varchar(50),
    	phone_num varchar(11)
);

create table employees(
		emp_id integer primary key auto_increment,
    	person_id integer,
    	foreign key(person_id) REFERENCES persons(person_id)
    	on update cascade on delete cascade
);

create table reception(
		emp_id integer primary key not null,
    	person_id integer unique not null,
    	foreign key (emp_id) references employees(emp_id),
		foreign key (person_id) references persons(person_id)
		on delete cascade on update cascade
);

create table cleaners(
		emp_id integer primary key,
    	person_id integer unique not null,
    	foreign key (emp_id) references employees(emp_id),
		foreign key (person_id) references persons(person_id)
		on delete cascade on update cascade
);

create table customers(
		customer_id integer primary key auto_increment,
    	person_id integer unique not null,
    	foreign key(person_id) REFERENCES persons(person_id)
    	on delete cascade on update cascade
);

create table rooms(
room_id integer primary key auto_increment not null,
    	room_type varchar(20) not null,
    	room_building varchar(1) not null,
    	room_floor integer not null, 
    	room_status varchar(20) not null,
    	status_last_update datetime default current_timestamp,
    	foreign key(room_type) references room_type(type_id),
    	foreign key(room_building) references building(building_id),
    	foreign key(room_status) references room_status(status_id)
    	on update cascade on delete cascade
);

create table clean_log(
		log_id integer primary key auto_increment,
    	emp_id integer,
    	start_time datetime not null,
    	end_time datetime not null,
		room_id integer,
    	foreign key(emp_id) references employees(emp_id),
    	foreign key(room_id) references rooms(room_id)
    	on update cascade on delete cascade
);

create table reservations(
    	res_id integer not null primary key auto_increment,
    	emp_id integer not null,
		customer_id integer not null,
    	room_id integer not null,
    	check_in datetime not null,
    	check_out datetime not null,
    	total_price integer default 0,
        time_executed datetime default(now()),
		foreign key(room_id) references rooms(room_id),
		foreign key(emp_id) references employees(emp_id),
    	foreign key(customer_id) references customers(customer_id)
		on update cascade on delete cascade
);
