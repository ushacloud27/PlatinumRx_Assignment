select u.user_id, u.name, b.room_no, b.booking_date
from users u, bookings b
where u.user_id = b.user_id
and b.booking_date = (select max(b2.booking_date) from bookings b2 where b2.user_id = u.user_id);

select bc.booking_id, bc.bill_id,
sum(bc.item_quantity * i.item_rate) as total
from booking_commercials bc, items i
where bc.item_id = i.item_id
and month(bc.bill_date) = 11
and year(bc.bill_date) = 2021
group by bc.booking_id, bc.bill_id;

select bc.bill_id,
sum(bc.item_quantity * i.item_rate) as amt
from booking_commercials bc, items i
where bc.item_id = i.item_id
and month(bc.bill_date) = 10
and year(bc.bill_date) = 2021
group by bc.bill_id
having amt > 1000;

select month(bc.bill_date) as mn,
i.item_name, sum(bc.item_quantity) as qty
from booking_commercials bc, items i
where bc.item_id = i.item_id
and year(bc.bill_date) = 2021
group by mn, i.item_name
order by mn, qty desc;

select month(bc.bill_date) as mn,
i.item_name, sum(bc.item_quantity) as qty
from booking_commercials bc, items i
where bc.item_id = i.item_id
and year(bc.bill_date) = 2021
group by mn, i.item_name
order by mn, qty asc;

select mn, cname, bill
from (
select month(bc.bill_date) as mn,
u.name as cname,
sum(bc.item_quantity * i.item_rate) as bill
from booking_commercials bc, items i, bookings b, users u
where bc.item_id = i.item_id
and bc.booking_id = b.booking_id
and b.user_id = u.user_id
and year(bc.bill_date) = 2021
group by mn, u.name
order by mn, bill desc
) as t
group by mn
having bill < max(bill);
