/*
 create database query;
add view;
 */
use query;
-- use utf8;
drop table if exists orders;
drop table if exists ticket;
drop table if exists airline;
drop table if exists passenger;
drop table if exists air_company;

create table air_company (
    cmpy_id VARCHAR(5),
    password varchar(45),
    primary key (cmpy_id)
) engine = InnoDB default charset = utf8;
create table airline (
    airline_ID VARCHAR(45) not null,
    departure_T TIME not null,
    arrival_T TIME not null,
    departure_airport VARCHAR(45) not null,
    arrival_airport VARCHAR(45) not null,
    air_trpe VARCHAR(45),
    cmpy_id varchar(5),
    FOREIGN KEY (cmpy_id) references air_company(cmpy_id),
    primary key (airline_ID)
) engine = InnoDB default charset = utf8;
create table ticket (
    ticket_id int not null,
    airline_ID VARCHAR(45) not null,
    seat_id VARCHAR(45) not null,
    dataa_ DATE not null,
    is_sale boolean default 0,
    primary key (ticket_id),
    FOREIGN KEY (airline_ID) REFERENCES airline(airline_ID)
) engine = InnoDB default charset = utf8;
create table passenger (
    psg_id int unsigned auto_increment,
    phone VARCHAR(45) UNIQUE not null,
    primary key (psg_id)
) engine = InnoDB default charset = utf8;
create table orders(
    order_id int unsigned,
    ticket_id int,
    buy_day DATE not null,
    psg_id int unsigned,
    primary key (order_id),
    foreign key (ticket_id) references ticket(ticket_id),
    foreign key (psg_id) references passenger(psg_id)
)engine = InnoDB default charset = utf8;


