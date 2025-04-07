select a_name, avg(rating) as average_rating, count(*) as total_programs
from programs natural join advertise_by natural join agency
group by a_id, a_name
having count(*) > 0
order by average_rating desc, total_program desc, a_name asc