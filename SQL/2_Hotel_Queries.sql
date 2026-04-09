SELECT u.user_id, u.name, b.room_no, b.booking_date
FROM users u
JOIN bookings b ON u.user_id = b.user_id
WHERE b.booking_date = (
    SELECT MAX(b2.booking_date)
    FROM bookings b2
    WHERE b2.user_id = u.user_id
);


SELECT
    bc.booking_id,
    bc.bill_id,
    SUM(bc.item_quantity * i.item_rate) AS total_bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(bc.bill_date) = 11 AND YEAR(bc.bill_date) = 2021
GROUP BY bc.booking_id, bc.bill_id;


SELECT
    bc.bill_id,
    SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(bc.bill_date) = 10 AND YEAR(bc.bill_date) = 2021
GROUP BY bc.bill_id
HAVING SUM(bc.item_quantity * i.item_rate) > 1000;


WITH monthly_totals AS (
    SELECT
        MONTH(bc.bill_date) AS month_num,
        i.item_name,
        SUM(bc.item_quantity) AS total_qty,
        RANK() OVER (PARTITION BY MONTH(bc.bill_date) ORDER BY SUM(bc.item_quantity) DESC) AS rnk_high,
        RANK() OVER (PARTITION BY MONTH(bc.bill_date) ORDER BY SUM(bc.item_quantity) ASC) AS rnk_low
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY MONTH(bc.bill_date), i.item_name
)
SELECT
    month_num,
    MAX(CASE WHEN rnk_high = 1 THEN item_name END) AS most_ordered,
    MAX(CASE WHEN rnk_low = 1 THEN item_name END) AS least_ordered
FROM monthly_totals
GROUP BY month_num
ORDER BY month_num;


WITH bill_totals AS (
    SELECT
        MONTH(bc.bill_date) AS month_num,
        u.name AS customer_name,
        bc.bill_id,
        SUM(bc.item_quantity * i.item_rate) AS bill_amount,
        DENSE_RANK() OVER (
            PARTITION BY MONTH(bc.bill_date)
            ORDER BY SUM(bc.item_quantity * i.item_rate) DESC
        ) AS rnk
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    JOIN bookings b ON bc.booking_id = b.booking_id
    JOIN users u ON b.user_id = u.user_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY MONTH(bc.bill_date), u.name, bc.bill_id
)
SELECT month_num, customer_name, bill_id, bill_amount
FROM bill_totals
WHERE rnk = 2
ORDER BY month_num;
