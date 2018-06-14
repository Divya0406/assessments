select * 
from hotel_table;

select * 
from hotel_table where city='New York';

select name
,city 
from guest_table 
order by 2;

select * 
from room_table 
where type='N' 
order by price;

select count(hotel_no) 
from hotel_table;

select distinct(city) 
from guest_table;

select avg(price) 
from room_table;

select h.name, r.room_no, r.type 
from hotel_table h
join
room_table r 
on h.hotel_no= r.hotel_no;

select h.name,b.date_from,b.date_to,b.room_no 
from hotel_table h, booking_table b 
where b.hotel_no 
in
(select hotel_no 
from hotel_table 
where city='New York')
and 
h.hotel_no=b.hotel_no;


select h.name, r.room_no 
from hotel_table h, room_table r 
where h.hotel_no 
not in(
select distinct(hotel_no) 
from booking_table) 
and 
h.hotel_no=r.hotel_no;

select name, city 
where hotel_no 
in (
select hotel_no 
from room_table 
where price=(
select max(price) 
from room_table));

select h.name, r.room_no,r.price,h.city from hotel_table h
inner join
room_table r
on h.hotel_no=r.hotel_no
where 
r.price < (select min(price) from room_table where hotel_no in (select hotel_no from hotel_table where city= 'Boston'));

select h.city, avg(r.price) from hotel_table h 
inner join
room_table r 
on h.hotel_no= r.hotel_no
group by h.city;








