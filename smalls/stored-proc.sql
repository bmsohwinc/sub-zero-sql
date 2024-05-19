-- Simple no param stored proc
create procedure GetUserPlaces
as
begin
  set nocount on -- doesn't return number of records, 
                 -- thus reducing network traffic
  
  select t1.*, t2.*
  from tforview1 t1
  join
  	tforview2 t2
  	on t1.id = t2.userid
  order by
  	t1.name
end

exec GetUserPlaces;

--------------------------------------------------------------

-- Stored Proc with Params
drop procedure if exists GetUserWithParams
create procedure GetUserWithParams
	(@age int)	
as
begin
	select t1.* from tforview1 t1
	where t1.age > @age		
end

exec GetUserWithParams 20;

--------------------------------------------------------------

-- Stored proc with output variable
drop procedure if exists GetUserWithOutput;

create procedure GetUserWithOutput
	(	
		@age int,
		@rcount int output
	)
as
begin
	select @rcount = count(*)
	from tforview1
	where age > @age
end;

declare @rcount int;
exec GetUserWithOutput 20, @rcount output;
select @rcount;

--------------------------------------------------------------

-- Modify Stored Proc
alter procedure GetUserWithOutput
	(
		@age int,
		@rcount int output
	)
as
begin
	select @rcount = count(*)
	from tforview1
	where age <= @age
end;


--------------------------------------------------------------

-- Renaming stored procs
sp_rename 'GetUserWithOutput', 'GetUserWithOutputVar'



