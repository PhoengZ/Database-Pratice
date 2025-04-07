select DName
from Departments natural join Employees
where Ename like '%son%' or Ename like '%Son'
group by DID,DName
order by count(*) desc, DName asc
limit 1