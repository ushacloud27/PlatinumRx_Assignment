select sales_channel, sum(amount) as rev
from clinic_sales
where year(datetime) = 2021
group by sales_channel
order by rev desc;

select c.name, sum(cs.amount) as total
from clinic_sales cs, customer c
where cs.uid = c.uid
and year(cs.datetime) = 2021
group by c.name
order by total desc
limit 10;

select r.mn, r.rev, e.exp,
(r.rev - e.exp) as profit,
case when (r.rev - e.exp) > 0 then 'profitable'
else 'not profitable' end as status
from
(select month(datetime) as mn, sum(amount) as rev
from clinic_sales where year(datetime) = 2021
group by month(datetime)) as r,
(select month(datetime) as mn, sum(amount) as exp
from expenses where year(datetime) = 2021
group by month(datetime)) as e
where r.mn = e.mn
order by r.mn;

select city, mn, clinic_name, profit
from (
select cl.city, month(cs.datetime) as mn,
cl.clinic_name,
sum(cs.amount) - (select sum(e.amount) from expenses e
where e.cid = cl.cid
and month(e.datetime) = month(cs.datetime)
and year(e.datetime) = 2021) as profit
from clinic_sales cs, clinics cl
where cs.cid = cl.cid
and year(cs.datetime) = 2021
group by cl.city, month(cs.datetime), cl.clinic_name
order by cl.city, month(cs.datetime), profit desc
) as t
group by city, mn;

select state, mn, clinic_name, profit
from (
select cl.state, month(cs.datetime) as mn,
cl.clinic_name,
sum(cs.amount) - (select sum(e.amount) from expenses e
where e.cid = cl.cid
and month(e.datetime) = month(cs.datetime)
and year(e.datetime) = 2021) as profit
from clinic_sales cs, clinics cl
where cs.cid = cl.cid
and year(cs.datetime) = 2021
group by cl.state, month(cs.datetime), cl.clinic_name
order by cl.state, month(cs.datetime), profit asc
) as t
group by state, mn
having profit > min(profit);
