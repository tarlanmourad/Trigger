create trigger trg1
on database
for
drop_table
as 
print 'You do not have a permission to drop a table'
rollback;

create table test(
id int,
name nvarchar(30)
);

drop table test;

create trigger trg2
on test
for 
update
as print 'You do not have a permission to update a table'
rollback;

insert into test values(1,'Jack');

update test
set name='Mary'
where id=1

create trigger trg3
on test
after insert
as
begin
insert into test values(2,'Ali')
end

begin transaction 
begin try
begin
--commands
end 
commit transaction

begin catch
rollback transaction
end catch
