# Write your MySQL query statement below
select id from (
select *, lag(temperature) over (order by recordDate) as pre_temp,lag(recordDate) over (order by recordDate) as pre_date from weather) a
where temperature > pre_temp
and datediff(recordDate,pre_date) = 1;