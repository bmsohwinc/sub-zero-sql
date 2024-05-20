
drop table if exists unqtable
create table unqtable (
	name nvarchar(20) unique, -- unique, but not set as primary key
	age int
);

insert into unqtable (name) values ('ram')

select * from unqtable

-- unique column 'name' allows NULL
insert into unqtable (age) values (10) 

-- make age column unique
alter table unqtable
add constraint UNQ_age unique (age)

-- throws UNQ_age constraint violation
insert into unqtable (name, age) values ('sam', 10)

-- fails, as primary key column can never be NULL
alter table unqtable
add primary key (name)


