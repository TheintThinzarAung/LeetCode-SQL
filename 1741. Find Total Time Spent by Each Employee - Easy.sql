SELECT 
    event_day AS day,
    emp_id,
    SUM(out_time - in_time) AS total_time
FROM 
    taEmployees
GROUP BY 
    emp_id, event_day;


Create table taEmployees(emp_id int, event_day date, in_time int, out_time int);
insert into taEmployees (emp_id, event_day, in_time, out_time) values ('1', '2020-11-28', '4', '32')
,('1', '2020-11-28', '55', '200')
,('1', '2020-12-3', '1', '42')
,('2', '2020-11-28', '3', '33')
,('2', '2020-12-9', '47', '74');