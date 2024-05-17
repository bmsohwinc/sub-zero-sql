-- sql-server

create table charnvarchar(
	cname char(5),
	vcname varchar(5)
);

insert into charnvarchar values ('abcd', 'abcd'); -- PASS

insert into charnvarchar values ('abcde', 'abcde'); -- PASS

insert into charnvarchar values ('abcdef', 'abcdef'); -- throws truncation error as CHAR is limited to 5 characters

select * from charnvarchar
/*
cname	vcname
abcd 	abcd
abcde	abcde
*/
