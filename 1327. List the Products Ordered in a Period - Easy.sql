select product_name, sq.unit from (select product_id , sum(unit) unit from orders 
where date_format(order_date, '%Y-%m') = '2020-02' 
group by product_id) as sq
join products p on p.product_id = sq.product_id 
where sq.unit >= 100