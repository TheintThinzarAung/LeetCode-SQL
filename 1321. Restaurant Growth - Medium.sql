select distinct visited_on, sum(amount) over ( order by visited_on
range between interval 6 day preceding and current row) as amount, 
round(sum(amount)over ( order by visited_on
range between interval 6 day preceding and current row)/7,2) as average_amount
from customer
limit 100000
offset 6