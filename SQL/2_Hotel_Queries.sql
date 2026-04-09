select u.user_id, u.name, b.room_no, b.booking_date
from users u, bookings b
where u.user_id = b.user_id
and b.booking_date = (
    select max(b2.booking_date)
    from bookings b2
    where b2.user_id = u.user_id
);

select bc.booking_id, bc.bill_id,
sum(bc.item_quantity * i.item_rate) as total_amount
from booking_commercials bc, items i
where bc.item_id = i.item_id
and month(bc.bill_date) = 11
and year(bc.bill_date) = 2021
group by bc.booking_id, bc.bill_id;

select bc.bill_id,
sum(bc.item_quantity * i.item_rate) as bill_amount
from booking_commercials bc, items i
where bc.item_id = i.item_id
and month(bc.bill_date) = 10
and year(bc.bill_date) = 2021
group by bc.bill_id
having sum(bc.item_quantity * i.item_rate) > 1000;

select month(bc.bill_date) as month_num,
i.item_name,
sum(bc.item_quantity) as total_ordered
from booking_commercials bc, items i
where bc.item_id = i.item_id
and year(bc.bill_date) = 2021
group by month(bc.bill_date), i.item_name
order by month_num, total_ordered desc;

select month(bc.bill_date) as month_num,
i.item_name,
sum(bc.item_quantity) as total_ordered
from booking_commercials bc, items i
where bc.item_id = i.item_id
and year(bc.bill_date) = 2021
group by month(bc.bill_date), i.item_name
order by month_num, total_ordered asc;

select month_num, customer_name, bill_amount
from (
    select month(bc.bill_date) as month_num,
    u.name as customer_name,
    sum(bc.item_quantity * i.item_rate) as bill_amount
    from booking_commercials bc, items i, bookings b, users u
    where bc.item_id = i.item_id
    and bc.booking_id = b.booking_id
    and b.user_id = u.user_id
    and year(bc.bill_date) = 2021
    group by month(bc.bill_date), u.name
    order by month_num, bill_amount desc
) as monthly_bills
group by month_num
having bill_amount = (
    select max(bill_amount)
    from (
        select month(bc2.bill_date) as mn,
        u2.name,
        sum(bc2.item_quantity * i2.item_rate) as bill_amount
        from booking_commercials bc2, items i2, bookings b2, users u2
        where bc2.item_id = i2.item_id
        and bc2.booking_id = b2.booking_id
        and b2.user_id = u2.user_id
        and year(bc2.bill_date) = 2021
        group by month(bc2.bill_date), u2.name
    ) as sub
    where sub.mn = month_num
    and bill_amount < (
        select max(bill_amount)
        from (
            select month(bc3.bill_date) as mn2,
            sum(bc3.item_quantity * i3.item_rate) as bill_amount
            from booking_commercials bc3, items i3
            where bc3.item_id = i3.item_id
            and year(bc3.bill_date) = 2021
            group by month(bc3.bill_date), u3.name, bc3.booking_id
            , u3.user_id
            join bookings b3 on bc3.booking_id = b3.booking_id
            join users u3 on b3.user_id = u3.user_id
        ) as sub2
        where sub2.mn2 = month_num
    )
);
