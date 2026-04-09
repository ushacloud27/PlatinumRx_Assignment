select sales_channel,
sum(amount) as total_revenue
from clinic_sales
where year(datetime) = 2021
group by sales_channel
order by total_revenue desc;

select c.name,
sum(cs.amount) as total_spent
from clinic_sales cs, customer c
where cs.uid = c.uid
and year(cs.datetime) = 2021
group by c.name
order by total_spent desc
limit 10;

select
r.month_num,
r.revenue,
e.expense,
(r.revenue - e.expense) as profit,
case
    when (r.revenue - e.expense) > 0 then 'Profitable'
    else 'Not Profitable'
end as status
from
(
    select month(datetime) as month_num,
    sum(amount) as revenue
    from clinic_sales
    where year(datetime) = 2021
    group by month(datetime)
) as r,
(
    select month(datetime) as month_num,
    sum(amount) as expense
    from expenses
    where year(datetime) = 2021
    group by month(datetime)
) as e
where r.month_num = e.month_num
order by r.month_num;

select city, month_num, clinic_name, profit
from (
    select cl.city,
    month(cs.datetime) as month_num,
    cl.clinic_name,
    sum(cs.amount) as revenue,
    (
        select sum(ex.amount)
        from expenses ex
        where ex.cid = cl.cid
        and month(ex.datetime) = month(cs.datetime)
        and year(ex.datetime) = 2021
    ) as expense,
    sum(cs.amount) - (
        select sum(ex.amount)
        from expenses ex
        where ex.cid = cl.cid
        and month(ex.datetime) = month(cs.datetime)
        and year(ex.datetime) = 2021
    ) as profit
    from clinic_sales cs, clinics cl
    where cs.cid = cl.cid
    and year(cs.datetime) = 2021
    group by cl.city, month(cs.datetime), cl.clinic_name
    order by cl.city, month(cs.datetime), profit desc
) as clinic_data
group by city, month_num;

select state, month_num, clinic_name, profit
from (
    select cl.state,
    month(cs.datetime) as month_num,
    cl.clinic_name,
    sum(cs.amount) - (
        select sum(ex.amount)
        from expenses ex
        where ex.cid = cl.cid
        and month(ex.datetime) = month(cs.datetime)
        and year(ex.datetime) = 2021
    ) as profit
    from clinic_sales cs, clinics cl
    where cs.cid = cl.cid
    and year(cs.datetime) = 2021
    group by cl.state, month(cs.datetime), cl.clinic_name
    order by cl.state, month(cs.datetime), profit asc
) as state_data
group by state, month_num
having profit > min(profit);
