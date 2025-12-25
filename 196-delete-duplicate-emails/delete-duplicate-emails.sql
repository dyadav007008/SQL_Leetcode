# Write your MySQL query statement below
with a as (select id,rank() over (partition by email order by id asc) as rnk
from person)
delete from person where id in(
    select id from a where rnk >1
)