-- sql-server
create table tforview1 (
	id int,
	name varchar(20),
	age int,
);

create table tforview2 (
	userid int,
	place varchar(20),
);

insert into tforview1 values (1, 'ramesh', 23);
insert into tforview1 values (2, 'suresh', 32);
insert into tforview1 values (3, 'mahesh', 40);
insert into tforview1 values (4, 'alice', 20);

insert into tforview2 values (1, 'blore');
insert into tforview2 values (1, 'delhi');
insert into tforview2 values (2, 'blore');
insert into tforview2 values (3, 'madras');
insert into tforview2 values (3, 'nagpur');
insert into tforview2 values (4, 'bengal');


select * from tforview1;
select * from tforview2;

create view places_visited as 
select id, name, age, place 
from tforview1 join tforview2 on id = userid

select * from places_visited

select * from places_visited where age > 25

-- avg age of people visiting places
select place, AVG(age) as avg_age
from places_visited
group by place
order by 2 
