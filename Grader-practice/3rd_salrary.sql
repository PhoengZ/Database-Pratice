select name, salary from employee 
where salary = (
    select distinct salary from employee 
    order by salary desc
    offset 2 limit 1
)
order by name asc 

