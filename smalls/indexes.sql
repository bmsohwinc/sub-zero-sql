-- sql-server

-- creates clustered index
alter table adult
add primary key (id)

-- creates non-clustered index
drop index if exists dbo.adult.nix_adult_hours_per_week

create nonclustered index nix_adult_hours_per_week
	on dbo.adult (hours_per_week)
	include (id)




select id from adult
where education in ('Some-college', 'Doctorate')

intersect


select id from adult
where hours_per_week > 30

