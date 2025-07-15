select user_id , concat(upper(left(name,1)),lower(substring(name,2))) as name from tb_users;
 
Create table If Not Exists tb_Users (user_id int, name varchar(40));
select * from tb_users;
insert into tb_Users (user_id, name) values ('1', 'aLice');
insert into tb_Users (user_id, name) values ('2', 'bOB')