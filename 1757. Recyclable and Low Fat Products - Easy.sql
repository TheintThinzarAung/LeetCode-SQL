SELECT product_id 
FROM taproduct
WHERE low_fats = 'Y' AND recyclable = 'Y';



















Create table If Not Exists taProduct (product_id int, low_fats ENUM('Y', 'N'), recyclable ENUM('Y','N'))
;
insert into taProduct (product_id, low_fats, recyclable) values ('0', 'Y', 'N')
,('1', 'Y', 'Y')
,('2', 'N', 'Y')
,('3', 'Y', 'Y')
,('4', 'N', 'N');