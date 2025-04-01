select room_type, count(*) as booking_count
from bookings
where check_in_date between '2024-01-01 00:00:00' and '2024-12-31 23:59:59'
group by room_type
order by booking_count desc, room_type asc
limit 1
