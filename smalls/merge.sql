-- sql-server

-- Goal: We want to synchronize table a and table b (want them to be exactly same!)
merge tformerge1 as target -- 'target' as alias is mandatory
using tforview1 as source -- 'source' as alias is mandatory
on target.id = source.id -- specify key for comparison

-- insert case (present in source, not matched by target)
when not matched by target then
	insert (id, name, age)
	values (source.id, source.name, source.age)

-- update case
when matched then update set
	target.name = source.name,
	target.age = source.age

-- delete case (present in target, not matched by source)
when not matched by source then
	delete;

